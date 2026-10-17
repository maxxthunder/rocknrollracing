"""Load disasm/names.txt, the names for code addresses and RAM variables. The disassemblers
print them; the reassemblers turn code names back into addresses."""
import os
import re

PATH = os.path.join(os.path.dirname(os.path.abspath(__file__)), "..", "disasm", "names.txt")
NAME = re.compile(r"\b[a-z_][a-z0-9_]*\b")  # names are lowercase, so they never clash with mnemonics or registers


def load(platform):
    """({address: name} for code, {address: (name, bank or None)} for RAM) for "snes" or "genesis".
    SNES addresses below $10000 are taken as bank $7E (the low page mirrored in every bank)."""
    code, ram, seen = {}, {}, set()
    for ln, line in enumerate(open(PATH, encoding="utf-8"), 1):
        f = line.split("#", 1)[0].split()
        if not f or f[0] != platform:
            continue
        _, kind, addr, name, *scope = f
        where = f"names.txt:{ln}"
        assert NAME.fullmatch(name), f"{where}: {name!r} must be lowercase letters, digits and _"
        assert name not in seen and name not in ("dc", "b", "org"), f"{where}: {name} is taken"
        seen.add(name)
        a = int(addr.lstrip("$"), 16)
        if kind == "code":
            code[a] = name
        elif kind == "ram":
            ram[a | 0x7E0000 if platform == "snes" and a < 0x10000 else a] = (name, scope[0].upper() if scope else None)
        else:
            raise ValueError(f"{where}: kind must be code or ram")
    return code, ram


def name_labels(text, code):
    """Replace L_xxxxxx with the name of that address, where it has one."""
    return re.sub(r"L_([0-9A-F]{6})", lambda m: code.get(int(m[1], 16), m[0]), text)


def unname(text, code):
    """Replace code names with L_xxxxxx, for the reassemblers."""
    by_name = {n: a for a, n in code.items()}
    return NAME.sub(lambda m: f"L_{by_name[m[0]]:06X}" if m[0] in by_name else m[0], text)
