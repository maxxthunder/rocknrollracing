"""Recursive-descent 65816 disassembler for LoROM and HiROM SNES images.

Usage: python tools/disasm.py <rom.sfc> <outdir>
Traces code from the header vectors, tracking REP/SEP for M/X widths, and
writes one .asm listing per bank (32 KB LoROM, 64 KB HiROM). Unreached bytes are emitted as db.
Widths after a JSR/JSL are the ones the callee returns with (when all its exits
agree), and PLP restores the widths saved by the matching PHP.
JMP/JSR (abs,X) jump tables are followed (see jump_table). Other entry points are guessed
from pointers (see guesses) and kept only if every path decodes cleanly (see plausible);
add more to EXTRA_ENTRIES to grow coverage.
"""
import os
import sys

import names
import rnc

EXTRA_ENTRIES = []  # (snes_addr, m, x)

OPS = """
BRK imm8|ORA dpix|COP imm8|ORA sr|TSB dp|ORA dp|ASL dp|ORA dpil|PHP imp|ORA immM|ASL imp|PHD imp|TSB abs|ORA abs|ASL abs|ORA long
BPL rel|ORA dpiy|ORA dpi|ORA sriy|TRB dp|ORA dpx|ASL dpx|ORA dpily|CLC imp|ORA absy|INC imp|TCS imp|TRB abs|ORA absx|ASL absx|ORA longx
JSR abs|AND dpix|JSL long|AND sr|BIT dp|AND dp|ROL dp|AND dpil|PLP imp|AND immM|ROL imp|PLD imp|BIT abs|AND abs|ROL abs|AND long
BMI rel|AND dpiy|AND dpi|AND sriy|BIT dpx|AND dpx|ROL dpx|AND dpily|SEC imp|AND absy|DEC imp|TSC imp|BIT absx|AND absx|ROL absx|AND longx
RTI imp|EOR dpix|WDM imm8|EOR sr|MVP bm|EOR dp|LSR dp|EOR dpil|PHA imp|EOR immM|LSR imp|PHK imp|JMP abs|EOR abs|LSR abs|EOR long
BVC rel|EOR dpiy|EOR dpi|EOR sriy|MVN bm|EOR dpx|LSR dpx|EOR dpily|CLI imp|EOR absy|PHY imp|TCD imp|JML long|EOR absx|LSR absx|EOR longx
RTS imp|ADC dpix|PER rel16|ADC sr|STZ dp|ADC dp|ROR dp|ADC dpil|PLA imp|ADC immM|ROR imp|RTL imp|JMP absi|ADC abs|ROR abs|ADC long
BVS rel|ADC dpiy|ADC dpi|ADC sriy|STZ dpx|ADC dpx|ROR dpx|ADC dpily|SEI imp|ADC absy|PLY imp|TDC imp|JMP absix|ADC absx|ROR absx|ADC longx
BRA rel|STA dpix|BRL rel16|STA sr|STY dp|STA dp|STX dp|STA dpil|DEY imp|BIT immM|TXA imp|PHB imp|STY abs|STA abs|STX abs|STA long
BCC rel|STA dpiy|STA dpi|STA sriy|STY dpx|STA dpx|STX dpy|STA dpily|TYA imp|STA absy|TXS imp|TXY imp|STZ abs|STA absx|STZ absx|STA longx
LDY immX|LDA dpix|LDX immX|LDA sr|LDY dp|LDA dp|LDX dp|LDA dpil|TAY imp|LDA immM|TAX imp|PLB imp|LDY abs|LDA abs|LDX abs|LDA long
BCS rel|LDA dpiy|LDA dpi|LDA sriy|LDY dpx|LDA dpx|LDX dpy|LDA dpily|CLV imp|LDA absy|TSX imp|TYX imp|LDY absx|LDA absx|LDX absy|LDA longx
CPY immX|CMP dpix|REP imm8|CMP sr|CPY dp|CMP dp|DEC dp|CMP dpil|INY imp|CMP immM|DEX imp|WAI imp|CPY abs|CMP abs|DEC abs|CMP long
BNE rel|CMP dpiy|CMP dpi|CMP sriy|PEI dpi|CMP dpx|DEC dpx|CMP dpily|CLD imp|CMP absy|PHX imp|STP imp|JML absil|CMP absx|DEC absx|CMP longx
CPX immX|SBC dpix|SEP imm8|SBC sr|CPX dp|SBC dp|INC dp|SBC dpil|INX imp|SBC immM|NOP imp|XBA imp|CPX abs|SBC abs|INC abs|SBC long
BEQ rel|SBC dpiy|SBC dpi|SBC sriy|PEA abs|SBC dpx|INC dpx|SBC dpily|SED imp|SBC absy|PLX imp|XCE imp|JSR absix|SBC absx|INC absx|SBC longx
"""
OPS = [tuple(o.split()) for o in OPS.replace("\n", "|").strip("|").split("|")]
assert len(OPS) == 256

SIZE = {"imp": 1, "imm8": 2, "rel": 2, "rel16": 3, "bm": 3, "abs": 3, "absx": 3, "absy": 3,
        "absi": 3, "absix": 3, "absil": 3, "long": 4, "longx": 4}
FMT = {"imp": "", "imm8": "#${:02X}", "immM": "#${:0{w}X}", "immX": "#${:0{w}X}",
       "dp": "${:02X}", "dpx": "${:02X},X", "dpy": "${:02X},Y", "dpi": "(${:02X})",
       "dpix": "(${:02X},X)", "dpiy": "(${:02X}),Y", "dpil": "[${:02X}]", "dpily": "[${:02X}],Y",
       "sr": "${:02X},S", "sriy": "(${:02X},S),Y", "abs": "${:04X}", "absx": "${:04X},X",
       "absy": "${:04X},Y", "absi": "(${:04X})", "absix": "(${:04X},X)", "absil": "[${:04X}]",
       "long": "${:06X}", "longx": "${:06X},X"}
STOP = {"RTS", "RTL", "RTI", "JMP", "JML", "BRA", "BRL", "STP"}


HIROM = False  # set by set_map()


def set_map(rom):
    """Pick LoROM or HiROM from the map-mode byte of the header at $FFC0."""
    global HIROM
    HIROM = len(rom) > 0xFFFF and rom[0xFFD5] & 0xEF in (0x21, 0x25)
    return 0xFFC0 if HIROM else 0x7FC0


def to_off(addr):
    """SNES address -> file offset, or None if not ROM."""
    bank, lo = addr >> 16 & 0x7F, addr & 0xFFFF
    if HIROM:
        if bank in (0x7E, 0x7F) or (bank < 0x40 and lo < 0x8000):
            return None
        return (bank & 0x3F) << 16 | lo
    return bank * 0x8000 + lo - 0x8000 if lo >= 0x8000 else None


def to_addr(off):
    """File offset -> canonical address ($C0+ banks for HiROM, $80+ for LoROM)."""
    if HIROM:
        return 0xC00000 | off
    return 0x800000 | (off // 0x8000) << 16 | 0x8000 | (off % 0x8000)


def size_of(mode, m, x):
    if mode == "immM":
        return 2 if m else 3
    if mode == "immX":
        return 2 if x else 3
    return SIZE.get(mode, 2)


def target(name, mode, addr, n, arg):
    """Branch/jump/call destination, or None."""
    if mode == "rel":
        return (addr & 0xFF0000) | ((addr + n + (arg - 256 if arg > 127 else arg)) & 0xFFFF)
    if mode == "rel16" and name == "BRL":
        return (addr & 0xFF0000) | ((addr + n + arg) & 0xFFFF)
    if mode == "abs" and name in ("JSR", "JMP"):
        return (addr & 0xFF0000) | arg
    if mode == "long" and name in ("JSL", "JML"):
        return arg
    return None


def widths(name, arg, m, x, stk):
    """M/X widths and PHP stack after one instruction (PLP restores what PHP saved)."""
    if name == "REP":
        return m and not arg & 0x20, x and not arg & 0x10, stk
    if name == "SEP":
        return m or bool(arg & 0x20), x or bool(arg & 0x10), stk
    if name == "PHP":
        return m, x, stk + ((m, x),)
    if name == "PLP" and stk:
        return stk[-1][0], stk[-1][1], stk[:-1]
    return m, x, stk  # shortcut: XCE and unpaired PLP keep current widths


def returns(rom, addr, m, x, memo):
    """Widths a subroutine returns with, or None if unknown or its exits disagree."""
    key = (addr, m, x)
    if key in memo:
        return memo[key]
    memo[key] = None  # recursion guard
    exits, seen, work = set(), set(), [(addr, m, x, ())]
    while work and len(seen) < 5000:
        addr, m, x, stk = work.pop()
        while (off := to_off(addr)) is not None and off < len(rom) and (addr, m, x, stk) not in seen:
            seen.add((addr, m, x, stk))
            name, mode = OPS[rom[off]]
            n = size_of(mode, m, x)
            arg = int.from_bytes(rom[off + 1:off + n], "little")
            tgt = target(name, mode, addr, n, arg)
            if name in ("RTS", "RTL"):
                exits.add((m, x))
                break
            if name in ("JSR", "JSL") and tgt is not None:
                m, x = returns(rom, tgt, m, x, memo) or (m, x)
            else:
                if tgt is not None:
                    work.append((tgt, m, x, stk))
                m, x, stk = widths(name, arg, m, x, stk)
                if name in STOP or name in ("JSR", "JSL"):  # indirect call: give up on this path
                    break
            addr = (addr & 0xFF0000) | ((addr + n) & 0xFFFF)
    memo[key] = exits.pop() if len(exits) == 1 else None
    return memo[key]


def jump_table(rom, table, mask, stride, code, data):
    """Targets of a JMP/JSR (table,X) dispatch; marks the table's bytes as data.
    shortcut: length is guessed (index mask, first target, existing code, $0000/$FFFF words),
    handlers more than $1000 from the first are taken as the end, as are code, $0000/$FFFF and
    the index mask, so a table followed by nearby-looking words can still overshoot."""
    bank, targets, end = table & 0xFF0000, [], 0x10000
    limit = min(64, mask + 1 if mask is not None else 64)  # mask is applied before the index is doubled
    for i in range(limit):
        lo = (table + stride * i) & 0xFFFF
        off = to_off(bank | lo)
        if lo + 1 >= end or off is None or off + 1 >= len(rom) or off in code or off + 1 in code:
            break
        w = rom[off] | rom[off + 1] << 8
        if w in (0, 0xFFFF) or to_off(bank | w) is None or table & 0xFFFF <= w <= lo + 1                 or targets and abs(w - (targets[0] & 0xFFFF)) > 0x1000:
            break
        data.update((off, off + 1))
        targets.append(bank | w)
        if w > table & 0xFFFF:
            end = min(end, w)
    return targets


def trace(rom, entries, st=None):
    code, labels, data, memo = st or ({}, set(), set(), {})  # offset -> (size, m, x); label offsets; jump-table words
    work = [(a, m, x, ()) for a, m, x in entries]
    while work:
        addr, m, x, stk = work.pop()
        mask = None  # last AND #imm on this path, bounds a following jump table
        shift = stride = 0  # ASLs just before TAX give the table's entry size
        while True:
            off = to_off(addr)
            if off is None or off >= len(rom) or off in code or off in data:
                break
            name, mode = OPS[rom[off]]
            n = size_of(mode, m, x)
            if off + n > len(rom) or any(off + i in code or off + i in data for i in range(1, n)):
                break
            code[off] = (n, m, x)
            arg = int.from_bytes(rom[off + 1:off + n], "little")
            shift, prev_shift = (shift + 1 if name == "ASL" and mode == "imp" else 0), shift
            if name == "AND" and mode == "immM":
                mask = arg
            elif name == "TAX":
                stride = 1 << max(prev_shift, 1)
            elif name in ("JMP", "JSR") and mode == "absix":
                for t in jump_table(rom, (addr & 0xFF0000) | arg, mask, stride or 2, code, data):
                    labels.add(to_off(t))
                    work.append((t, m, x, ()))
            nxt = (addr & 0xFF0000) | ((addr + n) & 0xFFFF)
            tgt = target(name, mode, addr, n, arg)
            call = name in ("JSR", "JSL") and tgt is not None
            if tgt is not None and to_off(tgt) is not None and to_off(tgt) < len(rom):
                labels.add(to_off(tgt))
                work.append((tgt, m, x, () if call else stk))
            if call:
                m, x = returns(rom, tgt, m, x, memo) or (m, x)
            else:
                m, x, stk = widths(name, arg, m, x, stk)
            if name in STOP:
                break
            addr = nxt
    return code, labels, data, memo


def inside(code, off):
    """Is off in the middle of a known instruction?"""
    return any(off - k in code and code[off - k][0] > k for k in (1, 2, 3))


def plausible(rom, start, m, x, st, rare, limit=3000):
    """Would tracing from start with these widths decode cleanly: no opcode the traced code
    never uses (BRK/COP/WDM/STP and friends), no landing inside known code or jump tables,
    no running off ROM? Follows branches and calls like trace(). Used to vet guesses."""
    code, _, data, memo = st
    seen, work = set(), [(start, m, x, ())]
    while work:
        addr, m, x, stk = work.pop()
        while True:
            off = to_off(addr)
            if off is None or off >= len(rom) or off in data or len(seen) > limit:
                return False
            if off in code or (off, m, x) in seen:
                break
            name, mode = OPS[rom[off]]
            n = size_of(mode, m, x)
            if rom[off] in rare or inside(code, off) or any(off + i in code or off + i in data for i in range(1, n)):
                return False
            seen.add((off, m, x))
            arg = int.from_bytes(rom[off + 1:off + n], "little")
            tgt = target(name, mode, addr, n, arg)
            if tgt is not None:
                if to_off(tgt) is None and name in ("JSL", "JML") and tgt >> 16 & 0x7F < 0x7E:
                    return False
                if to_off(tgt) is not None:
                    work.append((tgt, m, x, () if name in ("JSR", "JSL") else stk))
            if name in ("JSR", "JSL") and tgt is not None:
                m, x = returns(rom, tgt, m, x, memo) or (m, x)
            else:
                m, x, stk = widths(name, arg, m, x, stk)
            if name in STOP:
                break
            addr = (addr & 0xFF0000) | ((addr + n) & 0xFFFF)
    return True


def guesses(rom, code):
    """Entry points suggested by pointers, as (snes_addr, m, x) using the widths at the
    referencing site: long pointers built by LDA #lo / STA a ... LDA #bank / STA a+2 (the
    object script pointers at $26/$2A), PEA #bank / PEA #lo pairs, and the bytes straight
    after an RTS/RTL/JMP/JML/BRA/BRL (routines only reached through RAM pointers).
    shortcut: the lo/bank stores must be within 8 instructions of each other."""
    out, stores, prev, pea = [], {}, None, None
    for i, off in enumerate(sorted(code)):
        n, m, x = code[off]
        name, mode = OPS[rom[off]]
        arg = int.from_bytes(rom[off + 1:off + n], "little")
        if name == "STA" and prev and prev[0] == "LDA" and prev[1] == "immM":
            key = (mode, arg)
            stores[key] = (prev[2], i)
            lo = stores.get((mode, arg - 2))
            if lo and i - lo[1] <= 8 and to_off(prev[2] << 16) is not None:
                out.append((prev[2] << 16 | lo[0], m, x))
        if name == "PEA":
            if pea is not None and to_off(pea << 16 | arg) is not None and pea < 0x100:
                out.append((pea << 16 | arg, m, x))
            pea = arg
        if name in STOP and name not in ("RTI", "STP"):
            out.append((to_addr(off + n), m, x))
        prev = (name, mode, arg)
    return out


def operand(rom, off, addr, name, mode, n, m, x, labels):
    arg = int.from_bytes(rom[off + 1:off + n], "little")
    if mode in ("rel", "rel16") and name != "PER":
        d = arg - (1 << 8 * (n - 1)) if arg >> (8 * (n - 1) - 1) else arg
        t = (addr & 0xFF0000) | ((addr + n + d) & 0xFFFF)
        return f"L_{to_addr(to_off(t)):06X}" if to_off(t) in labels else f"${t & 0xFFFF:04X}"
    if mode == "bm":
        return f"${rom[off + 2]:02X},${rom[off + 1]:02X}"
    if mode == "rel16":
        return f"${(addr + n + arg) & 0xFFFF:04X}"
    if name in ("JSR", "JMP") and mode == "abs":
        t = (addr & 0xFF0000) | arg
        if to_off(t) in labels:
            return f"L_{to_addr(to_off(t)):06X}"
    if name in ("JSL", "JML") and mode == "long" and to_off(arg) in labels and to_addr(to_off(arg)) == arg:
        return f"L_{arg:06X}"  # only when the label name is the exact operand, so reasm keeps the bank
    w = 2 if n == 2 else 4
    return FMT[mode].format(arg, w=w)


def ram_note(name, mode, arg, bank, ram):
    """Name of the RAM variable an instruction touches, if names.txt has it. Direct page is taken
    as $0000 only where the name allows that bank; absolute addresses below $2000 hit the low page."""
    if name in ("JSR", "JMP", "JSL", "JML", "PEA", "PER") or mode in ("rel", "rel16", "bm", "imp", "sr", "sriy")             or mode.startswith("imm"):
        return ""
    if mode.startswith("dp"):
        a, dp = 0x7E0000 | arg, True
    elif mode.startswith("long"):
        lo, b = arg & 0xFFFF, arg >> 16
        a, dp = (0x7E0000 | lo if b & 0x7F < 0x40 and lo < 0x2000 else arg), False
    else:
        a, dp = (0x7E0000 | arg if arg < 0x2000 else None), False
    hit = ram.get(a)
    if not hit:
        return ""
    if hit[1]:  # a direct-page name, valid only in its bank
        return hit[0] if dp and hit[1] == f"{bank:02X}" else ""
    return hit[0]


def main(rom_path, outdir):
    rom = open(rom_path, "rb").read()
    h = set_map(rom)
    vec = lambda o: int.from_bytes(rom[h + o:h + o + 2], "little")
    entries = [vec(0x24), vec(0x26), vec(0x2E), vec(0x2A), vec(0x3C)]  # COP, BRK, IRQ, NMI, RESET; names are in names.txt
    starts = [(0x800000 | a, True, True) for a in entries if a >= 0x8000] + EXTRA_ENTRIES
    st = trace(rom, starts)
    code, labels = st[0], st[1]
    rare = set(range(256)) - {rom[o] for o in code}  # opcodes the vector-reached code never uses
    while True:  # grow coverage from pointers until nothing new turns up
        found = 0
        for a, m, x in guesses(rom, code):
            if to_off(a) in code:
                continue
            for mx in dict.fromkeys([(m, x), (True, True), (False, False), (True, False), (False, True)]):
                if plausible(rom, a, *mx, st, rare):
                    labels.add(to_off(a))
                    trace(rom, [(a, *mx)], st)
                    found += 1
                    break
        if not found:
            break
    labels |= {to_off(a) for a, _, _ in starts}
    code_names, ram = names.load("snes")
    for a in code_names:
        o = to_off(a)
        assert o is not None and to_addr(o) == a and not inside(code, o), f"names.txt: ${a:06X} is not a label position"
        labels.add(o)

    regions = {}  # file offset of each RNC block: (end offset, title)
    for o in rnc.scan(rom):
        method, un, pk = rnc.header(rom, o)[:3]
        regions[o] = (o + rnc.HEADER + pk, f"RNC method {method} block: {pk} bytes packed, {un} unpacked (tools/rnc.py)")
    ends = {end for end, _ in regions.values()}

    os.makedirs(outdir, exist_ok=True)
    size = 0x10000 if HIROM else 0x8000
    for bank in range(len(rom) // size):
        off, end = bank * size, (bank + 1) * size
        org = to_addr(off)
        lines = [f"; bank ${org >> 16:02X}  (file offset ${off:06X})", f"org ${org:06X}", ""]
        while off < end:
            addr = to_addr(off)
            if off in ends:
                lines += ["; ---- end of region ----", ""]
            if off in regions:
                lines += ["", f"; ---- {regions[off][1]} (${addr:06X}-${to_addr(regions[off][0] - 1):06X}) ----"]
            if off in labels:
                lines.append(f"{code_names.get(addr, 'L_%06X' % addr)}:")
            if off in code:
                n, m, x = code[off]
                name, mode = OPS[rom[off]]
                ops = names.name_labels(operand(rom, off, addr, name, mode, n, m, x, labels), code_names)
                raw = " ".join(f"{b:02X}" for b in rom[off:off + n])
                note = ram_note(name, mode, int.from_bytes(rom[off + 1:off + n], "little"), addr >> 16, ram)
                lines.append(f"    {(name + ' ' + ops).strip():<32}; ${addr:06X}  {raw:<12} {'m' if m else 'M'}{'x' if x else 'X'}  {note}".rstrip())
                off += n
            else:
                stop = off + 1
                while stop < end and stop not in code and stop not in labels and stop not in regions                         and stop not in ends and stop - off < 16:
                    stop += 1
                lines.append(f"    db {','.join('$%02X' % b for b in rom[off:stop]):<64}; ${addr:06X}")
                off = stop
        open(os.path.join(outdir, f"bank_{org >> 16:02X}.asm"), "w").write("\n".join(lines) + "\n")
    print(f"{len(code)} instructions, {sum(v[0] for v in code.values())} code bytes "
          f"({100 * sum(v[0] for v in code.values()) / len(rom):.1f}% of ROM), {len(labels)} labels")


if __name__ == "__main__":
    main(sys.argv[1], sys.argv[2])
