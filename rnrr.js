// Rock N' Roll Racing password codec, ported from the SNES ROM ($81:BDE9 decode, $81:BF5D encode).
// The Genesis ROM ($8DF6 decode, $9004 encode) uses the identical algorithm, so passwords are interchangeable.
// The game packs fields into a 64-bit shift register ($13C4-$13CB), appends a 16-bit checksum,
// XORs with a fixed key and emits 12 symbols of 5 bits each.

export const ALPHABET = 'BCDFGHJKLMNPQRSTVWXYZ0123456789!';

// Push order from the encoder; the first field ends up in the last symbols.
// [name, bits]
export const FIELDS = [
  ['front', 3],   // front weapon charges
  ['rear', 3],    // rear weapon charges
  ['middle', 3],  // nitro / jump jet charges
  ['engine', 2],
  ['tires', 2],
  ['shocks', 2],
  ['armor', 2],
  ['car', 3],
  ['color', 3],   // encoded color slot (game remaps via $C364/$C36A; 0-4 valid)
  ['planet', 3],
  ['division', 1],// 0 = A, 1 = B
  ['character', 3],
  ['money0', 4],  // money is 3 BCD digits in thousands: money2 money1 money0
  ['money1', 4],
  ['money2', 4],
  ['difficulty', 2],
];

const KEY = 0xB29A56B2B2EBB200n;
const MASK = (1n << 64n) - 1n;
// Decoded values the game treats as a "skip to ending" password (verified on SNES).
// SNES $81:BE12 = "B0B! F1TC H!!!"; the Genesis port ($8E32) has the first three words byte-swapped.
export const SUPER = { [0xB7DBA76B53C44DF0n]: 'snes', [0xDBB76BA7C4534DF0n]: 'genesis' };

// $C266: shift n bits of v (LSB first) into the top of the register.
const push = (r, v, n) => {
  for (let i = 0; i < n; i++, v >>= 1) r = (r >> 1n) | (BigInt(v & 1) << 63n);
  return r;
};

// $C256: XOR of the four 16-bit words ^ $6573.
const checksum = r => Number(((r >> 48n) ^ (r >> 32n) ^ (r >> 16n) ^ r ^ 0x6573n) & 0xFFFFn);

const emit = r => {
  let s = '';
  for (let i = 0; i < 12; i++) s += ALPHABET[Number((r >> BigInt(59 - 5 * i)) & 31n)];
  return s.replace(/(.{4})(?=.)/g, '$1 ');
};

export function encode(f) {
  let r = 0n;
  for (const [name, bits] of FIELDS) {
    const v = f[name] ?? 0;
    if (!Number.isInteger(v) || v < 0 || v >= 1 << bits) throw new RangeError(`${name}=${v}`);
    r = push(r, v, bits);
  }
  r = push(r, checksum(r), 16);
  return emit(r ^ KEY);
}

// Returns field object, {super: true} for the special password, or null if invalid.
export function decode(pw) {
  const s = pw.toUpperCase().replace(/\s/g, '').replace(/O/g, '0');
  if (s.length !== 12) return null;
  let r = 0n;
  for (const c of s) {
    const v = ALPHABET.indexOf(c);
    if (v < 0) return null;
    r = (r << 5n) | BigInt(v);
  }
  r = (r << 4n) ^ KEY;
  if (SUPER[r]) return { super: SUPER[r] };
  const sum = Number(r >> 48n);
  r = (r << 16n) & MASK;
  if (checksum(r) !== sum) return null;
  const f = {};
  for (const [name, bits] of [...FIELDS].reverse()) {
    f[name] = Number(r >> BigInt(64 - bits));
    r = (r << BigInt(bits)) & MASK;
  }
  return f;
}

export const money = f => (f.money2 * 100 + f.money1 * 10 + f.money0) * 1000;
