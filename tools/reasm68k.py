"""Reassemble the disasm/genesis/*.asm listings and compare to the original ROM.

Usage: python tools/reasm68k.py <disasm_dir> <rom.md> [out.md]
Parses only the instruction text (the comments are ignored), so a byte-identical
result proves the listings round-trip. Encoding uses the same ROWS table as the
disassembler: each candidate row is filled in from the operands, then decoded
again, and kept only if it decodes back to the same instruction.
"""
import glob
import os
import re
import sys

sys.path.insert(0, os.path.dirname(__file__))
from disasm68k import ROWS, SPECREG, decode, rev16  # noqa: E402
import names  # noqa: E402

CODE_NAMES = names.load("genesis")[0]

CANDIDATES = {}
for r in ROWS:
    CANDIDATES.setdefault(r[0].split(".")[0], []).append(r)

XREG = r"([DA][0-7]\.[WL])"
TGT = r"(?:L_|\$)([0-9A-F]{6})"
REGIDX = lambda s: int(s[1]) + (8 if s[0] == "A" else 0)


def parse_op(t):
    num = lambda sign, h: -int(h, 16) if sign else int(h, 16)
    for pat, make in (
        (r"([DA])([0-7])", lambda m: (m[1], int(m[2]))),
        (r"\(A([0-7])\)", lambda m: ("ind", int(m[1]))),
        (r"\(A([0-7])\)\+", lambda m: ("post", int(m[1]))),
        (r"-\(A([0-7])\)", lambda m: ("pre", int(m[1]))),
        (r"(-?)\$([0-9A-F]+)\(A([0-7])\)", lambda m: ("d16", num(m[1], m[2]), int(m[3]))),
        (r"(-?)\$([0-9A-F]+)\(A([0-7]),%s\)" % XREG, lambda m: ("d8x", num(m[1], m[2]), int(m[3]), m[4])),
        (TGT + r"\(PC\)", lambda m: ("pcd", int(m[1], 16))),
        (TGT + r"\(PC,%s\)" % XREG, lambda m: ("pcx", int(m[1], 16), m[2])),
        (r"\$([0-9A-F]{4})\.W", lambda m: ("absw", int(m[1], 16))),
        (r"\$([0-9A-F]{8})", lambda m: ("absl", int(m[1], 16))),
        (r"L_([0-9A-F]{6})", lambda m: ("lab", int(m[1], 16))),
        (r"\$([0-9A-F]{6})", lambda m: ("rel", int(m[1], 16))),
        (r"#([0-9]+)", lambda m: ("imm", int(m[1]), "q")),
        (r"#\$([0-9A-F]{2}|[0-9A-F]{4}|[0-9A-F]{8})", lambda m: ("imm", int(m[1], 16), {2: "b", 4: "w", 8: "l"}[len(m[1])])),
        (r"SR|CCR|USP", lambda m: ("lit", m[0])),
        (r"[DA][0-7](-[DA][0-7])?(/[DA][0-7](-[DA][0-7])?)*", lambda m: ("list", reg_mask(m[0]))),
    ):
        m = re.fullmatch(pat, t)
        if m:
            return make(m)
    raise ValueError(f"bad operand {t!r}")


def reg_mask(s):
    mask = 0
    for part in s.split("/"):
        a, _, b = part.partition("-")
        for i in range(REGIDX(a), REGIDX(b or a) + 1):
            mask |= 1 << i
    return mask


def split_ops(s):
    out, depth, cur = [], 0, ""
    for ch in s:
        if ch == "," and depth == 0:
            out.append(cur)
            cur = ""
            continue
        depth += (ch == "(") - (ch == ")")
        cur += ch
    return out + [cur] if cur else out


def brief(x, d):
    return REGIDX(x) << 12 | (0x800 if x.endswith("L") else 0) | (d & 0xFF)


def imm_words(op, size):
    assert op[0] == "imm" and op[2] == size
    return [op[1] >> 16, op[1] & 0xFFFF] if size == "l" else [op[1]]


def enc_ea(op, size, p):
    """(mode, reg, extension words) for an operand whose extension starts at p."""
    k = op[0]
    if k in ("D", "A", "ind", "post", "pre"):
        return ("D", "A", "ind", "post", "pre").index(k), op[1], []
    if k == "d16":
        return 5, op[2], [op[1] & 0xFFFF]
    if k == "d8x":
        return 6, op[2], [brief(op[3], op[1])]
    if k == "absw":
        return 7, 0, [op[1]]
    if k in ("absl", "lab"):
        return 7, 1, [op[1] >> 16, op[1] & 0xFFFF]
    if k == "pcd":
        return 7, 2, [(op[1] - p) & 0xFFFF]
    if k == "pcx":
        return 7, 3, [brief(op[2], op[1] - p)]
    return 7, 4, imm_words(op, size)


def encode_row(r, suf, ops, pc):
    mnem, _, value, fields, specs, size, order = r
    if len(ops) != len(specs):
        return None
    f = {}
    if mnem.endswith("{s}"):
        sz = suf.lower()
        if size == "s":
            f["s"] = "bwl".index(sz)
        elif size == "z":
            f["z"] = "wl".index(sz)
        elif sz != size:
            return None
    elif suf and specs != ["rel8"]:
        return None
    else:
        sz = size
    ext, listpos = [], None
    for i in order:
        spec, op = specs[i], ops[i]
        p = pc + 2 + 2 * len(ext)
        if spec in SPECREG:
            kind, c = SPECREG[spec]
            assert op[0] == kind
            f[c] = op[1]
        elif spec in ("#qx", "#v"):
            assert op[0] == "imm" and op[2] == "q"
            f[spec[-1]] = op[1] & 7 if spec == "#qx" else op[1]
        elif spec == "#i":
            assert op[0] == "imm" and op[2] == "b"
            f["b"] = op[1]
        elif spec in ("imm", "immw", "immb"):
            ext += imm_words(op, sz if spec == "imm" else spec[3])
        elif spec in ("SR", "CCR", "USP"):
            assert op == ("lit", spec)
        elif spec in ("rel8", "rel16"):
            assert op[0] in ("rel", "lab")
            d = op[1] - (pc + 2)
            if suf == "S":
                f["b"] = d & 0xFF
            else:
                f["b"] = 0
                ext.append(d & 0xFFFF)
        elif spec == "dAy":
            assert op[0] == "d16"
            f["y"] = op[2]
            ext.append(op[1] & 0xFFFF)
        elif spec == "list":
            listpos = len(ext)
            ext.append(op[1] if op[0] == "list" else 1 << REGIDX(f"{op[0]}{op[1]}"))
        else:
            mode, reg, words = enc_ea(op, sz, p)
            f["M" if spec[:2] == "EA" else "m"], f["R" if spec[:2] == "EA" else "r"] = mode, reg
            ext += words
    if listpos is not None and f.get("m") == 4:
        ext[listpos] = rev16(ext[listpos])
    word = value
    for c, bs in fields.items():
        v = f.get(c, 0)
        if not 0 <= v < 1 << len(bs):
            return None
        for i, b in enumerate(reversed(bs)):
            word |= (v >> i & 1) << b
    if any(not 0 <= e <= 0xFFFF for e in ext):
        return None
    return b"".join(x.to_bytes(2, "big") for x in [word] + ext)


def same(parsed, decoded):
    if parsed == decoded:
        return True
    if parsed[0] == "lab":
        return decoded[0] in ("rel", "absl") and decoded[1] == parsed[1]
    if parsed[0] in ("D", "A") and decoded[0] == "list":
        return decoded[1] == 1 << REGIDX(f"{parsed[0]}{parsed[1]}")
    return False


def encode(mnem, opstr, pc):
    base, _, suf = mnem.partition(".")
    ops = [parse_op(o) for o in split_ops(opstr)]
    for r in CANDIDATES.get(base, []):
        try:
            b = encode_row(r, suf, ops, pc)
        except (AssertionError, ValueError, KeyError, IndexError):
            continue
        d = b and decode(b, pc, org=pc)
        if d and d[0] == mnem and d[2] == len(b) and len(d[1]) == len(ops) \
                and all(same(p, q) for p, q in zip(ops, d[1])):
            return b
    raise ValueError(f"cannot encode {mnem} {opstr}")


def assemble(path, out, start):
    """Assemble one listing, which must begin at start; returns the address after its last byte."""
    pc = None
    for ln, line in enumerate(open(path), 1):
        text = names.unname(line.split(";", 1)[0].strip(), CODE_NAMES)
        if not text:
            continue
        try:
            if text.startswith("org "):
                pc = int(text[5:], 16)
                assert pc == start, f"org ${pc:06X} leaves a gap or overlap; previous listing ended at ${start:06X}"
            elif text.endswith(":"):
                lab = re.fullmatch(r"L_([0-9A-F]{6}):", text)
                assert not lab or int(lab.group(1), 16) == pc, f"label at wrong address {pc:06X}"
            else:
                if text.startswith("dc.b "):
                    b = bytes(int(v[1:], 16) for v in text[5:].split(","))
                elif text.startswith(("dc.w ", "dc.l ")):  # $hex or L_xxxxxx
                    size = 2 if text[3] == "w" else 4
                    b = b"".join(int(v.strip()[2 if v.strip().startswith("L_") else 1:], 16).to_bytes(size, "big")
                                 for v in text[5:].split(","))
                else:
                    mnem, _, ops = text.partition(" ")
                    b = encode(mnem, ops.strip(), pc)
                assert pc + len(b) <= len(out), f"runs past the end of the ROM at ${pc:06X}"
                out[pc:pc + len(b)] = b
                pc += len(b)
                start = pc
        except Exception as e:
            raise SystemExit(f"{path}:{ln}: {e}")
    return start


def main(asm_dir, rom_path, out_path=None):
    rom = open(rom_path, "rb").read()
    out = bytearray(len(rom))
    pc = 0
    for f in sorted(glob.glob(os.path.join(asm_dir, "rom_*.asm"))):
        pc = assemble(f, out, pc)
    if pc != len(rom):
        raise SystemExit(f"MISMATCH: listings end at ${pc:06X}, ROM is ${len(rom):06X} bytes")
    if out_path:
        open(out_path, "wb").write(out)
    diffs = [i for i in range(len(rom)) if rom[i] != out[i]]
    if diffs:
        raise SystemExit(f"MISMATCH: {len(diffs)} bytes differ, first at file offset ${diffs[0]:06X}")
    print(f"OK: {len(out)} bytes, identical to {os.path.basename(rom_path)}")


if __name__ == "__main__":
    main(*sys.argv[1:])
