# Roland TR-8S — quick reference

**Role in the rig:** drum engine + synth. Kick lives on **Assign Out 1** (→ patchbay row 1 → Soundcraft Ch 1, the dbx-limiter channel that feeds the rumble). Slaves to the Octatrack clock via DIN. **Soft Thru must be ON** — the TR-8S has no hardware MIDI Thru jack, so the whole TB-03 leg depends on it.
**Menu access:** `[UTILITY]` for system settings — hold `[SHIFT]` + turn `[VALUE]` to jump between sections, release `[SHIFT]` to select/edit. **System/kit settings only persist after a `[WRITE]`.**

> Cross-refs: clock/sync → [`../guides/midi-sync.md`](../guides/midi-sync.md) §4 · kit/slot layout → [`../guides/track-setup.md`](../guides/track-setup.md) · wiring → [`../knowledge-base.md`](../knowledge-base.md) §0.2/§5.1.

## How do I… (task → exact steps)

| Task | Steps | Source |
|---|---|---|
| **Route the kick (or any instrument) to Assign Out 1** — e.g. after a kit reset dropped it back to Mix Out | Two separate screens. **(1) Set the jack to audio — UTILITY:** `[UTILITY]` → **ASSIGN OUT 1** → **Mode = BOOST** (audio). The only other option is **TRIGGER**, which sends a trigger pulse instead — and in Trigger mode the audio still comes out of MIX OUT. (There is no "Mix Out / select Assign Out" step here — this screen is just the per-jack Mode.) **(2) Assign the instrument — KIT Edit:** hold `[SHIFT]` (setting screen appears) → turn `[VALUE]` to the **KIT:OUTPUT** parameter for **BD** (kick) → `[ENTER]` → turn `[VALUE]` to **ASSIGN 1** → `[ENTER]` → press `[KIT]` to exit. **`[WRITE]`** to save the kit. (KIT:OUTPUT values: **MIX**, **ASSIGN 1–6**, **ASSIGN A–C**.) | TR-8S Ref. Manual p.47; UTILITY Mode options confirmed on-rig 2026-07-19 |
| **Restore MIDI Soft Thru after a factory reset** (TB-03 goes dead, rest of chain fine) | `[UTILITY]` → **MIDI** section → **Soft Thru = ON** (factory default is OFF) → `[WRITE]`. Power-cycle and re-check it persisted. | midi-sync §4 |
| **Stop USB clock hijacking the tempo** | `[UTILITY]` → **SYNC/TEMPO** → **Tempo Sync = MIDI** (not AUTO — AUTO gives USB priority over DIN) → `[WRITE]`. | midi-sync §1/§4 |
| **Fix TB-03 running double-time / stuttering** | `[UTILITY]` → **SYNC/TEMPO** → **Sync Out = OFF** (Soft Thru already echoes the OT clock; Sync Out ON puts two clock streams on one cable). | midi-sync §4 |
| **Make settings actually stick** | After any UTILITY change, press **`[WRITE]`** and confirm before power-off — the #1 "worked yesterday" failure on this box. | midi-sync §4 |
| **Keep it off the TB-03's note channel** | `[UTILITY]` → **MIDI** → **Pattern Ch = 10** (or any ≠ 2). | midi-sync §4 |
| ⚠ **Import a user sample from the SD card** | Follow **“Import and assign a user sample — literal setup” §1–2** below. Files go in `ROLAND\TR-8S\SAMPLE\`; import via `[UTILITY]` → `SAMPLE:Import`. | TR-8S Ref. Manual pp. 37–38 · **to verify on-rig** |
| ⚠ **Assign an imported sample to an instrument** | Follow **§3**. `[SAMPLE]` button → `[VALUE]` to pick → `[BD]`–`[RC]` to choose the destination instrument. | TR-8S Ref. Manual p. 38 · **to verify on-rig** |
| ⚠ **Write the kit and confirm it reloaded** | Follow **§4**. `[WRITE]`, then power-cycle and re-check — the documented "worked yesterday" failure on this box. | TR-8S Ref. Manual; midi-sync §4 · **to verify on-rig** |

### Import and assign a user sample — literal setup

**Purpose:** get an approved extra percussion or drum voice from the Mac onto the TR-8S, assigned to
one instrument slot, written into the kit, and confirmed after a power cycle — **without** disturbing
the kit skeleton or the BD → Assign Out 1 route.

> ⚠ **Every step in this block is derived from the TR-8S Reference Manual v3 and has not yet been
> performed on the rig.** Confirm each expected display before relying on it; correct anything that
> differs and change the source to `on-rig YYYY-MM-DD`. Robin's on-rig observation overrides the manual.

**Non-negotiable before you start:** do not factory-reset the machine. Slot 1 stays kick → Assign
Out 1. Only load a user sample where the native engine cannot supply the character
([`../guides/sample-device-masterplan.md`](../guides/sample-device-masterplan.md) §4).

#### 1. Prepare the card on the Mac

**Starting state:** an SD card **formatted by the TR-8S itself** (`[UTILITY]` → `SD CARD FORMAT`) —
the manual is explicit about this; do not format it on the Mac.

1. Mount the card on the Mac and copy the approved files to exactly this folder:

   ```text
   ROLAND/TR-8S/SAMPLE/
   ```

2. To import files **individually**, leave them loose in that folder — up to **256 files**.
   To import a set **in one operation**, make one sub-folder inside `SAMPLE/` and put them there —
   up to **256 folders**, **256 files** each.
3. **Do not nest deeper than one level.** A folder inside a folder is not recognised.
4. Accepted formats: **WAV up to 96 kHz**, or **AIFF at 44.1 / 48 / 96 kHz**; 8-, 16-, 24-, 32-bit or
   32-bit float; mono or stereo. Limits: about **180 seconds** per file (at 44.1 kHz mono) and **400
   files** total, less depending on memory in use.
5. Eject the card properly and insert it into the TR-8S.

**The practical export profile for this studio is still unchosen** — make the first import a
controlled comparison before converting a batch, and record the profile here and in the sample tools.

#### 2. Import

1. Press `[UTILITY]` so it lights.
2. Turn `[VALUE]` to **`SAMPLE:Import`**, press `[ENTER]`.
3. Turn `[VALUE]` to **`FILE`** (individually) or **`FOLDER`** (all files in one folder), press `[ENTER]`.
4. Turn `[VALUE]` to the file you want. **Expected:** the `[SAMPLE]` button blinks — press it to
   **audition the file before importing**. Use this; it is the cheapest rejection point.
5. Press `[ENTER]`. **Expected:** a confirmation message.
6. Turn `[VALUE]` to **`OK`** and confirm. **Success check:** the display reads **`Completed!`** and
   the UTILITY screen closes. (`Cancel` + `[ENTER]` aborts.)

#### 3. Assign it to one instrument

1. Press `[SAMPLE]`. **Expected:** `[SAMPLE]` and the currently selected `[BD]`–`[RC]` button light,
   and the SAMPLE screen appears showing that instrument's sample name.
2. Press the `[BD]`–`[RC]` button for the instrument you intend to change. **Do not press `[BD]`** —
   the kick is skeleton.
3. Turn `[VALUE]` to the imported sample. Icons distinguish **Preset**, **User** (imported) and **Loop**.
4. Press the lit `[SAMPLE]` button. **Expected:** it goes dark and the SAMPLE screen closes.
5. **Success check:** trigger that instrument in the pattern and hear the new sample, with every other
   slot unchanged.

To edit the sample's tone settings: hold `[SHIFT]` and press `[SAMPLE]`.

#### 4. Write the kit and prove it survived

1. Press **`[WRITE]`** and confirm. Kit and system changes on this box exist only after a write.
2. Power-cycle the TR-8S.
3. **Success check:** reopen the kit and confirm the assigned sample, the other slot roles, and
   **BD still routed to Assign Out 1**. If the kick has reverted to Mix Out, re-run the Assign Out
   procedure in the table above.

#### ⚠ Open gap — dependency check before deleting a user sample

The repo requires that a user sample be checked for dependencies before removal. **The Reference
Manual documents no such check.** `SAMPLE:Delete` (`[UTILITY]` → `SAMPLE:Delete` → `[VALUE]` to the
sample → `[ENTER]` to tick → `Delete` → `OK`) removes it with only a generic confirmation; the manual
states just that preset samples cannot be deleted. It does not say what happens to a kit that
referenced the deleted sample.

**Do not delete user samples until this is answered on the rig.** Establish it empirically: assign a
user sample to a spare instrument, write the kit, delete the sample, reload the kit and observe what
that instrument does. Record the result here.

`SAMPLE:Optimize` defragments the user-sample area. The manual says to **back up first**, that it can
take tens of minutes, and that cutting power during it **can lose the user samples**. Do not run it
casually.

## Pattern finds (audition notes)

| Pattern | Name | Note | Source |
|---|---|---|---|
| **5-11** | **ABstractDance** | Good pattern found on the rig; retain as an audition lead, not yet as a committed session template. | On-rig 2026-07-30 |

## Kit / slot layout (this rig)

| Slot | Sound | | Slot | Sound |
|---|---|---|---|---|
| **1** | **Kick — always Assign 1** | | 5 | Ride or cymbal |
| 2 | Clap or snare | | 6 | Shaker / 16th roll |
| 3 | Closed hat | | 7–11 | Extra percussion |
| 4 | Open hat | | | |

Slot 1 never moves — the kick on Assign 1 is what feeds the rumble.

## Known gotchas

- **No hardware MIDI Thru** → Soft Thru ON is mandatory (KB §10.5). Verify on every power-up.
- **Factory reset zeroes everything here** (Soft Thru OFF, Tempo Sync AUTO) — run the three sync rows above after any reset.
- **User-sample import support:** WAV up to 96 kHz, or AIFF at 44.1, 48 or 96 kHz; 8-, 16-, 24-,
  32-bit or 32-bit float; mono or stereo. The practical export profile for this studio is not yet
  chosen — make the first import a controlled comparison before batch conversion.

## Sources

- [Roland TR-8S Reference Manual v3](../sources/official/roland-tr-8s-reference-manual-v3.pdf) pp. 37–38 (user-sample import path, limits and accepted audio formats) · p. 47 (Assignable Out) · Roland Australia "Assigning Sounds to Separate Outputs" guide.
- In-repo verified: `../guides/midi-sync.md`, `../knowledge-base.md`.
