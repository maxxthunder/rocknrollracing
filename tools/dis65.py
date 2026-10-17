"""Minimal 65816 disassembler for the LoROM SNES dump.
usage: python dis65.py ROM BANK:ADDR [count] [m x]   (m/x = 1 for 8-bit, default 1 1)
"""
import sys

# 16 rows of 16 "mnemonic:mode" entries, opcode = row*16 + col
OPS = """
brk:i8 ora:dx cop:i8 ora:sr tsb:d ora:d asl:d ora:[d] php: ora:iM asl:A phd: tsb:a ora:a asl:a ora:l
bpl:r ora:dy ora:(d) ora:sy trb:d ora:d,x asl:d,x ora:[d]y clc: ora:a,y inc:A tcs: trb:a ora:a,x asl:a,x ora:l,x
jsr:a and:dx jsl:l and:sr bit:d and:d rol:d and:[d] plp: and:iM rol:A pld: bit:a and:a rol:a and:l
bmi:r and:dy and:(d) and:sy bit:d,x and:d,x rol:d,x and:[d]y sec: and:a,y dec:A tsc: bit:a,x and:a,x rol:a,x and:l,x
rti: eor:dx wdm:i8 eor:sr mvp:bm eor:d lsr:d eor:[d] pha: eor:iM lsr:A phk: jmp:a eor:a lsr:a eor:l
bvc:r eor:dy eor:(d) eor:sy mvn:bm eor:d,x lsr:d,x eor:[d]y cli: eor:a,y phy: tcd: jml:l eor:a,x lsr:a,x eor:l,x
rts: adc:dx per:r16 adc:sr stz:d adc:d ror:d adc:[d] pla: adc:iM ror:A rtl: jmp:(a) adc:a ror:a adc:l
bvs:r adc:dy adc:(d) adc:sy stz:d,x adc:d,x ror:d,x adc:[d]y sei: adc:a,y ply: tdc: jmp:(a,x) adc:a,x ror:a,x adc:l,x
bra:r sta:dx brl:r16 sta:sr sty:d sta:d stx:d sta:[d] dey: bit:iM txa: phb: sty:a sta:a stx:a sta:l
bcc:r sta:dy sta:(d) sta:sy sty:d,x sta:d,x stx:d,y sta:[d]y tya: sta:a,y txs: txy: stz:a sta:a,x stz:a,x sta:l,x
ldy:iX lda:dx ldx:iX lda:sr ldy:d lda:d ldx:d lda:[d] tay: lda:iM tax: plb: ldy:a lda:a ldx:a lda:l
bcs:r lda:dy lda:(d) lda:sy ldy:d,x lda:d,x ldx:d,y lda:[d]y clv: lda:a,y tsx: tyx: ldy:a,x lda:a,x ldx:a,y lda:l,x
cpy:iX cmp:dx rep:i8 cmp:sr cpy:d cmp:d dec:d cmp:[d] iny: cmp:iM dex: wai: cpy:a cmp:a dec:a cmp:l
bne:r cmp:dy cmp:(d) cmp:sy pei:d cmp:d,x dec:d,x cmp:[d]y cld: cmp:a,y phx: stp: jml:[a] cmp:a,x dec:a,x cmp:l,x
cpx:iX sbc:dx sep:i8 sbc:sr cpx:d sbc:d inc:d sbc:[d] inx: sbc:iM nop: xba: cpx:a sbc:a inc:a sbc:l
beq:r sbc:dy sbc:(d) sbc:sy pea:a sbc:d,x inc:d,x sbc:[d]y sed: sbc:a,y plx: xce: jsr:(a,x) sbc:a,x inc:a,x sbc:l,x
""".split()
assert len(OPS) == 256

FMT = {  # mode -> (operand size, format)
    '': (0, ''), 'A': (0, 'A'), 'i8': (1, '#${:02X}'), 'd': (1, '${:02X}'), 'd,x': (1, '${:02X},x'),
    'd,y': (1, '${:02X},y'), 'dx': (1, '(${:02X},x)'), 'dy': (1, '(${:02X}),y'), '(d)': (1, '(${:02X})'),
    '[d]': (1, '[${:02X}]'), '[d]y': (1, '[${:02X}],y'), 'sr': (1, '${:02X},s'), 'sy': (1, '(${:02X},s),y'),
    'a': (2, '${:04X}'), 'a,x': (2, '${:04X},x'), 'a,y': (2, '${:04X},y'), '(a)': (2, '(${:04X})'),
    '(a,x)': (2, '(${:04X},x)'), '[a]': (2, '[${:04X}]'), 'l': (3, '${:06X}'), 'l,x': (3, '${:06X},x'),
    'bm': (2, '${:04X}'),
}


def off(bank, addr):  # LoROM
    return (bank & 0x7F) * 0x8000 + (addr & 0x7FFF)


def dis(rom, bank, addr, count=60, m=1, x=1):
    for _ in range(count):
        o = off(bank, addr)
        mn, mode = OPS[rom[o]].split(':')
        if mode == 'iM':
            n, fmt = 2 - m, '#${:0%dX}' % (4 - 2 * m)
        elif mode == 'iX':
            n, fmt = 2 - x, '#${:0%dX}' % (4 - 2 * x)
        elif mode in ('r', 'r16'):
            n = 1 if mode == 'r' else 2
            v = int.from_bytes(rom[o + 1:o + 1 + n], 'little')
            v -= (1 << 8 * n) if v >> (8 * n - 1) else 0
            n, fmt, tgt = n, '${:04X}', (addr + 1 + n + v) & 0xFFFF
        else:
            n, fmt = FMT[mode]
        raw = rom[o:o + 1 + n]
        val = int.from_bytes(raw[1:], 'little')
        text = fmt.format(tgt if mode in ('r', 'r16') else val) if fmt else ''
        print(f'{bank:02X}:{addr:04X}  {raw.hex():<8}  {mn} {text}')
        if mn in ('rep', 'sep'):
            bit = 0 if mn == 'rep' else 1
            if val & 0x20: m = bit
            if val & 0x10: x = bit
        addr += 1 + n


if __name__ == '__main__':
    rom = open(sys.argv[1], 'rb').read()
    b, a = sys.argv[2].split(':')
    rest = [int(v) for v in sys.argv[3:]]
    dis(rom, int(b, 16), int(a, 16), *rest)
