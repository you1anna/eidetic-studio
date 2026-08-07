# Elektron Octatrack MKII — quick reference

**Role in the rig:** centrepiece sampler/sequencer and **MIDI clock master**. Sequences the TB-03 on MIDI track 1 / channel 2. **USB is CompactFlash transfer only** — no MIDI, no audio, no Overbridge. **Installed OS: 1.40C** (on-rig confirmed 2026-07-19).
**Menu access:** press the dedicated `[PROJ]` button to open the PROJECT menu. `[FUNC]` + `[MIDI]`
opens MIDI SYNC directly on this rig; it is not the Project-menu shortcut. Navigate with `[ARROW]`s
and toggle checkboxes with `[YES]`. **Sync settings are stored per-project** — a new/other project
can arrive with different sync. Save via PROJECT → PROJECT → SAVE. (On-rig 2026-08-07.)

> Cross-refs: clock/sync → [`../guides/midi-sync.md`](../guides/midi-sync.md) §2 · track allocation → [`../guides/track-setup.md`](../guides/track-setup.md) · wiring → [`../knowledge-base.md`](../knowledge-base.md) §6.

## How do I… (task → exact steps)

| Task | Steps | Source |
|---|---|---|
| **Fix "nothing downstream makes a sound" after starting a new project** (TR-8S silent on PLAY) | A blank project boots on Elektron factory defaults (CLOCK/TRANSPORT SEND **OFF**). PROJECT → MIDI → SYNC → set **CLOCK SEND = ON** and **TRANSPORT SEND = ON** → SAVE. For the approved clean-card workflow, follow **“Start with a clean CF card”** below and set the full SYNC block before loading samples. | midi-sync §1 Fault 3, §2 |
| **Confirm the OT is the clock master** | PROJECT → MIDI → SYNC → **TRANSPORT SEND = ON**, **CLOCK SEND = ON**, **TRANSPORT RECEIVE = OFF**, **CLOCK RECEIVE = OFF**. | midi-sync §2 |
| **Sequence the TB-03** | `[MIDI]` mode → select the MIDI track → SRC/NOTE page → **CHAN = 2** (must match the TB-03). Keep DT/TR-8S off channel 2. | midi-sync §2, track-setup |
| **Silence tracks without deleting their trigs** | From the normal track view, press `[STOP]` for immediate silence if the transport is running. For each sounding audio or MIDI track, hold `[FUNC]` and press its `[TRACK 1–8]` key once. **Expected:** the track key becomes yellow or unlit (muted); red means it is still active. Repeat across all eight tracks as needed. To restore a track, repeat `[FUNC]` + `[TRACK]`. | Existing in-repo mute procedure in “Live Aux loop — literal setup” §5; on-rig 2026-07-20 |
| **Turn Track 8 into a master track** (whole-OT filter/comp sweep) | PROJECT menu → **CONTROL** → find the **TRACK 8** option → switch Master ON. Track 8 then processes everything and stops playing its own sample. (Currently OFF — Track 8 is a Static loop slot.) | track-setup §"Track 8" |
| **Not lose scenes / machine assignments on reload** | **Save the Part** *before* saving the project, or scene + machine assignments vanish on reload. | track-setup §"Three things that bite" |
| **Set up the send-FX (thru) path** | Track 7 = **Thru** machine; the desk Aux 1/2 feed OT In A/B (patchbay 15–16). Raise a channel's Aux send to push it through OT effects. | KB §5.1/§12 |
| **Record and play a live stereo Aux loop** | Follow **“Live Aux loop — literal setup”** below. It uses T5 / Recorder Buffer 5 and makes each state and success check explicit. | Octatrack MKII User Manual OS 1.40A §§9.1–9.2, 11.3, 17.1.3; on-rig OS 1.40C |
| **Erase the existing CF card and create the clean working Set/project** | Follow **“Start with a clean CF card — literal setup”** below. It formats the entire inserted card, creates the named working Set/project, restores OT clock send and proves downstream transport before audio is copied. | **on-rig 2026-08-07**, Octatrack MKII OS 1.40C |
| ⚠ **Get samples from the Mac onto the CF card** | Follow **“Load a sample from the Mac — literal setup” §1** below. USB DISK MODE mounts the CF card as mass storage; files go in the set's `AUDIO` folder. | Manual OS 1.40A §7.2.1, §8.5.1 · **to verify on-rig** |
| ⚠ **Load a sample into a Flex or Static slot** | Follow **“Load a sample from the Mac — literal setup” §2**. Double-press the `[TRACK]` key for QUICK ASSIGN, pick an empty slot, `[YES]` to open the file browser. | Manual OS 1.40A §8.3.1, §8.3.3 · **to verify on-rig** |
| ⚠ **Assign a loaded sample to the track's machine** | Follow **§3**. Loading into a slot does **not** assign it to the machine — that is a separate `[YES]` in QUICK ASSIGN or SRC SETUP. | Manual OS 1.40A §11.3 · **to verify on-rig** |
| ⚠ **Set timestretch so a loop holds session tempo** | Follow **§4**. Per-sample TIMESTRETCH in the audio editor, plus `TSTR = AUTO` in SRC SETUP for it to apply. | Manual OS 1.40A §12 (audio editor), Appendix A · **to verify on-rig** |
| ⚠ **Save and reload so the work survives** | Follow **§5**. Order is **Part → Project → SYNC TO CARD**, and never eject the card without the sync. | Manual OS 1.40A §10.2.2, §8.4.1 · **to verify on-rig** |

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

### Start with a clean CF card — literal setup

**Purpose:** permanently remove the current card-resident Sets, projects and samples; create one empty
working Set/project; and restore the Octatrack's clock-master role before any new audio is copied.

> **Verified on-rig 2026-08-07 on OS 1.40C.** Robin confirmed that the existing card contents had no
> preservation value. The complete format, Set/project creation, SYNC save and post-power-cycle
> downstream-transport sequence passed.

#### 1. Format the inserted CF card — on-rig verified 2026-08-07

**Starting state:** OT stopped and powered on with the CF card to be erased physically inserted. The
USB cable may remain connected, but USB DISK MODE must be off. If the CF volume is visible in Finder,
eject it on the Mac, then leave USB DISK MODE on the OT. Digitakt, TR-8S and TB-03 may remain connected
by the established DIN MIDI chain, but **do not open or change any TR-8S setting**.

1. Check the physical card one final time. **Everything on this inserted CF card will be permanently
   removed:** every Set, project, sample and partition. This is not recoverable from the OT.
2. Press `[PROJ]` once. Do not press `[FUNC]` + `[MIDI]`; that opens MIDI SYNC directly on this rig.
   **Expected:** the current Set and project names appear at the top of the PROJECT menu.
3. Select **SYSTEM** and press `[YES]` or `[RIGHT]`.
4. Select **CARD TOOLS** and press `[YES]` or `[RIGHT]`.
5. Select **FORMAT CARD** and press `[YES]`. **Expected:** the OT displays a confirmation prompt.
6. Read the prompt, then press `[YES]` to proceed. **Do not switch off the OT or remove the card while
   formatting.**
7. Wait for formatting to finish. **Expected:** there is no usable Set/project on the freshly formatted
   card. A **NO SET IS MOUNTED! PLEASE MOUNT ONE.** prompt may appear.

**Stop here** if FORMAT CARD is absent, the screen identifies a different card operation, an error
appears, or the OT does not finish formatting. Do not substitute FILE MANAGER → DELETE.

**Observed result 2026-08-07:** Robin completed the format successfully on OS 1.40C using `[PROJ]` →
SYSTEM → CARD TOOLS → FORMAT CARD.

#### 2. Create and mount the working Set — on-rig verified 2026-08-07

**On-rig observation 2026-08-07:** after FORMAT CARD completed, the former Set name remained selected
in memory and **NO SET IS MOUNTED** did not appear. Use the explicit Set-change route; this does not
prevent creation of the empty Set.

1. Press `[PROJ]`, select **PROJECT**, then find **CHANGE** under the **SET** heading—not CHANGE
   under the PROJECT heading—and press `[YES]`.
2. If **NOT WITHIN A PROJECT. CHANGES MADE WILL BE DISCARDED. CONTINUE?** appears, press `[YES]`.
   Nothing remains to preserve on the formatted card.
3. Select **`<CREATE NEW SET>`** and press `[YES]`. **Expected:** the naming screen opens.
4. Name the Set with a clear working name using the `[ARROW]` keys, then press `[YES]`. The current
   run uses **`SetGPT`**.
5. If the Set list remains open, highlight the new Set and press `[YES]` to mount it.
   **Expected:** the project selection screen opens automatically and shows the new Set name.

**Success check:** the new Set is mounted and contains no projects or audio-pool samples.

**Observed result 2026-08-07:** Set `SetGPT` was created and mounted successfully.

#### 3. Create and load the working project — on-rig verified 2026-08-07

1. In the project selection screen, choose **`<CREATE EMPTY PROJECT>`** and press `[YES]`. The same
   manual later calls this entry **`<CREATE NEW PROJECT>`**; if that is the label shown on OS 1.40C,
   select it. Both labels mean create a project in the mounted Set.
2. Name the project with a clear working name using the `[ARROW]` keys, then press `[YES]`.
3. **Expected:** the normal project screen opens. Reopen PROJECT and confirm the new Set and project
   names appear at the top.

**Stop here** if an old project or sample name appears. The clean baseline has not been established.

**Observed result 2026-08-07:** a working project was created and loaded successfully in Set `SetGPT`.

#### 4. Restore and save the clock-master settings — on-rig verified 2026-08-07

1. Press `[PROJ]` → **MIDI** → **SYNC**.
2. Set **TRANSPORT SEND = ON**.
3. Set **CLOCK SEND = ON**.
4. Set **TRANSPORT RECEIVE = OFF**.
5. Set **CLOCK RECEIVE = OFF**.
6. Leave **PROG CH SEND** and **PROG CH RECEIVE** OFF for this baseline.
7. Return to PROJECT → **PROJECT** → **SAVE** and press `[YES]` to save.
8. Reopen MIDI → SYNC. **Success check:** the four clock/transport values still match steps 2–5.

**Observed result 2026-08-07:** the clock-master settings were restored, saved and rechecked in
the working project in Set `SetGPT`.

#### 5. Prove transport, power-cycle and reload — on-rig verified 2026-08-07

1. With the established MIDI chain connected and the downstream devices powered on, return to the
   normal OT screen and press `[PLAY]`.
2. **Expected:** the Digitakt, TR-8S and TB-03 transport or step-position indicators start. Audible
   sound is not required; old patterns may be empty.
3. Press `[STOP]`. **Expected:** all three downstream transports stop.
4. Power the OT off, wait for it to shut down, then power it on again.
5. **Expected:** Set `SetGPT` and its working project load. Recheck PROJECT → MIDI → SYNC and
   confirm the four clock/transport values are unchanged.
6. Press `[PLAY]`, then `[STOP]`, once more. **Success check:** downstream transport still follows.

The clean baseline is complete only when the empty named Set/project, saved SYNC values and
post-power-cycle transport test all pass. This procedure changes no TR-8S configuration.

**Observed result 2026-08-07:** Digitakt, TR-8S and TB-03 followed OT play/stop before and after an
OT power-cycle; Set `SetGPT`, its working project and the saved SYNC values reloaded correctly.

### Load a sample from the Mac — literal setup

**Purpose:** take an approved sample from the Mac, get it onto the CompactFlash card, into a sample
slot, assigned to a track's machine, stretched to session tempo, and saved so it survives a reload.

> ⚠ **Every step in this block is derived from the Octatrack MKII User Manual OS 1.40A and has not
> yet been performed on the rig.** The machine runs **OS 1.40C**. Confirm each expected display
> before relying on it; correct anything that differs and change the source to `on-rig YYYY-MM-DD`.
> Robin's on-rig observation overrides the manual.

#### 1. Put the file in the set's audio pool

**Starting state:** OT powered on with its set mounted; a USB cable to the Mac; the approved sample
converted to **16- or 24-bit, 44.1 kHz WAV or AIFF, mono or stereo** (48 kHz plays at the wrong pitch).

1. Connect the OT to the Mac with a USB cable.
2. Press `[PROJ]`, select **SYSTEM**, then **USB DISK MODE**, and press
   `[YES]`. **Expected:** the CF card mounts on the Mac as a mass-storage volume. This is the *only*
   thing OT USB does — there is no MIDI or audio over it.
3. On the Mac, open **Finder**. Under **Locations** in the sidebar, click the new ejectable volume
   that appeared on entering USB DISK MODE; it is the Octatrack CF card, not `Extreme SSD` or
   `Macintosh HD`. Its volume name can vary.
4. In the top level of that CF volume, open the **set folder** and then the folder named **`AUDIO`**
   inside it. That folder *is* the audio pool; only material in it is visible to the projects of the set.
5. Copy the approved sample into `AUDIO`. Keep a folder to **1024 files or sub-folders** maximum.
6. Eject the volume on the Mac, then leave USB DISK MODE on the OT. **Success check:** the OT returns
   to its normal screen and the card is no longer mounted on the Mac.

**Trade-off:** the manual permits audio inside project folders, but recommends `AUDIO` only. Keep to
`AUDIO` — it keeps one pool per set rather than copies scattered per project.

#### 2. Load it into a sample slot

Slots and machines are **separate things**: 128 Flex slots and 128 Static slots per project, shared by
every track. Loading fills a slot; it does not put the sound on a track.

1. Press the `[TRACK]` key of the destination track twice, quickly. **Expected:** the QUICK ASSIGN
   menu opens — the **Flex** slot list if that track holds a Flex machine, the **Static** list if it
   holds a Static machine.
2. If the **machine list** appears instead, the track holds neither: move the cursor to **FLEX** or
   **STATIC** and press `[RIGHT]` to open that slot list.
3. Move to an **empty slot position** and press `[YES]`. **Expected:** the file browser opens, showing
   the audio pool from §1. Folders are marked `(D)`; open one with `[RIGHT]` or `[YES]`.
4. Highlight the sample and press `[FUNC]` + `[YES]` to **preview it from the main outputs** before
   committing. **Success check:** you hear it in the monitors.
5. Press `[YES]` to load it. **Expected:** the sample name appears at that slot position.

At the top of the Flex list the OT shows **RAM available to the project**, and each Flex sample's BPM
and size in MB — check this before loading long material. **Static streams from the card and costs no
RAM; Flex loads into project memory.** That is the real reason long loops belong on Static tracks.

#### 3. Assign the slot to the track's machine

1. With the QUICK ASSIGN menu still open on the correct track, select the loaded sample and press
   `[YES]`. **Expected:** the sample is now assigned to that track's machine, not merely present in
   the slot list.
2. Alternative route: select the track, press `[FUNC]` + `[SRC]` for SRC SETUP, select the sample and
   press `[YES]`.
3. **Success check:** press `[PLAY]` with a trig on the track and the sample sounds from that track.

> If you want to **replace** a sample in a slot *without* assigning it to the track's machine, press
> `[RIGHT]` at the slot instead of `[YES]` — that opens the file browser without reassigning.

#### 4. Set timestretch for a tempo-dependent loop

1. Select the sample in the Flex/Static slot list and press `[FUNC]` + `[BANK]`. **Expected:** the
   audio editor opens on that sample.
2. Find **ORIGINAL TEMPO** and confirm it matches the sample's real BPM. If it is wrong, correct it
   with the `LEVEL` knob — a wrong value makes every stretched result wrong.
3. Set **TIMESTRETCH**: `NORMAL` for most material, `BEAT` for rhythmic loops, `OFF` for none.
4. Press `[NO]` to leave the audio editor.
5. Press `[FUNC]` + `[SRC]` for SRC SETUP and set **`TSTR = AUTO`**. **This is the step that makes
   step 3 take effect** — on `AUTO` each sample's own setting applies.
6. **Success check:** change the project BPM and the loop stays in time.

Realtime stretch stays clean within roughly **±10 %** of the sample's native tempo. Outside that,
re-render at the target tempo instead.

#### 5. Save so it survives a reload

**Order matters, and getting it wrong is the documented way to lose the work.**

1. Press `[FUNC]` + `[PART]`. **Expected:** the PART EDIT pop-up opens. Choose **SAVE** and confirm.
   Machine assignments, sample assignments, effects, track parameters and all 16 scenes live in the
   **Part** — an unsaved part shows an asterisk in the PART QUICK SELECT menu (`[PART]`).
2. Then save the project: PROJECT menu → **PROJECT** → **SAVE**, or the shortcut `[FUNC]` + `[PROJ]`.
   Project changes are cached to card continuously, so **save-then-reload is the only way to return to
   a known state**.
3. Before ejecting the card, run PROJECT → **PROJECT** → **SYNC TO CARD**. **Removing the card without
   this can lose data.**
4. **Success check:** power-cycle the OT, reload the project, and confirm the machines, sample
   assignments and scenes are intact. If scenes are missing, step 1 was skipped.

To revert a part to its last saved state, press `[FUNC]` + `[CUE]`. If it has never been saved the OT
prompts **“SAVE PART FIRST”**.

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
