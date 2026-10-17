"""List code that reads the joypad RAM vars, with the following instruction for context."""
import sys, re, io, contextlib
sys.path.insert(0, 'tools')
from dis65 import dis
rom = open(sys.argv[1], 'rb').read()
VARS = {0x033D: 'P1held', 0x033E: 'P1held+1', 0x034D: 'P1new', 0x034E: 'P1new+1',
        0x033F: 'P2held', 0x0340: 'P2held+1', 0x034F: 'P2new', 0x0350: 'P2new+1'}
READ = {0xAD, 0x2D, 0x0D, 0x4D, 0xCD, 0x2C, 0xAE, 0xAC, 0xEC, 0xCC, 0x1C, 0x0C,  # abs
        0xB9, 0xBD, 0x39, 0x3D, 0x19, 0x1D, 0x59, 0x5D, 0xD9, 0xDD, 0xBC, 0xBE, 0x3C}  # indexed
for addr, name in VARS.items():
    for m in re.finditer(re.escape(bytes([addr & 0xFF, addr >> 8])), rom):
        i = m.start() - 1
        if rom[i] not in READ: continue
        bank, pc = 0x80 | i // 0x8000, 0x8000 + i % 0x8000
        if bank > 0x8F: continue  # code lives in low banks
        buf = io.StringIO()
        with contextlib.redirect_stdout(buf):
            dis(rom, bank, pc, 4, 0, 0)
        lines = [l.split('  ', 2)[2].strip() for l in buf.getvalue().splitlines()]
        print(f'{bank:02X}:{pc:04X} {name:9} | ' + ' ; '.join(lines))
