# Elektron Octatrack MKII — quick reference

**Role in the rig:** centrepiece sampler/sequencer and **MIDI clock master**. Sequences the TB-03 on MIDI track 1 / channel 2. **USB is CompactFlash transfer only** — no MIDI, no audio, no Overbridge. **Installed OS: 1.40C** (on-rig confirmed 2026-07-19).
**Menu access:** PROJECT menu = `[FUNC]`+`[MIDI]`; navigate `[ARROW]`s, toggle checkboxes with `[YES]`. **Sync settings are stored per-project** — a new/other project can arrive with different sync. Save via PROJECT → PROJECT → SAVE.

> Cross-refs: clock/sync → [`../guides/midi-sync.md`](../guides/midi-sync.md) §2 · track allocation → [`../guides/track-setup.md`](../guides/track-setup.md) · wiring → [`../knowledge-base.md`](../knowledge-base.md) §6.

## How do I… (task → exact steps)

| Task | Steps | Source |
|---|---|---|
| **Fix "nothing downstream makes a sound" after starting a new project** (TR-8S silent on PLAY) | A blank project boots on Elektron factory defaults (CLOCK/TRANSPORT SEND **OFF**). PROJECT → MIDI → SYNC → set **CLOCK SEND = ON** and **TRANSPORT SEND = ON** → SAVE. Better: **never start from a blank project — load/duplicate the saved template.** | midi-sync §1 Fault 3, §2 |
| **Confirm the OT is the clock master** | PROJECT → MIDI → SYNC → **TRANSPORT SEND = ON**, **CLOCK SEND = ON**, **TRANSPORT RECEIVE = OFF**, **CLOCK RECEIVE = OFF**. | midi-sync §2 |
| **Sequence the TB-03** | `[MIDI]` mode → select the MIDI track → SRC/NOTE page → **CHAN = 2** (must match the TB-03). Keep DT/TR-8S off channel 2. | midi-sync §2, track-setup |
| **Turn Track 8 into a master track** (whole-OT filter/comp sweep) | PROJECT menu → **CONTROL** → find the **TRACK 8** option → switch Master ON. Track 8 then processes everything and stops playing its own sample. (Currently OFF — Track 8 is a Static loop slot.) | track-setup §"Track 8" |
| **Not lose scenes / machine assignments on reload** | **Save the Part** *before* saving the project, or scene + machine assignments vanish on reload. | track-setup §"Three things that bite" |
| **Set up the send-FX (thru) path** | Track 7 = **Thru** machine; the desk Aux 1/2 feed OT In A/B (patchbay 15–16). Raise a channel's Aux send to push it through OT effects. | KB §5.1/§12 |

## Track layout (this rig)

| Trk | Machine · use | | Trk | Machine · use |
|---|---|---|---|---|
| 1 | Static · Loop A | | 5 | Flex · Live capture A (keep empty) |
| 2 | Static · Loop B | | 6 | Flex · Live capture B (keep empty) |
| 3 | Flex · Vocal phrase (slice) | | 7 | Thru · desk Aux return |
| 4 | Flex · Percussion loop | | 8 | Static · Loop C (Master OFF) |

Machine types used: **Static** (long files off CF), **Flex** (into memory — slice/stretch/record), **Thru** (mixer Aux through OT FX).

## Known gotchas

- **USB = CF transfer only.** Any automation assuming the Mac can reach the OT over USB is wrong (KB §10.1).
- **Sample format: 16/24-bit, 44.1 kHz.** 48 kHz files play at the wrong pitch — resample OT-bound audio to 44.1 kHz first (KB §10.8). Realtime timestretch stays clean within ~±10 % of native tempo.
- **Feedback risk:** OT Main returns on Soundcraft 9/10 with Aux 1/2 wired back to OT In A/B — zero Aux/Group sends on 9/10 before raising faders (KB §10.2).
- **New project ≠ template** — factory sync defaults silently starve the chain (see first row above).

## Sources

- [Octatrack MKII User Manual OS 1.40A](../sources/official/elektron-octatrack-mkii-user-manual-os1.40a.pdf) — Elektron's published procedure manual retained locally; the actual machine runs **OS 1.40C** (on-rig confirmed 2026-07-19) · in-repo verified: `../guides/midi-sync.md`, `../guides/track-setup.md`, `../knowledge-base.md`.
