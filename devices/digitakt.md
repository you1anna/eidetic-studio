# Elektron Digitakt MK1 — quick reference

**Role in the rig:** drum sampler (one-shots only) and resample target; passes the OT clock downstream via its **hardware MIDI THRU**. Slaves to the Octatrack. **Probationary** — role reassessed ~September 2026 (KB §14). **No timestretch** (pitch and speed are linked).
**Menu access:** `[SETTINGS]` (cogwheel) → **MIDI CONFIG** — sub-menus **SYNC** and **PORT CONFIG**. USB personality: `[SETTINGS]` → SYSTEM → USB CONFIG = **USB MIDI** (not Overbridge).

> Cross-refs: clock/sync → [`../guides/midi-sync.md`](../guides/midi-sync.md) §3 · track allocation → [`../guides/track-setup.md`](../guides/track-setup.md) · wiring → [`../knowledge-base.md`](../knowledge-base.md) §5.1.

## How do I… (task → exact steps)

| Task | Steps | Source |
|---|---|---|
| **Fix TR-8S + TB-03 dead while the Digitakt itself syncs** | `[SETTINGS]` → MIDI CONFIG → PORT CONFIG → **THRU PORT FUNCTIONALITY = MIDI** (if it's DIN24/DIN48 the THRU port stops carrying MIDI and everything downstream dies silently). | midi-sync §3 |
| **Confirm it follows the OT** | MIDI CONFIG → SYNC → **CLOCK RECEIVE = ON**, **TRANSPORT RECEIVE = ON**. INPUT FROM includes **MIDI**. | midi-sync §3 |
| **Keep the USB port sterile (this rig's committed state)** | MIDI CONFIG → SYNC → **CLOCK SEND = OFF**, **TRANSPORT SEND = OFF** (nothing consumes USB clock; downstream travels via the hardware THRU). | midi-sync §3, §8 |
| **Disable Overbridge** (this rig does not use it) | `[SETTINGS]` → **SYSTEM** → **USB CONFIG** → select **USB MIDI**. This disables Overbridge and USB Audio/MIDI; use the USB connection only for Elektron Transfer, never as an Ableton audio device or clock path. | Digitakt User Manual OS 1.51 p.73; on-rig configuration 2026-07-19 |
| **Stop track 2 triggering from the TB-03's notes** | MIDI CONFIG → CHANNELS → move the audio-track channels **off channel 2** (or keep track 2 empty). | midi-sync §3 |
| **Resample the desk Group bus** | Soundcraft Group 1/2 → Digitakt In L/R (patchbay 11–12). Arm a sample-record track (tracks 7–8 kept empty for this) and hit sample; zero the Group routing when done. | KB §12, track-setup |

## Track layout (this rig — one-shots only)

| Trk | Sound | | Trk | Sound |
|---|---|---|---|---|
| 1 | Metallic percussion | | 5 | Vocal stabs (single words, breaths) |
| 2 | Toms, low percussion | | 6 | Noise / texture hits |
| 3 | Claps, rims, snare accents | | 7 | Empty — records Group bus |
| 4 | Impacts, rumble hits | | 8 | Empty — second record slot |

Load 30–50 sounds into the Sound Pool before a session.

## Known gotchas

- **Never loops** — pitching a sample also changes its speed, so loops drift. Loops belong on the Octatrack.
- **Sample format: 16-bit, 48 kHz, mono** (matches Ableton; unlike the OT's 44.1 kHz).
- **No timestretch at all** — logged as the key September-review datapoint (KB §14).
- **USB CONFIG stays on USB MIDI.** Overbridge and USB Audio/MIDI are intentionally unused; Ableton has no Digitakt audio or clock path.

## Sources

- In-repo verified: `../guides/midi-sync.md`, `../guides/track-setup.md`, `../knowledge-base.md` (facts from the Digitakt manual).
