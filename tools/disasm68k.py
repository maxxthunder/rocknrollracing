"""Recursive-descent 68000 disassembler for Genesis / Mega Drive images.

Usage: python tools/disasm68k.py <rom.md> <outdir>
Traces code from the vector table and writes one .asm listing per 64 KB.
Unreached bytes are emitted as dc.b. tools/reasm68k.py reassembles the listings.
One table (ROWS) drives both decoding here and encoding in reasm68k.py.
shortcut: indirect jumps (JMP (An), computed tables) are not followed; add entry
points to EXTRA_ENTRIES to grow coverage.
"""
import os
import sys

import names
import rnc

EXTRA_ENTRIES = []  # addresses
REGIONS = {0x14D044: (0x14E263, "Z80 sound driver: copied to Z80 RAM $0000 by z80_load_driver")}  # start: (end, title)

CC = "T F HI LS CC CS NE EQ VC VS PL MI GE LT GT LE".split()
STOP = {"BRA", "JMP", "RTS", "RTE", "RTR", "ILLEGAL"}
RARE = {"ABCD", "SBCD", "NBCD", "MOVEP", "CHK", "TRAPV", "RESET", "STOP", "RTR", "TAS", "ILLEGAL", "NEGX"}


def rare(mnem, ops):
    """Instructions this game's code doesn't use but data decodes to; guessed code containing
    them is taken for data. ORI.B #n,Dn is how tables of small words decode."""
    base = mnem.split(".")[0]
    if base in ("ADDX", "SUBX"):
        return ops[0][0] == "pre"
    return base in RARE or mnem == "ORI.B" and ops[1][0] == "D"

# EA kinds 0-11: Dn An (An) (An)+ -(An) d16(An) d8(An,Xn) abs.W abs.L d16(PC) d8(PC,Xn) #imm
ALL = set(range(12))
CLS = {"all": ALL, "data": ALL - {1}, "ctl": {2, 5, 6, 7, 8, 9, 10}, "alt": set(range(9)),
       "dalt": set(range(9)) - {1}, "malt": set(range(2, 9)), "dnoimm": ALL - {1, 11}}
CLS["mvto"] = {2, 4, 5, 6, 7, 8}
CLS["mvfrom"] = CLS["ctl"] | {3}
SPECREG = {"Dx": ("D", "x"), "Dy": ("D", "y"), "Ax": ("A", "x"), "Ay": ("A", "y"),
           "(Ax)+": ("post", "x"), "(Ay)+": ("post", "y"), "-(Ax)": ("pre", "x"), "-(Ay)": ("pre", "y")}

ROWS = []  # (mnem, mask, value, fields, ops, size, read_order)


def row(mnem, pat, ops=(), size="", order=None):
    """pat: 16 chars of 0/1 or field letters (m,r = EA mode,reg; M,R = MOVE dest; x,y = regs;
    s = size bwl; z = size wl; b = byte; v = vector). size: field letter or fixed b/w/l."""
    pat = pat.replace(" ", "")
    assert len(pat) == 16, pat
    mask = int("".join("1" if c in "01" else "0" for c in pat), 2)
    value = int("".join(c if c in "01" else "0" for c in pat), 2)
    fields = {}
    for i, c in enumerate(pat):
        if c not in "01":
            fields.setdefault(c, []).append(15 - i)
    ROWS.append((mnem, mask, value, fields, list(ops), size, order or list(range(len(ops)))))


def b2(n, w):
    return format(n, f"0{w}b")


for name, code in (("ORI", 0), ("ANDI", 2), ("EORI", 10)):
    row(name, b2(code, 8) + "00111100", ["imm", "CCR"], "b")
    row(name, b2(code, 8) + "01111100", ["imm", "SR"], "w")
for name, code in (("ORI", 0), ("ANDI", 2), ("SUBI", 4), ("ADDI", 6), ("EORI", 10), ("CMPI", 12)):
    row(name + ".{s}", "0000" + b2(code, 4) + "ssmmmrrr", ["imm", "ea:dalt"], "s")
row("MOVEP.{s}", "0000xxx10z001yyy", ["dAy", "Dx"], "z")
row("MOVEP.{s}", "0000xxx11z001yyy", ["Dx", "dAy"], "z")
for t, name in enumerate(("BTST", "BCHG", "BCLR", "BSET")):
    row(name, "0000xxx1" + b2(t, 2) + "mmmrrr", ["Dx", "ea:data" if t == 0 else "ea:dalt"], "b")
    row(name, "00001000" + b2(t, 2) + "mmmrrr", ["immb", "ea:dnoimm" if t == 0 else "ea:dalt"])
for sz, bits in (("w", "11"), ("l", "10")):
    row("MOVEA.{s}", "00" + bits + "xxx001mmmrrr", ["ea:all", "Ax"], sz)
for sz, bits in (("b", "01"), ("w", "11"), ("l", "10")):
    row("MOVE.{s}", "00" + bits + "RRRMMMmmmrrr", ["ea:all", "EA:dalt"], sz)
row("MOVE.{s}", "0100000011mmmrrr", ["SR", "ea:dalt"], "w")
row("MOVE.{s}", "0100010011mmmrrr", ["ea:data", "CCR"], "w")
row("MOVE.{s}", "0100011011mmmrrr", ["ea:data", "SR"], "w")
row("MOVE.{s}", "0100111001100yyy", ["Ay", "USP"], "l")
row("MOVE.{s}", "0100111001101yyy", ["USP", "Ay"], "l")
for name, code in (("NEGX", 0), ("CLR", 2), ("NEG", 4), ("NOT", 6), ("TST", 10)):
    row(name + ".{s}", "0100" + b2(code, 4) + "ssmmmrrr", ["ea:dalt"], "s")
row("CHK.{s}", "0100xxx110mmmrrr", ["ea:data", "Dx"], "w")
row("LEA", "0100xxx111mmmrrr", ["ea:ctl", "Ax"])
row("NBCD", "0100100000mmmrrr", ["ea:dalt"], "b")
row("SWAP", "0100100001000yyy", ["Dy"])
row("PEA", "0100100001mmmrrr", ["ea:ctl"])
row("EXT.{s}", "0100100010000yyy", ["Dy"], "w")
row("EXT.{s}", "0100100011000yyy", ["Dy"], "l")
row("MOVEM.{s}", "010010001zmmmrrr", ["list", "ea:mvto"], "z")
row("MOVEM.{s}", "010011001zmmmrrr", ["ea:mvfrom", "list"], "z", [1, 0])  # mask word comes first
row("ILLEGAL", "0100101011111100")
row("TAS", "0100101011mmmrrr", ["ea:dalt"], "b")
row("TRAP", "010011100100vvvv", ["#v"])
row("LINK", "0100111001010yyy", ["Ay", "immw"])
row("UNLK", "0100111001011yyy", ["Ay"])
for name, code, ops in (("RESET", 0, []), ("NOP", 1, []), ("STOP", 2, ["immw"]), ("RTE", 3, []),
                        ("RTS", 5, []), ("TRAPV", 6, []), ("RTR", 7, [])):
    row(name, "0100111001110" + b2(code, 3), ops)
row("JSR", "0100111010mmmrrr", ["ea:ctl"])
row("JMP", "0100111011mmmrrr", ["ea:ctl"])
for c, cc in enumerate(CC):
    row("DB" + ("RA" if cc == "F" else cc), "0101" + b2(c, 4) + "11001yyy", ["Dy", "rel16"])
    row("S" + cc, "0101" + b2(c, 4) + "11mmmrrr", ["ea:dalt"], "b")
    row({"T": "BRA", "F": "BSR"}.get(cc, "B" + cc), "0110" + b2(c, 4) + "bbbbbbbb", ["rel8"])
row("ADDQ.{s}", "0101xxx0ssmmmrrr", ["#qx", "ea:alt"], "s")
row("SUBQ.{s}", "0101xxx1ssmmmrrr", ["#qx", "ea:alt"], "s")
row("MOVEQ", "0111xxx0bbbbbbbb", ["#i", "Dx"])
for line, (logic, mul, bcd) in (("1000", ("OR", "DIV", "SBCD")), ("1100", ("AND", "MUL", "ABCD"))):
    row(mul + "U.{s}", line + "xxx011mmmrrr", ["ea:data", "Dx"], "w")
    row(mul + "S.{s}", line + "xxx111mmmrrr", ["ea:data", "Dx"], "w")
    row(bcd, line + "xxx100000yyy", ["Dy", "Dx"])
    row(bcd, line + "xxx100001yyy", ["-(Ay)", "-(Ax)"])
    row(logic + ".{s}", line + "xxx0ssmmmrrr", ["ea:data", "Dx"], "s")
    row(logic + ".{s}", line + "xxx1ssmmmrrr", ["Dx", "ea:malt"], "s")
row("EXG", "1100xxx101000yyy", ["Dx", "Dy"])
row("EXG", "1100xxx101001yyy", ["Ax", "Ay"])
row("EXG", "1100xxx110001yyy", ["Dx", "Ay"])
for line, name in (("1001", "SUB"), ("1101", "ADD")):
    row(name + "A.{s}", line + "xxxz11mmmrrr", ["ea:all", "Ax"], "z")
    row(name + "X.{s}", line + "xxx1ss000yyy", ["Dy", "Dx"], "s")
    row(name + "X.{s}", line + "xxx1ss001yyy", ["-(Ay)", "-(Ax)"], "s")
    row(name + ".{s}", line + "xxx0ssmmmrrr", ["ea:all", "Dx"], "s")
    row(name + ".{s}", line + "xxx1ssmmmrrr", ["Dx", "ea:malt"], "s")
row("CMPA.{s}", "1011xxxz11mmmrrr", ["ea:all", "Ax"], "z")
row("CMPM.{s}", "1011xxx1ss001yyy", ["(Ay)+", "(Ax)+"], "s")
row("CMP.{s}", "1011xxx0ssmmmrrr", ["ea:all", "Dx"], "s")
row("EOR.{s}", "1011xxx1ssmmmrrr", ["Dx", "ea:dalt"], "s")
for t, kind in enumerate(("AS", "LS", "ROX", "RO")):
    for d, dirn in enumerate("RL"):
        row(kind + dirn + ".{s}", "1110xxx" + str(d) + "ss0" + b2(t, 2) + "yyy", ["#qx", "Dy"], "s")
        row(kind + dirn + ".{s}", "1110xxx" + str(d) + "ss1" + b2(t, 2) + "yyy", ["Dx", "Dy"], "s")
        row(kind + dirn + ".{s}", "11100" + b2(t, 2) + str(d) + "11mmmrrr", ["ea:malt"], "w")
BY_NIBBLE = [[r for r in ROWS if r[2] >> 12 == n] for n in range(16)]


def sx(v, bits):
    return v - (1 << bits) if v >> (bits - 1) & 1 else v


def rev16(m):
    return int(b2(m, 16)[::-1], 2)


def decode(rom, addr, org=0):
    """(mnemonic, operands, length) of the instruction at addr, or None.
    rom[i] holds address org + i. Operands are tuples, see fmt()."""
    if addr & 1:
        return None
    rd = lambda p: rom[p - org] << 8 | rom[p - org + 1]
    try:
        w = rd(addr)
        for r in BY_NIBBLE[w >> 12]:
            if w & r[1] == r[2]:
                res = decode_row(rd, addr, w, r)
                if res:
                    return res
    except IndexError:
        pass
    return None


def index_reg(e):
    return ("A" if e & 0x8000 else "D") + str(e >> 12 & 7) + (".L" if e & 0x800 else ".W")


def decode_ea(rd, k, reg, size, p):
    if k < 5:
        return (("D", "A", "ind", "post", "pre")[k], reg), p
    if k in (6, 10) and rd(p) & 0x700:  # 68000 brief extension word only
        return None, p
    if k == 5:
        return ("d16", sx(rd(p), 16), reg), p + 2
    if k == 6:
        return ("d8x", sx(rd(p) & 0xFF, 8), reg, index_reg(rd(p))), p + 2
    if k == 7:
        return ("absw", rd(p)), p + 2
    if k == 8:
        return ("absl", rd(p) << 16 | rd(p + 2)), p + 4
    if k == 9:
        return ("pcd", (p + sx(rd(p), 16)) & 0xFFFFFF), p + 2
    if k == 10:
        return ("pcx", (p + sx(rd(p) & 0xFF, 8)) & 0xFFFFFF, index_reg(rd(p))), p + 2
    if size == "b" and rd(p) < 0x100:
        return ("imm", rd(p), "b"), p + 2
    if size == "w":
        return ("imm", rd(p), "w"), p + 2
    if size == "l":
        return ("imm", rd(p) << 16 | rd(p + 2), "l"), p + 4
    return None, p


def decode_row(rd, addr, w, r):
    mnem, _, _, fields, specs, size, order = r
    f = {}
    for c, bs in fields.items():
        v = 0
        for b in bs:
            v = v << 1 | (w >> b) & 1
        f[c] = v
    if size == "s":
        if f["s"] == 3:
            return None
        size = "bwl"[f["s"]]
    elif size == "z":
        size = "wl"[f["z"]]
    out, p, suffix = [None] * len(specs), addr + 2, ""
    for i in order:
        spec = specs[i]
        if spec in SPECREG:
            op = (SPECREG[spec][0], f[SPECREG[spec][1]])
        elif spec == "#qx":
            op = ("imm", f["x"] or 8, "q")
        elif spec == "#v":
            op = ("imm", f["v"], "q")
        elif spec == "#i":
            op = ("imm", f["b"], "b")
        elif spec in ("imm", "immw", "immb"):
            op, p = decode_ea(rd, 11, 4, size if spec == "imm" else spec[3], p)
        elif spec in ("SR", "CCR", "USP"):
            op = ("lit", spec)
        elif spec in ("rel8", "rel16"):
            if spec == "rel8" and f["b"] == 0xFF:  # 68020 long branch
                return None
            if spec == "rel8" and f["b"]:
                d, suffix = sx(f["b"], 8), ".S"
            else:
                d, p, suffix = sx(rd(p), 16), p + 2, ".W" if spec == "rel8" else ""
            t = (addr + 2 + d) & 0xFFFFFF
            if t & 1:
                return None
            op = ("rel", t)
        elif spec == "dAy":
            op, p = ("d16", sx(rd(p), 16), f["y"]), p + 2
        elif spec == "list":
            m, p = rd(p), p + 2
            if not m:
                return None
            op = ("list", rev16(m) if f["m"] == 4 else m)
        else:  # ea:cls / EA:cls
            mode, reg = (f["M"], f["R"]) if spec[:2] == "EA" else (f["m"], f["r"])
            if mode == 7 and reg > 4:
                return None
            k = mode if mode < 7 else 7 + reg
            if k not in CLS[spec[3:]] or (k == 1 and size == "b"):
                return None
            op, p = decode_ea(rd, k, reg, size, p)
        if op is None:
            return None
        out[i] = op
    return mnem.replace("{s}", size.upper()) + suffix, out, p - addr


def ea_addr(op):
    """Address an absolute or PC-relative operand points at, or None."""
    if op[0] == "absw":
        return sx(op[1], 16) & 0xFFFFFF
    if op[0] in ("absl", "pcd", "pcx", "rel"):
        return op[1] & 0xFFFFFF
    return None


def signed(v):
    return f"-${-v:X}" if v < 0 else f"${v:X}"


def reglist(m):
    out = []
    for base, ch in ((0, "D"), (8, "A")):
        i = 0
        while i < 8:
            if m >> (base + i) & 1:
                j = i
                while j < 7 and m >> (base + j + 1) & 1:
                    j += 1
                out.append(f"{ch}{i}" + (f"-{ch}{j}" if j > i else ""))
                i = j
            i += 1
    return "/".join(out)


def fmt(op, labels):
    k = op[0]
    tgt = lambda t: f"L_{t:06X}" if t in labels else f"${t:06X}"
    if k in ("D", "A"):
        return f"{k}{op[1]}"
    if k == "ind":
        return f"(A{op[1]})"
    if k == "post":
        return f"(A{op[1]})+"
    if k == "pre":
        return f"-(A{op[1]})"
    if k == "d16":
        return f"{signed(op[1])}(A{op[2]})"
    if k == "d8x":
        return f"{signed(op[1])}(A{op[2]},{op[3]})"
    if k == "absw":
        return f"${op[1]:04X}.W"
    if k == "absl":
        return f"L_{op[1]:06X}" if op[1] in labels else f"${op[1]:08X}"
    if k == "pcd":
        return f"{tgt(op[1])}(PC)"
    if k == "pcx":
        return f"{tgt(op[1])}(PC,{op[2]})"
    if k == "imm":
        return f"#{op[1]}" if op[2] == "q" else f"#${op[1]:0{ {'b': 2, 'w': 4, 'l': 8}[op[2]]}X}"
    if k == "rel":
        return tgt(op[1])
    if k == "list":
        return reglist(op[1])
    return op[1]  # lit


def targets(mnem, ops, rom_len):
    """(code targets, data refs) of one instruction."""
    base = mnem.split(".")[0]
    code, data = [], []
    for op in ops:
        t = ea_addr(op)
        if t is None or t >= rom_len:
            continue
        if op[0] == "rel" or (base in ("JSR", "JMP") and op[0] != "pcx"):
            code.append(t)
        elif op[0] in ("pcd", "pcx") or base in ("LEA", "PEA"):
            data.append(t)
    return code, data


def ram_notes(ops, ram):
    """Names of the RAM variables an instruction touches: d16(A4)/d8(A4,Xn) offsets (A4 = $FF8000) and absolute addresses."""
    out = []
    for o in ops:
        a = (0xFF8000 + o[1]) & 0xFFFFFF if o[0] in ("d16", "d8x") and o[2] == 4 else ea_addr(o) if o[0] in ("absw", "absl") else None
        if a in ram:
            out.append(ram[a][0])
    return " ".join(out)


def trace(rom, entries, st):
    code, used, jumps, refs = st
    work = list(entries)
    while work:
        a = work.pop()
        while 0 <= a < len(rom) and not used[a]:
            d = decode(rom, a)
            if not d or any(used[a:a + d[2]]):
                break
            mnem, ops, n = d
            code[a] = d
            used[a:a + n] = b"" * n
            c, r = targets(mnem, ops, len(rom))
            jumps.update(c)
            refs.update(r)
            work += c
            if mnem.split(".")[0] in STOP:
                break
            a += n


def plausible(rom, start, code, used, limit=5000):
    """Would tracing from start decode cleanly (no invalid opcodes, no runs of zeros,
    no landing inside known code)? Used to vet guessed entry points."""
    seen, work = set(), [start]
    while work:
        a = work.pop()
        while a not in code and a not in seen:
            if not 0 <= a < len(rom) or used[a] or len(seen) > limit:
                return False
            d = decode(rom, a)
            if not d or any(used[a:a + d[2]]) or not any(rom[a:a + d[2]]) or rare(d[0], d[1]):
                return False
            seen.add(a)
            work += targets(d[0], d[1], len(rom))[0]
            if d[0].split(".")[0] in STOP:
                break
            a += d[2]
    return True


def guesses(rom, code):
    """Entry points suggested by pointers: MOVE.L #rom_addr, long tables read with
    MOVE.L tbl(PC,Dn), word-offset tables used by JMP base(PC,Dn), and the bytes
    straight after an RTS/BRA/JMP (routines only reached through RAM pointers).
    Returns (targets, table) pairs; table is ("l", address, None) or ("w", address, base) for the
    jump tables, so main() can print them as dc.l / dc.w.
    shortcut: tables run until an entry fails plausible() or 64 entries; LEA-loaded tables are not read."""
    rd = lambda p: int.from_bytes(rom[p:p + 2], "big")
    out, prev = [], None
    for a in sorted(code):
        mnem, ops, n = code[a]
        base = mnem.split(".")[0]
        for op in ops:
            if op[0] == "imm" and op[2] == "l" and 0x200 <= op[1] < len(rom) and not op[1] & 1:
                out.append(([op[1]], None))
        if base in ("MOVE", "MOVEA") and mnem.endswith(".L") and ops[0][0] == "pcx":
            t = ops[0][1]
            out.append(([int.from_bytes(rom[t + 4 * i:t + 4 * i + 4], "big") for i in range(64) if t + 4 * i + 4 <= len(rom)],
                        ("l", t, None)))
        if base == "JMP" and ops[0][0] == "pcx" and prev and prev[0] == "MOVE.W" and prev[1][0][0] == "pcx":
            t, b = prev[1][0][1], ops[0][1]
            out.append(([(b + sx(rd(t + 2 * i), 16)) & 0xFFFFFF for i in range(64) if t + 2 * i + 2 <= len(rom)], ("w", t, b)))
            out.append(([(b + sx(rd(t - 2 * i), 16)) & 0xFFFFFF for i in range(1, 64) if t - 2 * i >= 0], None))
        if base in STOP and a + n < len(rom):
            out.append(([a + n], None))
        prev = (mnem, ops)
    return out


def typed_data(rom, code, used, found):
    """{address: (size, value, target)} for the words to print as dc.l / dc.w: the vector table, and
    each jump table's entries up to the first one that isn't traced code."""
    typed = {4 * i: (4, int.from_bytes(rom[4 * i:4 * i + 4], "big"), None) for i in range(64)}
    for _, tab in found:
        if not tab:
            continue
        kind, t, b = tab
        size = 4 if kind == "l" else 2
        for p in range(t, min(t + 64 * size, len(rom) - size + 1), size):
            v = int.from_bytes(rom[p:p + size], "big")
            tgt = v if kind == "l" else (b + sx(v, 16)) & 0xFFFFFF
            if any(used[p:p + size]) or tgt not in code:
                break
            typed[p] = (size, v, tgt if kind == "w" else None)
    return typed


def main(rom_path, outdir):
    rom = open(rom_path, "rb").read()
    vec = lambda i: int.from_bytes(rom[i * 4:i * 4 + 4], "big")
    entries = [vec(i) for i in range(1, 64) if 0 < vec(i) < len(rom) and not vec(i) & 1] + EXTRA_ENTRIES
    st = code, used, jumps, refs = {}, bytearray(len(rom)), set(), set()
    trace(rom, entries, st)
    while True:  # grow coverage from pointers until nothing new turns up
        found = 0
        for seq, _ in guesses(rom, code):
            for t in seq:
                if t in code:
                    continue
                if t & 1 or not plausible(rom, t, code, used):
                    break
                jumps.add(t)
                trace(rom, [t], st)
                found += 1
        if not found:
            break
    code_names, ram = names.load("genesis")
    for t in code_names:
        assert t < len(rom) and (t in code or not used[t]), f"names.txt: ${t:06X} is inside an instruction"
    labels = {t for t in jumps | refs | set(entries) if t in code or not used[t]} | set(code_names)
    typed = typed_data(rom, code, used, guesses(rom, code))
    regions = dict(REGIONS)
    for off in rnc.scan(rom):
        method, un, pk = rnc.header(rom, off)[:3]
        regions[off] = (off + rnc.HEADER + pk, f"RNC method {method} block: {pk} bytes packed, {un} unpacked (tools/rnc.py)")
    ends = {end for end, _ in regions.values()}

    os.makedirs(outdir, exist_ok=True)
    a, chunk = 0, 0x10000
    while a < len(rom):
        start, end = a, min(a - a % chunk + chunk, len(rom))
        lines = [f"org ${a:06X}", ""]
        while a < end:
            if a in ends:
                lines += ["; ---- end of region ----", ""]
            if a in regions:
                lines += ["", f"; ---- {regions[a][1]} (${a:06X}-${regions[a][0] - 1:06X}) ----"]
            if a in labels:
                lines.append(f"{code_names.get(a, 'L_%06X' % a)}:")
            if a in code:
                mnem, ops, n = code[a]
                text = names.name_labels(f"{mnem} {','.join(fmt(o, labels) for o in ops)}".strip(), code_names)
                raw = " ".join(f"{rom[i] << 8 | rom[i + 1]:04X}" for i in range(a, a + n, 2))
                lines.append(f"    {text:<40}; ${a:06X}  {raw:<20} {ram_notes(ops, ram)}".rstrip())
                a += n
            elif a in typed:
                size, v, tgt = typed[a]
                lab = lambda t: code_names.get(t, f"L_{t:06X}") if t in labels else None
                if size == 4:
                    lines.append(f"    dc.l {lab(v) or '$%08X' % v:<59}; ${a:06X}")
                else:
                    lines.append(f"    dc.w ${v:04X}{'':<54}; ${a:06X}  -> {lab(tgt) or '$%06X' % tgt}")
                a += size
            else:
                stop = a + 1
                while stop < len(rom) and stop not in code and stop not in labels and stop not in typed                         and stop not in regions and stop not in ends and stop - a < 16:
                    stop += 1
                lines.append(f"    dc.b {','.join('$%02X' % b for b in rom[a:stop]):<64}; ${a:06X}")
                a = stop
        open(os.path.join(outdir, f"rom_{start >> 16:02X}.asm"), "w").write("\n".join(lines) + "\n")
    nbytes = sum(v[2] for v in code.values())
    print(f"{len(code)} instructions, {nbytes} code bytes ({100 * nbytes / len(rom):.1f}% of ROM), {len(labels)} labels")


if __name__ == "__main__":
    main(sys.argv[1], sys.argv[2])
