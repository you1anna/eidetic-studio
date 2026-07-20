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
| **Record and play a live stereo Aux loop** | Follow **“Live Aux loop — literal setup”** below. It uses T5 / Recorder Buffer 5 and makes each state and success check explicit. | Octatrack MKII User Manual OS 1.40A §§9.1–9.2, 11.3, 17.1.3; on-rig OS 1.40C |

### Live Aux loop — literal setup

**Purpose:** Record the Soundcraft Aux 1/2 stereo send arriving at OT inputs A/B, then play that
captured loop from **T5**. T5 is the dedicated live-capture track; **do not use T1** for this. T1 is the
Static Loop A slot, and its empty playback slot is unrelated to the T1 recorder buffer.

#### 1. Confirm T5 is ready

1. Press `[TRACK 5]` once. **Expected:** T5 is the active track.
2. Press `[FUNC]` + `[SRC]`. **Expected:** the **Flex sample slot list** opens. This confirms T5 has a
   Flex machine.
3. If a machine list appears instead, T5 is not a Flex machine: highlight **FLEX** and press `[YES]`.
   Then press `[RIGHT]` to open its Flex sample slot list.
4. In the Flex sample slot list, press `[UP]` from Flex slot 1. **Expected:** the recorder buffers appear
   above the numbered Flex slots.
5. Select **Recorder Buffer 5** and press `[YES]`. **Expected:** T5 is now assigned to the buffer that
   T5's recorder writes to. Leave this assignment in place for the session.

#### 2. Configure what T5 records

1. With T5 still selected, press `[FUNC]` + `[REC1]` to open **RECORDING SETUP 1** for recorder 5.
2. Set **INAB = `A B`**. This records OT Input A hard left and OT Input B hard right as stereo.
3. Set **INCD = `-`**. This prevents unwired inputs C/D being included.
4. Set **SRC3 = `-`**. This prevents the OT's internal mix being included.
5. Set **RLEN = `16`** for the first test. With the normal 16-step, 4/4 pattern this is one bar.
6. Set **TRIG = `ONE2`**. This allows the recording to end at RLEN or be stopped early deliberately.
7. Set **LOOP = ON** if the captured bar should repeat when T5 plays.
8. Press `[FUNC]` + `[REC2]` to open **RECORDING SETUP 2** for recorder 5. Set **QREC = `OFF`**
   for this first test, so recording begins as soon as `[REC1]` is pressed rather than waiting for a
   pattern boundary. Set **QPL = `OFF`** so later manual playback is immediate.
9. Press `[NO]` to leave the recording setup page. **Expected:** the normal T5 track view returns.

#### 3. Make the recording

1. Confirm a source is audible at the Soundcraft and its **Aux 1/2 send knobs are raised**. The REC1
   input LEDs on the OT must show A/B activity before recording.
2. Press `[PLAY]` to run the OT and the clocked hardware. Wait until the material you want to capture is
   playing.
3. Because **Record Quick Mode is ON**, press `[REC1]` once. **Expected:** T5's recorder starts; in
   `[FUNC]` + `[REC1]`, the recorder bar/tape-wheel animation shows recording progress.
4. For the first test, let the full **RLEN 16** steps elapse. To stop earlier, press and hold `[TRACK 5]`
   while pressing `[REC1]` once.

#### 4. Verify the captured audio before trying to play it

1. **Do not press bare `[AED]` for this check.** `[AED]` can open the currently selected playback
   sample slot, which is not proof of what T5's recorder contains.
2. Press `[FUNC]` + `[REC3]` while T5 is still the active track.
3. Select **EDIT THIS RECORDING**. **Expected:** the Audio Editor opens the T5 recorder buffer and
   shows a waveform. This is the definitive evidence that a recording exists.
4. If the editor does not open a recording/waveform, do not continue to playback. Return to section 3
   and confirm the A/B REC1 LEDs are active before pressing `[REC1]`.
5. If you want the take after power-off, choose **SAVE THIS RECORDING** from the same `[FUNC]` +
   `[REC3]` menu and complete the save name/location prompt.

#### 5. Hear the loop from T5

**First, use this preview check. It makes no assignment and places no sequencer trig.**

1. Start from the Audio Editor waveform for `RECORDING 5` (the state shown in the 2026-07-20 on-rig
   photo). Press `[NO]` until the normal track screen is visible.
2. Press the upper-right `[TRACK 5]` key once. **Expected:** T5 is the active track; its track key is
   red. If it is yellow or unlit, T5 is muted: press `[FUNC]` + `[TRACK 5]` once, then confirm it is red.
3. Hold `[FUNC]` and press `[SRC]`. **Expected on this T5:** the machine list is shown with **FLEX** as
   an entry. Highlight `FLEX` if it is not already highlighted. If `FLEX` is not available, stop: T5 is
   not a Flex machine and must be corrected in section 1 step 3.
4. Press `[RIGHT]` once while `FLEX` is highlighted. **Expected:** the recorder-buffer list appears,
   headed by entries such as `R1 > RECORDING` through `R8 > RECORDING`. This is the list shown on the
   on-rig screen; it is not reached by pressing `[UP]`.
5. Use `[DOWN]` until **`R5 > RECORDING`** is highlighted. This is Recorder Buffer 5; its Audio Editor
   heading is `RECORDING 5`. **Do not press `[YES]` at this point.**
6. Hold `[FUNC]` and press `[YES]`. **Expected:** `RECORDING 5` is auditioned through the OT **Main
   Out**; this is the direct preview of the captured buffer. It does not alter any assignment or pattern.
7. **Success check:** you hear the capture in the monitors. If it is silent, leave the list with `[NO]`
   and report that result; the waveform has already proved capture, so the fault is then the audition/main
   output path rather than the recording path.

**Only after the preview is audible, make T5 play it from the sequencer.**

8. Return to the same `R5 > RECORDING` entry and press `[YES]`. **Expected:** Recorder Buffer 5 is assigned
   to T5's Flex machine.
9. Press `[NO]` to leave the list, then press `[RECORD]`. **Expected:** the `[RECORD]` key is steadily
   lit, meaning Grid Recording mode is active.
10. Press `[TRIG 1]` to place a normal sample trig for T5 on the first step. **Expected:** trig 1 is a
   normal sample trig, not a recorder trig.
11. Press `[RECORD]` again to leave Grid Recording mode.
12. Stop the Soundcraft source or turn down its channel Aux send, then press `[PLAY]`. **Expected:** the
    recorded loop repeats from T5 even though the original live source is no longer feeding OT A/B.

The incoming A/B signal can be heard directly when the OT mixer **DIR** level is up; that direct monitoring
does not prove a recorder buffer exists. The waveform in step 4 does.

## Track layout (this rig)

| Trk | Machine · use | | Trk | Machine · use |
|---|---|---|---|---|
| 1 | Static · Loop A | | 5 | Flex · Live capture A (keep empty) |
| 2 | Static · Loop B | | 6 | Flex · Live capture B (keep empty) |
| 3 | Flex · Vocal phrase (slice) | | 7 | Thru · desk Aux return |
| 4 | Flex · Percussion loop | | 8 | Static · Loop C (Master OFF) |

Machine types used: **Static** (long files off CF), **Flex** (into memory — slice/stretch/record), **Thru** (mixer Aux through OT FX).

## Known gotchas

- **T5 `AMP` → `VOL` tops out at `63` on this machine.** For a neutral playback test, set it to `63`,
  not `127`. On-rig confirmed 2026-07-21; the displayed hardware range wins over generic/manual
  assumptions.
- **USB = CF transfer only.** Any automation assuming the Mac can reach the OT over USB is wrong (KB §10.1).
- **Sample format: 16/24-bit, 44.1 kHz.** 48 kHz files play at the wrong pitch — resample OT-bound audio to 44.1 kHz first (KB §10.8). Realtime timestretch stays clean within ~±10 % of native tempo.
- **Feedback risk:** OT Main returns on Soundcraft 9/10 with Aux 1/2 wired back to OT In A/B — zero Aux/Group sends on 9/10 before raising faders (KB §10.2).
- **New project ≠ template** — factory sync defaults silently starve the chain (see first row above).

## Sources

- [Octatrack MKII User Manual OS 1.40A](../sources/official/elektron-octatrack-mkii-user-manual-os1.40a.pdf) — Elektron's published procedure manual retained locally; the actual machine runs **OS 1.40C** (on-rig confirmed 2026-07-19) · in-repo verified: `../guides/midi-sync.md`, `../guides/track-setup.md`, `../knowledge-base.md`.
