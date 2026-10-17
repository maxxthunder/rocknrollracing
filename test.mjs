// node test.mjs — round-trips published passwords through the ROM-derived codec.
import assert from 'node:assert';
import { decode, encode, money } from './rnrr.js';

const known = `XGL0 RS2V WS6M|989Y C02V WS6M|J89! C02V WS6M|4HFT C0P0 5TJ!|RJWW SHVX 921!
XB48 RSFW 0S6M|5CR8 RLCW 0S6S|RKBR !8F5 SWJ!|HZLR 1MC5 SWJ!|RNDQ MQFD SWJ!|GBJQ 7SCD SWJ!
R1LQ 2MFN SWJ!|DHQT S6CN SWJ!|MFBR R8DX SWJ!|VQY8 !RBV 5TJ!|48F8 20D3 5TJ!|XBF7 MHB3 5TJ!
RV2H RS21 5WJ!|8V2H RSY1 5WJ!|RV20 RS!1 5WJ!|8V20 RS61 5WJ!|RV1H RSK1 5WJ!|8V1H RSF1 5WJ!
RV10 RST1 5WJ!|8V10 RSP1 5WJ!|HV2C RS21 5WJ!|0V2W RS61 5WJ!|8V2R RS21 5WJ!|RV18 RSP1 5WJ!`
  .split(/[|\n]/);

let ok = 0;
for (const pw of known) {
  const f = decode(pw);
  if (!f) { console.log('INVALID', pw); continue; }
  ok++;
  if (!f.super) assert.strictEqual(encode(f), pw, pw);
  console.log(pw, f.super ? 'SUPER' : JSON.stringify({ ...f, $: money(f) }));
}
assert.strictEqual(decode('BBBB BBBB BBBB'), null);
assert.deepStrictEqual(decode('B0B! F1TC H!!!'), { super: 'snes' });
assert.deepStrictEqual(decode('RG1Y 5HP1 2F!!'), { super: 'genesis' });
console.log(`${ok}/${known.length} valid`);
