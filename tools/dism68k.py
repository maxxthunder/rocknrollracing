"""68000 helpers for the Genesis dump: python dism68k.py ROM ADDR [END]  (hex), or import sweep()."""
import sys
from capstone import Cs, CS_ARCH_M68K, CS_MODE_BIG_ENDIAN, CS_MODE_M68K_000

md = Cs(CS_ARCH_M68K, CS_MODE_BIG_ENDIAN | CS_MODE_M68K_000)


def dis(rom, start, end):
    for i in md.disasm(rom[start:end], start):
        print('%06X  %-20s %s %s' % (i.address, i.bytes.hex(), i.mnemonic, i.op_str))


def sweep(rom, start=0x200, end=None):
    """Linear sweep yielding (addr, mnemonic, op_str); resyncs on undecodable words."""
    end = end or len(rom)
    a = start
    while a < end:
        n = 0
        for i in md.disasm(rom[a:min(end, a + 0x1000)], a):
            yield i.address, i.mnemonic, i.op_str
            n = i.address + i.size
        a = n if n > a else a + 2


if __name__ == '__main__':
    rom = open(sys.argv[1], 'rb').read()
    s = int(sys.argv[2], 16)
    dis(rom, s, int(sys.argv[3], 16) if len(sys.argv) > 3 else s + 0x80)
