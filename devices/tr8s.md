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
- **Sample format:** 16-bit, mono. ⚠ **Sample rate not yet verified** — confirm against the manual before batch-converting for it (the one unverified number in the rig; see track-setup §"File formats").

## Sources

- [Roland TR-8S Reference Manual v3](../sources/official/roland-tr-8s-reference-manual-v3.pdf) (assign instrument to Assignable Out; manual page varies by version) · Roland Australia "Assigning Sounds to Separate Outputs" guide.
- In-repo verified: `../guides/midi-sync.md`, `../knowledge-base.md`.
