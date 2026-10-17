"""Reassemble the disasm/snes/*.asm listings and compare to the original ROM.

Usage: python tools/reasm.py <disasm_dir> <rom.sfc> [out.sfc]
Parses only the instruction text (the byte comments are ignored), so a
byte-identical result proves the listings round-trip.
"""
import glob
import os
import re
import sys

sys.path.insert(0, os.path.dirname(__file__))
from disasm import OPS, set_map, to_off  # noqa: E402
import names  # noqa: E402

CODE_NAMES = names.load("snes")[0]

OPCODE = {}
for i, (n, mo) in enumerate(OPS):
    OPCODE.setdefault((n, mo), i)

# operand syntax -> (mode family, hex group); family + digit count picks the mode
SYNTAX = [
    (r"#\$([0-9A-F]+)", "imm"), (r"\$([0-9A-F]{2}),\$([0-9A-F]{2})", "bm"),
    (r"\(\$([0-9A-F]+),S\),Y", "sriy"), (r"\$([0-9A-F]+),S", "sr"),
    (r"\(\$([0-9A-F]+),X\)", "ix"), (r"\(\$([0-9A-F]+)\),Y", "iy"), (r"\(\$([0-9A-F]+)\)", "i"),
    (r"\[\$([0-9A-F]+)\],Y", "ily"), (r"\[\$([0-9A-F]+)\]", "il"),
    (r"\$([0-9A-F]+),X", "x"), (r"\$([0-9A-F]+),Y", "y"), (r"\$([0-9A-F]+)", ""),
]
BY_DIGITS = {  # (family, digits) -> mode
    ("", 2): "dp", ("", 4): "abs", ("", 6): "long", ("x", 2): "dpx", ("x", 4): "absx",
    ("x", 6): "longx", ("y", 2): "dpy", ("y", 4): "absy", ("i", 2): "dpi", ("i", 4): "absi",
    ("ix", 2): "dpix", ("ix", 4): "absix", ("iy", 2): "dpiy", ("il", 2): "dpil", ("il", 4): "absil",
    ("ily", 2): "dpily", ("sr", 2): "sr", ("sriy", 2): "sriy",
}
BRANCH16 = {"BRL", "PER"}


def encode(name, ops, pc):
    """Return bytes for one instruction at SNES address pc."""
    branches = {n for n, mo in OPS if mo == "rel"} | BRANCH16
    if not ops:
        return bytes([OPCODE[(name, "imp")]])
    lab = re.fullmatch(r"L_([0-9A-F]{6})", ops)
    if name in branches:
        t = int(lab.group(1), 16) if lab else (pc & 0xFF0000) | int(ops[1:], 16)
        size = 3 if name in BRANCH16 else 2
        d = ((t & 0xFFFF) - ((pc + size) & 0xFFFF)) & 0xFFFF
        mode = "rel16" if name in BRANCH16 else "rel"
        if size == 2:
            assert d < 0x80 or d >= 0xFF80, f"branch out of range at {pc:06X}"
            return bytes([OPCODE[(name, mode)], d & 0xFF])
        return bytes([OPCODE[(name, mode)]]) + d.to_bytes(2, "little")
    if lab:
        t = int(lab.group(1), 16)
        if name in ("JSL", "JML"):
            return bytes([OPCODE[(name, "long")]]) + t.to_bytes(3, "little")
        return bytes([OPCODE[(name, "abs")]]) + (t & 0xFFFF).to_bytes(2, "little")
    for pat, fam in SYNTAX:
        m = re.fullmatch(pat, ops)
        if not m:
            continue
        if fam == "bm":  # MVN src,dest encodes as op, dest, src
            return bytes([OPCODE[(name, "bm")], int(m.group(2), 16), int(m.group(1), 16)])
        h = m.group(1)
        if fam == "imm":
            mode = next(mo for (n, mo) in OPCODE if n == name and mo in ("imm8", "immM", "immX"))
        else:
            mode = BY_DIGITS[(fam, len(h))]
        return bytes([OPCODE[(name, mode)]]) + int(h, 16).to_bytes(len(h) // 2, "little")
    raise ValueError(f"bad operand {ops!r} at {pc:06X}")


def assemble(path, out):
    pc = None
    for ln, line in enumerate(open(path), 1):
        text = names.unname(line.split(";", 1)[0].strip(), CODE_NAMES)
        if not text:
            continue
        try:
            if text.startswith("org "):
                pc = int(text[5:], 16)
            elif text.endswith(":"):
                lab = re.fullmatch(r"L_([0-9A-F]{6}):", text)
                assert not lab or int(lab.group(1), 16) == pc, f"label at wrong address {pc:06X}"
            else:
                if text.startswith("db "):
                    b = bytes(int(v[1:], 16) for v in text[3:].split(","))
                else:
                    name, _, ops = text.partition(" ")
                    b = encode(name, ops.strip(), pc)
                off = to_off(pc)
                assert off is not None and off + len(b) <= len(out), f"outside the ROM at {pc:06X}"
                out[off:off + len(b)] = b
                pc += len(b)
        except Exception as e:
            raise SystemExit(f"{path}:{ln}: {e}")


def main(asm_dir, rom_path, out_path=None):
    rom = open(rom_path, "rb").read()
    set_map(rom)
    out = bytearray(len(rom))
    for f in sorted(glob.glob(os.path.join(asm_dir, "bank_*.asm"))):
        assemble(f, out)
    if out_path:
        open(out_path, "wb").write(out)
    diffs = [i for i in range(len(rom)) if rom[i] != out[i]]
    if diffs:
        raise SystemExit(f"MISMATCH: {len(diffs)} bytes differ, first at file offset ${diffs[0]:06X}")
    print(f"OK: {len(out)} bytes, identical to {os.path.basename(rom_path)}")


if __name__ == "__main__":
    main(*sys.argv[1:])
