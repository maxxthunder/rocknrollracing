"""Rob Northen Compression (RNC) unpacker, methods 1 and 2.

Usage: python tools/rnc.py <rom> [outdir]
Finds every RNC block in the ROM, unpacks it and checks both CRCs from its header. With
outdir, writes each block as <outdir>/<rom offset>.bin. The SNES game uses method 2 and
the Genesis game method 1.

Header (18 bytes, big-endian): "RNC", method, unpacked size (4), packed size (4),
unpacked CRC (2), packed CRC (2), leeway (1), chunk count (1).
"""
import os
import sys

HEADER = 18


def _crc_table():
    table = []
    for i in range(256):
        c = i
        for _ in range(8):
            c = c >> 1 ^ 0xA001 if c & 1 else c >> 1
        table.append(c)
    return table


CRC = _crc_table()


def crc16(data):
    c = 0
    for b in data:
        c = CRC[(c ^ b) & 0xFF] ^ c >> 8
    return c


def header(rom, off):
    """(method, unpacked size, packed size, unpacked CRC, packed CRC) if a plausible header is at off."""
    if rom[off:off + 3] != b"RNC" or rom[off + 3] not in (1, 2):
        return None
    un, pk = int.from_bytes(rom[off + 4:off + 8], "big"), int.from_bytes(rom[off + 8:off + 12], "big")
    if not 0 < pk <= len(rom) - off - HEADER or not 0 < un < 0x1000000:
        return None
    return rom[off + 3], un, pk, int.from_bytes(rom[off + 12:off + 14], "big"), int.from_bytes(rom[off + 14:off + 16], "big")


def _unpack_m1(src, size):
    """Method 1: Huffman-coded literal lengths, distances and match lengths; LSB-first bits read
    16 at a time, with literal bytes taken straight from the stream (after dernc.c)."""
    p = 0
    word = lambda q: src[q] | src[q + 1] << 8 if q + 1 < len(src) else (src[q] if q < len(src) else 0)
    buf, count = word(0), 16

    def advance(n):
        nonlocal buf, count, p
        buf >>= n
        count -= n
        if count < 16:
            p += 2
            buf |= word(p) << count
            count += 16

    def read(n):
        v = buf & ((1 << n) - 1)
        advance(n)
        return v

    def table():
        num = read(5)
        lens = [read(4) for _ in range(num)]
        out, code = [], 0
        for length in range(1, max(lens, default=0) + 1):
            for value, l in enumerate(lens):
                if l == length:
                    out.append((int(format(code, f"0{length}b")[::-1], 2), length, value))  # codes are stored bit-reversed
                    code += 1
            code <<= 1
        return out

    def decode(t):
        for code, length, value in t:
            if buf & ((1 << length) - 1) == code:
                advance(length)
                return value if value < 2 else 1 << value - 1 | read(value - 1)
        raise ValueError("bad Huffman code")

    out = bytearray()
    advance(2)  # lock and key flags
    while len(out) < size:
        raw, dist, lens = table(), table(), table()
        for chunk in range(read(16), 0, -1):
            n = decode(raw)
            if n:
                out += src[p:p + n]
                p += n
                count -= 16  # the newest 16 bits were the literal bytes: reload from after them
                buf = buf & ((1 << count) - 1) | word(p) << count
                count += 16
            if chunk == 1:
                break
            d, n = decode(dist) + 1, decode(lens) + 2
            for _ in range(n):
                out.append(out[-d])
    return bytes(out[:size])


def _unpack_m2(src, size):
    """Method 2: MSB-first bit flags interleaved with whole bytes (after the ProPack sources)."""
    p, bits, count = 0, 0, 0

    def bit():
        nonlocal p, bits, count
        if not count:
            bits, count, p = src[p], 8, p + 1
        count -= 1
        bits <<= 1
        return bits >> 8 & 1

    def byte():
        nonlocal p
        p += 1
        return src[p - 1]

    def offset():
        o = 0
        if bit():
            o = bit()
            if bit():
                o = (o << 1 | bit()) | 4
                if not bit():
                    o = o << 1 | bit()
            elif not o:
                o = bit() + 2
        return (o << 8 | byte()) + 1

    out = bytearray()
    bit(), bit()  # lock and key flags
    while len(out) < size:
        if not bit():
            out.append(byte())
            continue
        if not bit():  # 10: match of 4-8 bytes, or a run of literals
            n = bit() + 4
            if bit():
                n = (n - 1 << 1) + bit()
            if n == 9:
                n = (bit() << 3 | bit() << 2 | bit() << 1 | bit()) * 4 + 12
                out += src[p:p + n]
                p += n
                continue
            d = offset()
        elif not bit():  # 110: 2 bytes, one-byte distance
            n, d = 2, byte() + 1
        elif not bit():  # 1110: 3 bytes
            n, d = 3, offset()
        else:  # 1111: length byte + 8; 0 ends the chunk
            n = byte() + 8
            if n == 8:
                bit()
                continue
            d = offset()
        for _ in range(n):
            out.append(out[-d])
    return bytes(out[:size])


def unpack(rom, off):
    """Unpacked bytes of the RNC block at off; raises ValueError if a CRC doesn't match."""
    h = header(rom, off)
    if not h:
        raise ValueError(f"no RNC header at ${off:06X}")
    method, un, pk, ucrc, pcrc = h
    src = rom[off + HEADER:off + HEADER + pk]
    if crc16(src) != pcrc:
        raise ValueError(f"${off:06X}: packed CRC mismatch")
    out = (_unpack_m1 if method == 1 else _unpack_m2)(src, un)
    if len(out) != un or crc16(out) != ucrc:
        raise ValueError(f"${off:06X}: unpacked CRC mismatch")
    return out


def scan(rom):
    """Offsets of every block with a valid header and packed CRC."""
    found, off = [], rom.find(b"RNC")
    while off >= 0:
        h = header(rom, off)
        if h and crc16(rom[off + HEADER:off + HEADER + h[2]]) == h[4]:
            found.append(off)
            off += HEADER + h[2]
        else:
            off += 1
        off = rom.find(b"RNC", off)
    return found


def main(rom_path, outdir=None):
    rom = open(rom_path, "rb").read()
    bad = 0
    if outdir:
        os.makedirs(outdir, exist_ok=True)
    blocks = scan(rom)
    for off in blocks:
        method, un, pk, _, _ = header(rom, off)
        try:
            data = unpack(rom, off)
            status = "ok"
            if outdir:
                open(os.path.join(outdir, f"{off:06X}.bin"), "wb").write(data)
        except (ValueError, IndexError) as e:
            status, bad = f"FAILED: {e}", bad + 1
        print(f"${off:06X}  method {method}  {pk:6d} -> {un:6d} bytes  {status}")
    print(f"{len(blocks)} blocks, {len(blocks) - bad} unpacked with matching CRCs")
    return 1 if bad else 0


if __name__ == "__main__":
    sys.exit(main(*sys.argv[1:]))
