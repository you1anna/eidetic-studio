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
| **Stop OT trig keys playing Digitakt samples at the wrong pitch / speed** | `[SETTINGS]` → MIDI CONFIG → PORT CONFIG → **RECEIVE NOTES = OFF**. The OT is clock master, not the Digitakt's note sequencer: this blocks incoming note-ons but retains DT clock/transport receive and the hardware MIDI THRU to TR-8S. Then save the Digitakt project. | Digitakt User Manual OS 1.51 pp.68–70; on-rig fault 2026-07-19 |
| **Disable Overbridge** (this rig does not use it) | `[SETTINGS]` → **SYSTEM** → **USB CONFIG** → select **USB MIDI**. This disables Overbridge and USB Audio/MIDI; use the USB connection only for Elektron Transfer, never as an Ableton audio device or clock path. | Digitakt User Manual OS 1.51 p.73; on-rig configuration 2026-07-19 |
| **Stop track 2 triggering from the TB-03's notes** | MIDI CONFIG → CHANNELS → move the audio-track channels **off channel 2** (or keep track 2 empty). | midi-sync §3 |
| **Resample the desk Group bus** | Soundcraft Group 1/2 → Digitakt In L/R (patchbay 11–12). Arm a sample-record track (tracks 7–8 kept empty for this) and hit sample; zero the Group routing when done. | KB §12, track-setup |
| ⚠ **Get samples from the Mac onto the Digitakt** | Follow **“Load a sample from the Mac — literal setup” §1** below. Elektron Transfer over USB; it auto-converts to 16-bit/48 kHz/mono. | Manual OS 1.51 §15.2.7 · **to verify on-rig** |
| ⚠ **Load a transferred sample into the project and onto a track** | Follow **§2**. Two separate stages: `LOAD TO PROJ` from the +Drive, then `[SRC]` → knob D on the track. | Manual OS 1.51 §14.4 · **to verify on-rig** |
| ⚠ **Choose between direct assignment and Sound-pool locks** | Follow **§3**. Direct assignment is one sound per track; Sound locks need the sound copied into the project's Sound pool first. | Manual OS 1.51 §9.1, §9.1.1, §10.9.2 · **to verify on-rig** |
| ⚠ **Save and reload so the work survives** | Follow **§4**. `[FUNC]` + `[SETTINGS]` saves; **loading a project does not save the active one first**. | Manual OS 1.51 §15.1.1–15.1.2 · **to verify on-rig** |

### Load a sample from the Mac — literal setup

**Purpose:** take an approved one-shot from the Mac onto the Digitakt, into the active project, onto a
track, and saved so it survives a reload.

> ⚠ **Every step in this block is derived from the Digitakt User Manual OS 1.51 and has not yet been
> performed on the rig.** Confirm each expected display before relying on it; correct anything that
> differs and change the source to `on-rig YYYY-MM-DD`. Robin's on-rig observation overrides the manual.

#### 1. Transfer the file to the +Drive

**Starting state:** Digitakt powered on with the working project loaded; `[SETTINGS]` → SYSTEM → USB
CONFIG = **USB MIDI** (this rig's committed state — Overbridge stays off); a USB cable to the Mac.

1. Connect the Digitakt to the Mac by USB. **Note:** it does **not** appear as a disk on the desktop.
2. Open **Elektron Transfer** on the Mac.
3. On the Transfer **CONNECTIONS** page, set **MIDI IN** and **MIDI OUT** to the Digitakt.
4. Click the **EXPLORE** tab.
5. Top right drop-down → select **“Samples”**. Top left drop-down → confirm **“My Computer”**.
6. Navigate to the approved one-shots and drag them to the destination on the device.
7. **Expected:** Transfer converts every file automatically to **16-bit, 48 kHz, mono** — the Digitakt's
   native format. Send whatever you have; conversion is not your job here.
8. **Success check:** the files are listed on the device side of the EXPLORE page.

**A transferred sample is on the +Drive, not in the project.** It makes no sound until §2.

#### 2. Load it into the project and onto a track

1. Press `[SETTINGS]`, select **SAMPLES**, press `[YES]`.
2. Use the `[ARROW]` keys to highlight the transferred sample, press `[YES]` to select it.
3. Press `[RIGHT]`, select **LOAD TO PROJ**, press `[YES]`. **Expected:** the sample is copied into
   the active project. A project holds up to **64 MB (~11 minutes)** of samples.
4. Press `[YES]` to confirm.
5. Press `[SETTINGS]` to leave the menu.
6. Press `[TRACK]` + `[TRIG 1–8]` to select the destination track.
7. Press `[SRC]` for the SOURCE menu and turn **DATA ENTRY knob D** to the sample.
8. Press `[YES]` to load it onto the track. **Success check:** press the track's trig and it sounds.

#### 3. Direct assignment vs Sound-pool locks — pick one deliberately

These are different mechanisms and the repo has previously blurred them.

| | Direct assignment (§2) | Sound lock |
|---|---|---|
| What varies | One sound per track | A different Sound per step |
| Setup cost | None beyond §2 | Sound must be copied into the project **Sound pool** first |
| Capacity | — | Sound pool holds **128** Sounds (the +Drive library holds 2048, but those **cannot** be Sound-locked) |
| Best for | Getting a groove down fast | Per-step variation once the groove exists |

To use Sound locks:

1. Press `[FUNC]` + `[SONG MODE]` to open the IMPORT/EXPORT menu.
2. Select **MANAGE SOUNDS**, press `[YES]` to open the SOUND MANAGER.
3. Highlight each Sound you want and press `[YES]` to select it.
4. Press `[RIGHT]` for the SOUND OPERATIONS menu.
5. Select **COPY TO …**, press `[YES]`, select **SOUND POOL**, press `[YES]`.
6. To lock one to a step: press and hold its note trig and turn **LEVEL/DATA** to open the Sound pool
   list, scroll to the Sound, then release the `[TRIG]` key. **Expected:** the `[TRIG]` key **flashes**,
   indicating a Sound lock. Hold the `[TRIG]` key to see which Sound is assigned.

**Start with direct assignment.** Do the Sound-pool route only once a groove exists and per-step
variation is the thing actually missing — see [`../guides/sample-device-masterplan.md`](../guides/sample-device-masterplan.md) §4.

#### 4. Save and reload

1. Press `[FUNC]` + `[SETTINGS]` to open the save-project screen, choose the slot, confirm.
2. **Loading a project does not save the active one first.** Always save before loading another, or
   the current work is gone.
3. **Success check:** load another project, load this one back, and confirm the samples and track
   assignments are intact.

> **PURGE ALL** (SETTINGS → PROJECT → MANAGE PROJECTS → `[RIGHT]`) removes every Sound-pool Sound and
> every sample not used in a pattern from project RAM. It does not delete them from the +Drive — but do
> not run it expecting a tidy-up if any intended sound has no trig yet.

## Track layout (this rig — one-shots only)

| Trk | Sound | | Trk | Sound |
|---|---|---|---|---|
| 1 | Metallic percussion | | 5 | Vocal stabs (single words, breaths) |
| 2 | Toms, low percussion | | 6 | Noise / texture hits |
| 3 | Claps, rims, snare accents | | 7 | Empty — records Group bus |
| 4 | Impacts, rumble hits | | 8 | Empty — second record slot |

**Start small, not at 30–50.** Load only the approved one-shots for the track and place the first
useful sound on each allocated track. Compare direct assignment against one Sound Pool/sample-lock
variation before choosing a method for the project — a large pool offers rich per-step variation but
turns writing back into browsing.

> ~~"Load 30–50 sounds into the Sound Pool before a session."~~ Superseded 2026-08-04. The 30–50
> figure is the *established-project* template in [`../guides/session-method-a.md`](../guides/session-method-a.md) §4,
> not a default for a new track. Forward position:
> [`../guides/sample-device-masterplan.md`](../guides/sample-device-masterplan.md) §4.

## Known gotchas

- **Never loops** — pitching a sample also changes its speed, so loops drift. Loops belong on the Octatrack.
- **Sample format: 16-bit, 48 kHz, mono** (matches Ableton; unlike the OT's 44.1 kHz).
- **No timestretch at all** — logged as the key September-review datapoint (KB §14).
- **USB CONFIG stays on USB MIDI.** Overbridge and USB Audio/MIDI are intentionally unused; Ableton has no Digitakt audio or clock path.

## Sources

- [Digitakt User Manual OS 1.51](../sources/official/elektron-digitakt-user-manual-os1.51.pdf): USB CONFIG p.73; native sample format / Elektron Transfer conversion p.65.
- In-repo verified: `../guides/midi-sync.md`, `../guides/track-setup.md`, `../knowledge-base.md`.
