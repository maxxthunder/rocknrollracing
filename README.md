# Rock N' Roll Racing — Password Generator & Secrets

**[Open the password generator →](https://maxxthunder.github.io/rocknrollracing/)** &nbsp;[![v1.2.0](https://img.shields.io/badge/version-1.2.0-e8432c)](CHANGELOG.md)

- **Make a password** for any racer, planet, division, car, upgrades, weapons and money.
- **Decode a password** you already have to see what it holds, and fix typos.
- **Glitch mode** for values the game never makes itself.
- Works on **Super Nintendo** and **Genesis**: both versions use the same password algorithm, so a password from one works on the other.
- The US, European and Japanese releases all take the same passwords (see [Regions and the GBA version](#regions-and-the-gba-version)).

Everything below comes from disassembling both ROMs and testing in BizHawk 2.11. Codes marked **NEW** aren't listed on GameFAQs.

## All codes

Press each button in a sequence separately. A repeated button means release it and press it again.

### Super Nintendo

| Where | Input | Effect | |
|---|---|---|---|
| Title → Password | `B0B! F1TC H!!!` | Skips straight to the ending and credits | **NEW** |
| Character select | Highlight Tarquinn, hold L+R+Select, press Right | Olaf | Known |
| VS mode planet select | Highlight NHO, hold L+R+Select, press Right | Inferno | Known |
| Pre-race menu | R, Right, Down, Left, L, Up, Select | +$250,000 (repeatable) | **NEW** |
| Buy Equipment | R, Right, R, L, Left, L, Up, Down, Up, Select | Infinite weapon charges | **NEW** |
| Advance a Level¹ | Left, Right, L, R, Y, A, X, B, Down, Up, Select | Score set to the amount needed to advance | **NEW** |
| Set Options² | Down, Left, Up, Right, R, Down, Right, Up, Left, L, Up, Select | Drive off the track without falling | **NEW** |
| Set Options, Larry row (Larry ON) | R / L step forward / back through the clips (wrapping 0–39), Select replays | Announcer voice test, 40 clips | Known as a workaround; the direct L/R method is new |

### Genesis

| Where | Input | Effect | |
|---|---|---|---|
| Title → Password | `RG1Y 5HP1 2F!!` | Skips to the ending | Known |
| Character select / VS planet select | Up, Right, Up, Right, Down, Left, Down, Left, Right | Olaf (one Left of Snake Sanders) / Inferno (after NHO) | Known |
| Pre-race menu | Up, Right, Down, Left, Up, Left, Down, Right, Up | +$250,000 (repeatable: move the cursor away and back between uses) | Known |
| Buy Equipment | Down, Down, Down, Up, Down, Left, Right, Left, Down | Infinite weapon charges (rivals get them too) | Known |
| Advance a Level¹ | Left, Right, Left, Right, B, C, then hold A+B+Start | Score set to the amount needed to advance | **NEW** |
| Set Options | Down, Left, Up, Right, Down, Right, Up, Left, Right, Left | Drive anywhere | Known |

¹ The Japanese Super Famicom version drops the Y: Left, Right, L, R, A, X, B, Down, Up, Select. Press Left first so the advance arrow is highlighted. If the cursor is on EXIT, the face buttons in the code quit the screen. Once the code is in, the screen exits. Choose Advance a Level again and it lets you through.
² Start with the cursor on MUSIC. The code's Left/Right presses toggle settings, but they cancel each other out. Starting on EXIT quits the menu instead.

### Game Boy Advance

The GBA port is the SNES code recompiled, so it keeps the SNES codes with GBA buttons standing in (the GBA reports L, R, Select and the D-pad with the same bits as the SNES). The Advance code was rewritten because the GBA has no X or Y. Online GBA cheat lists only have GameShark and Action Replay codes, so all of these are **NEW** for the GBA.

| Where | Input | Effect | Tested |
|---|---|---|---|
| Character select | Highlight Tarquinn, hold L+R+Select, press Right | Olaf | Yes |
| VS mode planet select | Highlight NHO, hold L+R+Select, press Right | Inferno | Yes |
| Pre-race menu | R, Right, Down, Left, L, Up, Select | +$250,000 (repeatable) | Yes |
| Buy Equipment | R, Right, R, L, Left, L, Up, Down, Up, Select | Infinite weapon charges | Yes |
| Advance a Level¹ | Left, Right, L, L, L, R, R, R, Down, Up, Select | Score set to the amount needed to advance | Yes |
| Set Options² | Down, Left, Up, Right, R, Down, Right, Up, Left, L, Up, Select | Drive off the track without falling | Yes |

Every code on this page was run in BizHawk and its effect checked in RAM or on screen, on the US ROMs (and the Japanese Super Famicom for its Advance code). The four sequence tables are at `0x08032CBC` (Buy Equipment), `0x0803AA6F` (pre-race), `0x0803BF4B` (options) and `0x08046C31` (advance). The matcher is at `0x08032CD4`, and it has exactly four callers. The two hold-button checks are at `0x08036384` and `0x0803657C`. The European GBA ROM has the same tables.

### Glitch passwords (both systems)

| Password | Effect | |
|---|---|---|
| `GGMR RSSB WS6M` | The game creates this password after the BOB FITCH ending. It puts Olaf in Division B on planet 6, which doesn't exist. The pre-race screen reads "Races run 0 of 0" with garbled images, and START RACE gives a black screen that never recovers. | **NEW** |
| `T5D7 HQPV SWJ!` | Unnamed secret racer (character 7) | Known |
| `34D0 RQN7 1WJ!` | Corrected version of the published `R4D0 RQN7 1WJ!`, which doesn't pass the game's password check | **NEW** fix |

To make other glitch passwords, turn on Glitch mode in the generator. It unlocks money digits 10–15, colors 5–7, planets 6–7, cars 5–7 and difficulty 3.

## The BOB FITCH password

The name comes from programmer Bob Fitch, who is credited under Programming with Pat Wyatt and Allen Adham. The decoder checks for one hard-coded value at `$81:BE12`. When it matches, the game sets Olaf, Warrior, Inferno, Division A and 30 points, then jumps to the end-of-season routine. Inferno is the last planet, so the full ending plays: Hall of Heroes, highlight clips, credits and THE END. Some side effects:

- The end-of-season screen reads "Score needed to advance 000", because the code never sets the required score.
- Car, money, upgrades and color are never set, so they keep whatever was entered before. The new-game password prefilled on the entry screen supplies the Marauder and $2,000.
- After the ending, the game stores the planet-6 password `GGMR RSSB WS6M` (see the glitch passwords above).

The Genesis port byte-swapped the first three words of the check value. That's why its version, `RG1Y 5HP1 2F!!`, looks scrambled.

## How the password works

| SNES address | Genesis address | Routine |
|---|---|---|
| `$81:C2A5` | `$93D8` | Alphabet `BCDFGHJKLMNPQRSTVWXYZ0123456789!` (5 bits per character) |
| `$81:BF5D` | `$9004` | Encode: pack fields into a 64-bit register (SNES `$13C4`) |
| `$81:C266` / `$C277` | `$938E` / `$93AA` | Push / pull n bits at the top of the register |
| `$81:C256` | `$9372` | Checksum: `w0 ^ w1 ^ w2 ^ w3 ^ $6573` over the 16-bit words |
| `$81:C024` | `$90DE` | XOR the register with `B29A 56B2 B2EB B200` |
| `$81:C236` | `$934E` | Emit 12 characters, 5 bits each, starting from the top bit |
| `$81:BDE9` | `$8DF6` | Decode: the reverse, plus the special-password check |

Fields are pushed in this order. Each push shifts the register right, so the first field ends up in the last characters:
front(3) rear(3) middle(3) engine(2) tires(2) shocks(2) armor(2) car(3) color(3) planet(3) division(1) character(3) money0(4) money1(4) money2(4) difficulty(2), then the 16-bit checksum.

- **Money:** three decimal digits, in thousands.
- **Division:** 0 = A, 1 = B.
- **Car:** follows the ROM's name table: Battle Trak, Havac, Dirt Devil, Marauder, Air Blade.
- **Color:** stored as a slot 0–4 and remapped through a table (SNES `$C364`/`$C36A`, Genesis `$9497`/`$949D`). Slots 5–7 read past the end of that table.

## Regions and the GBA version

| Release | Passwords | Notes |
|---|---|---|
| SNES Europe | Same | Password and button-code routines are byte-identical to the US version, at the same addresses |
| SNES Japan | Same | Same logic, key, checksum and BOB FITCH value, $8B bytes later in the ROM. The Advance code has no Y (see above) |
| Genesis Europe | Same | Identical apart from one relocated jump and the Advance code table moving to `$13C02` |
| Game Boy Advance (US/EU) | None | No password screen; six battery-backed save slots instead |

The GBA port is a static recompile of the SNES 65816 code into ARM. Its saves still use the password packer, with two changes:

- Two extra fields go in first, before the usual 44 bits: an 8-bit value at SNES-style RAM `$01A8`, then a 4-bit slot holding `$1AEE` (a 0–3 counter that picks the music track).
- The checksum shrinks to 4 bits: the low nibble of the same `w0 ^ w1 ^ w2 ^ w3 ^ $6573`.

The total is still 60 bits and 12 characters, with the same XOR key. After a new game is saved to slot 1, RAM holds `BNRRHHHXZN4B`, which decodes this way to the new-game setup: Snake Sanders, Chem VI, Division B, $2,000, a Marauder, and 1/1/1 charges. The decoder has no special-password check, so there's no BOB FITCH on the GBA. Routines: decode `0x0803D2D8`, unpack `0x0803EF74`, push/pull `0x0803F2CC`/`0x0803F36C`, checksum `0x0803F274`, XOR `0x0803E08C`.

## The cast

The portraits on the page come from `characters.png`. The ROM's rival name table is Viper Mackay, Grinder X19, Ragewortt, Roadkill Kelly, Butcher Icebone, J.B. Slash, Rip, Shred. "Ragewortt" is spelled that way in the SNES, Genesis and GBA ROMs. The shopkeeper is Fast Eddie, and the guy on the Advance a Level screen is Captain Braddock.

## How the button codes work

The input code lives at these addresses:

| | SNES | Genesis |
|---|---|---|
| Held buttons | `$033D` | `$4282(a4)` |
| New presses | `$034D` | `$428C(a4)` |
| Sequence matcher | `$81:9BFC` | `$1C90` |
| "Code entered" flag | `$0245` | `$3A20(a4)` |

Each frame, the matcher compares the held buttons with the next entry in a code table. Still holding the previous button is allowed, and anything else resets the code. When it reaches the `$FFFF` end marker, it sets the flag, and the current screen applies its effect.

| Effect | SNES | Genesis |
|---|---|---|
| Infinite weapon charges | `$0247` skips the ammo decrements | `$3A22` skips the ammo decrements |
| Drive anywhere | Clears `$0B4B` | Clears `$4E2E` |
| Olaf / Inferno | Held combo `cmp #$2130` at `$81:A912` (characters) and `$81:A8B5` (VS planets) | Sequence code |

## Files

| File | What it is |
|---|---|
| `index.html` | The generator page |
| `rnrr.js` | Password encode/decode, ported from the ROM |
| `test.mjs` | `node test.mjs` round-trips published passwords through the codec |
| `tools/dis65.py`, `tools/dism68k.py` | Small 65816 / 68000 disassemblers used for this research |
| `tools/padrefs.py` | Lists every SNES read of the joypad variables |
| `tools/disasm.py`, `tools/disasm68k.py`, `tools/reasm*.py` | Full-ROM disassemblers and reassemblers (from the Soldiers of Fortune project) |
| `disasm/snes/`, `disasm/genesis/` | US ROM listings that reassemble byte-identical; `disasm/names.txt` labels the password, input and cheat routines and RAM |
| `characters.png`, `rock_n_roll_racing_logo.png` | Page art: racer portraits (8 × 2 tiles of 64 px) and the logo |
| `planets/` | The six planets, captured from the SNES VS mode planet select (99 px, transparent) |
| `upgrades/` | Engine, tires, shocks, armor and weapon icons, captured from the SNES Buy Equipment screen (the Marauder's items) |
| `cars/` | Spinning car sheets from the SNES car shop: 24 frames of 64 px across (one full turn, 4 game frames each) and the 5 paints down (black, blue, red, green, yellow), rebuilt from VRAM, OAM and CGRAM with real transparency |

To run the page locally, serve the folder, e.g. `python -m http.server`. ROMs are not included.
