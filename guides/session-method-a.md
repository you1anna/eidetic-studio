# Eidetic Studio — Full Session Guide (Method A + Performance Sample System)

**Document version:** v1.3 — supersedes v1.2
**Date:** 2026-08-03
**Companion to:** Knowledge Base v2.6 · Sound & Production Workflow v1.3 · MIDI Sync Guide v1.3
**Scope:** One complete production cycle, plus the sample organisation and resampling system that makes it sticky and reusable. Assumes samples are loaded. Rumble is generated in Ableton (Method A) from the dry kick tap on PreSonus In 5.

> **Status, 2026-08-03:** Part I is the current template and starting hypothesis, not a settled
> device-role decision. The guided selection, loading and role-test sequence lives in
> [`sample-device-masterplan.md`](sample-device-masterplan.md). Keep this guide unchanged while
> testing; reconcile it only after observed results support a lasting choice.

> **The one-sentence philosophy:** you rehearse until the loop is undeniable, then you perform the arrangement once, capture it, and finish in the box. Recording is earned, not started.

> **The flywheel (new in v1.1):** everything interesting that happens at the desk gets resampled back into a machine within seconds, becoming raw material for the next idea. Tracks don't just get made on this rig — the rig feeds itself.

---

## Part I — The sample system (set up once, reuse forever)

### 1. Current starting roles — to be tested

This is a deliberate test arrangement. Overlap can slow the workflow, so retain it only when the
on-rig comparison shows a clear musical or performance benefit.

| Device | Role | Why it wins that job |
|---|---|---|
| **Octatrack** | Tempo-locked material: loops, vocal phrases/cut-ups, anything that must stay in time | Realtime timestretch (clean ±10%), slice grids, scenes/crossfader mangling, hot-switchable sample pool |
| **Digitakt** | One-shots and repitched material: percs, stabs, vocal *stabs*, and the resample target for the desk | Per-step sample locks, deep p-locks, hard-wired to the SC Group 1/2 resample bus. Its pitch/speed link is a **feature** here — repitching is the sound, not a bug |
| **TR-8S** | The drum engine: kick (Assign 1, always), rides, hats, rolls | Per-track mixer, FX, motion — and the kick split feeds the whole rumble system |
| **TB-03** | The acid voice | Sequenced by the OT, saturated on Ch 2 |

### 2. Vocal cut-ups — starting allocation to test

**Tempo-locked vocal phrases → Octatrack; repitched vocal stabs → Digitakt** is the starting
allocation to trial. Both may prove useful as deliberately different instruments:

- **OT (primary):** load an acapella/phrase as a **Flex machine**, slice it (16–64 slices on the grid), then play slices from the sequencer with p-locks. Timestretch keeps every chop at session tempo regardless of the vocal's native BPM. Scenes + crossfader morph filter/pitch/rate across the chops live. This is your Chontane-style hypnotic vocal loop engine.
- **DT (secondary):** short vocal hits (a word, a breath, a shout) as one-shots. Tuning them changes their speed — that smeared, pitched-down vocal texture all over hard-minimal. Sample-lock different words per step for variation without extra tracks.

**How to know which machine a vocal belongs on:** if it must sit *in time* → OT. If it's a *texture or accent* → DT.

### 3. Octatrack — CF organisation and the performance template

**CF card layout** (extends the A2 prep pipeline — all files 44.1 kHz, bar-trimmed, `BPM_KEY_name` named, ~−6 dBFS):

```
SETNAME/AUDIO/
    LOOPS/      full musical loops, 138–142 native or pre-conformed
    VOCALS/     phrases + acapellas for slicing
    PERC/       percussion loops
    ONESHOTS/   hits, impacts, FX
    RESAMPLES/  material printed from previous sessions
```

**Reusable OT project template — track assignments (save as a project, never rebuild):**

| Track | Machine | Assignment | Notes |
|---|---|---|---|
| T1 | Static | LOOP A — hot-switch pool | Static streams from CF: swap samples instantly, no RAM loading |
| T2 | Static | LOOP B | Second loop slot for layering/crossfading |
| T3 | **Flex** | VOCAL SLICES | The cut-up engine — slice grid + p-locked slice playback |
| T4 | Flex | PERC loop | Timestretched to tempo |
| T5 | Flex | **RESAMPLE playback** ← Recorder buffer 5 | See §5 — the live capture slot |
| T6 | Flex | Spare — second vocal / texture | |
| T7 | Thru | In A/B (desk Aux 1/2) | The console send-FX return |
| T8 | Static | LOOP C — hot-switch pool | Third loop slot; Master track is OFF |

**Plain-English glossary for the two OT concepts that confuse everyone:**
- **Static vs Flex:** Static machines stream long files straight off the CF card (unlimited length, but no slicing tricks). Flex machines load samples into RAM (limited size, but full slicing, retriggers, and recorder-buffer playback). Loops you *switch between* → Static. Material you *mangle* → Flex.
- **Recorder buffers:** each track has a hidden tape-loop recorder. Point it at an input or the OT's own main output, capture on one button-hold, and the recording is instantly playable on a Flex track. This is live resampling with zero file management.
- **Parts:** scenes and machine assignments are stored in Parts. After building scenes you like, **save the Part** ([FUNC]+Part menu) or a reload wipes them. This is the OT's equivalent of the TR-8S [WRITE] gotcha.

### 4. Digitakt — sound pool and track template

The DT's fluidity comes from the **Sound Pool**: curate up to 127 sounds per project, then **sample-lock** any of them onto any step ([TRK]+turn LEVEL on a step). One track becomes dozens of sounds.

**Reusable DT project template:**

| Track | Content |
|---|---|
| 1–3 | Percussion one-shots (metallic, toms, claps) |
| 4 | Rumble/impact one-shots |
| 5 | **Vocal stabs** (repitched per step via p-locks) |
| 6 | Texture/noise hits |
| 7 | **Resample slot A** — captures from the GRP bus (§5) |
| 8 | Resample slot B — previous capture stays playable while you take a new one |

For an established project, curate the Sound Pool before the session (30–50 sounds is the current
template). For the first pilot, begin smaller and expand only when sample-lock variation proves more
useful than direct assignment; browsing the full +Drive mid-jam kills momentum.

### 5. The resampling flywheel — three loops, fastest first

This is the stickiness. Learn all three; reach for the fastest that does the job.

**Loop 1 — OT internal (seconds).** T5's recorder captures the OT main out (or In A/B). Something good happens on the vocal slices + FX → hold the capture combo → it's looping on T5 → mangle it with scenes while the original keeps playing. No cables, no menus.

**Loop 2 — Desk → Digitakt (under a minute).** Press the **1-2 Group routing button** on any Soundcraft channels (e.g. TB-03 + a TR-8S ride, driven into the limiters), pan to taste → the GRP bus arrives at DT In L/R (patchbay rows 11–12) → arm DT track 7, hit sample. You've just printed *analogue-saturated desk colour* into a playable one-shot/loop. **Zero the Group routing when done** (and never on Ch 9/10). This is the loop that captures what makes this studio sound like *this studio*.

**Loop 3 — Ableton → CF (between sessions).** Bounces, resampled rumbles, edited vocals → A2 pipeline (44.1 kHz, bar-trim, name, −6 dBFS) → `RESAMPLES/` on the CF. Last session's track becomes next session's raw material.

> **Rule of thumb:** if an accident sounds good, capture it within 30 seconds via Loop 1 or 2, or accept it's gone. Don't stop the jam to do file admin — that's what Loop 3 is for.

---

## Part II — The session cycle

## Phase 0 — Power-up ritual (~5 min)

| # | Device | Action |
|---|---|---|
| 1 | Power | PreSonus → BM9S → HS8s last. Hardware in any order. |
| 2 | **TR-8S** | [UTILITY] → MIDI: **Soft Thru = ON**. Same visit, SYNC/TEMPO: **Tempo Sync = MIDI**. Fix + **[WRITE]** if wrong. |
| 3 | **TB-03** | Powers and stays on. [MODE] → **PATTERN PLAY**. |
| 4 | **Octatrack** | Load the **template project**. [FUNC]+[MIDI] → SYNC: **CLOCK SEND ✓ / TRANSPORT SEND ✓**. Set tempo (138–142). |
| 5 | Chain test | PLAY on OT → DT, TR-8S, TB-03 all start at the same BPM. If not: Sync Guide §7. |
| 6 | **Soundcraft** | Faders down. Ch 9/10: **all Aux and Group sends at zero** (feedback check). All Group routing buttons out. |

## Phase 1 — Ableton setup (~5 min)

1. Open **"Eidetic Techno 140"** template; match tempo to the OT.
2. Audio settings: Studio 192 · 48 kHz · buffer 128.
3. Link, Tempo & MIDI: **Sync = Off on every hardware output port.**
4. UC Surface: input monitoring **OFF** on 3–8 — Mode 2 for the whole tracking session.

| Ableton track | Input | Monitor | Output | Role |
|---|---|---|---|---|
| SUM | 7/8 | **IN** | Master | The glued analogue mix — main listening feed |
| KICK STEM | 5 | **IN** | **Sends Only** | Feeds the rumble return only |
| TB-03 STEM | 6 | **IN** | **Sends Only** | Insurance stem / sidechain source |
| OT CUE | 3/4 | OFF | Master | Arm only to isolate an element |
| RUMBLE (Return A) | — | — | Master | Method A chain (Phase 2) |

**Why Sends Only:** the kick already lives inside the sum on 7/8. If the stem track also hits the master you hear it twice, milliseconds apart — phasey and misleading.

## Phase 2 — Rumble return (one-time; thereafter "confirm loaded")

On **Return A ("RUMBLE")**, in order:

1. **Pro-R 2** — decay ~4–8 s, 100% wet. Smears each kick into a tail.
2. **Pro-Q 4** — LP **90–110 Hz** (24 dB/oct) + HP **30 Hz**.
3. **Saturn 2** — Warm Tube/Tape; dense, not distorted.
4. **Pro-C 2** — **external sidechain = KICK STEM**. Punch style, ~4:1, ~1 ms attack, release ~120–160 ms (timed to the kick gap). 6–10 dB reduction per hit.

KICK STEM: **Send A up** until the rumble is felt under the sum, swelling between kicks. **Save into the template.**

> **Gate:** solo SUM + Return A. If kick+rumble alone hold you for two minutes, continue. If not, stop here — nothing later rescues a foundation that doesn't roll.

## Phase 3 — Sound design at the desk (~30–60 min)

1. **Kick:** TR-8S Assign 1, short decay. Ch 1 dbx limiter in, driven. ~−6 dB channel peaks.
2. **Acid:** TB-03 line sparse. Ch 2 limiter in, driven. **Commit the low-end relationship now** — complementary tuning, HP the TB-03 so the kick owns below ~60–80 Hz, verify on the BM9S. This cannot be undone after the take.
3. **Percussion:** TR-8S rides/hats/16th-roll on Ch 3/4, with swing. DT percs/stabs/vocal stabs on Ch 5/6.
4. **Vocal engine:** OT T3 — pick the phrase, slice it, sequence the cut-up, build one scene that filters/pitches it into tension.
5. **Element count:** 5–6 real elements maximum. Subtraction is the genre.
6. Desk master ridden so **In 7/8 peak ~−12 dBFS** in Ableton.

**Mid-phase flywheel moment:** the moment something at the desk surprises you, print it — Loop 1 (OT capture) or Loop 2 (GRP → DT track 7) — then keep playing with the printed version.

## Phase 4 — Performance prep on the Octatrack (~20–30 min)

1. Scenes: minimum three — stripped (kick+rumble+one element), full, tension (filtered/FX). Build the moves on the playable tracks; **T8 remains a Static loop slot, not a master track.**
2. Crossfader across your two most useful scenes.
3. Send-FX throws: Aux 1 up on Ch 3/4 or 5/6 → OT Thru (T7) delay/reverb. **Never Ch 9/10.**
4. Hot-switch pool check: confirm T1/T2 Static slots point at this track's loop candidates so mid-take swaps are two button presses.
5. Rehearse the arc: intro → build → peak → breakdown → second peak → out, 5–7 minutes. Two dry runs. **Save the Part.**

## Phase 5 — The take (~10 min)

1. Arm SUM + both stems (+ OT CUE if planned). Record quantise off.
2. Record in Ableton first, then PLAY on the OT.
3. Perform it: scenes, crossfader, mutes, slice improvisation on T3, send throws, desk rides. Commit — small imperfections are the genre.
4. Ring out, stop, **immediately do a second take** while it's all dialled.

## Phase 6 — Finish in the box (~60–90 min, separate sitting is fine)

1. Choose the best take; warp/trim (hardware-clocked, drift should be minimal).
2. Edit, don't rebuild. Stems only to rescue balance.
3. **Print the rumble** — Return A is live plugins and recorded nothing; resample it to audio so the project opens identically forever.
4. Master polish: Pro-Q 4 (broad moves only) → optional Pro-MB (low band) → Pro-L 2.
5. **Reference A/B:** phone → 3.5 mm→RCA → Soundcraft 11/12, level-matched, INTERVAL MUTE to flip. Check sub weight, ride brightness, density.
6. Bounce 24-bit/48 kHz. **Anything OT-bound → resample to 44.1 kHz** (A2 pipeline) → `RESAMPLES/` — Loop 3 closes the flywheel.

## Phase 7 — Shutdown (~3 min)

| Device | Action |
|---|---|
| Octatrack | **Save the Part**, then PROJECT → SAVE. |
| Digitakt | Save the project (captures from track 7/8 + Sound Pool state). |
| TR-8S | **[WRITE]** if anything changed. |
| Ableton | Save set; save template if improved. |
| Monitors | HS8s off first, then sub, then interface. |

---

## Quick fault reference

| Symptom | First check |
|---|---|
| Rumble inaudible while tracking | Not in Mode 2 — UC Surface monitoring on, or SUM track Monitor not IN |
| Kick phasey/hollow | Stem track output not Sends Only |
| Howling feedback | Aux/Group sends up on Ch 9/10, or Group routing left engaged |
| TB-03 silent | TR-8S Soft Thru (Sync Guide §7) |
| OT scenes gone after reload | Part wasn't saved |
| DT capture missing next session | DT project wasn't saved |
| Vocal chops drift out of time | They're on the DT (pitch/speed linked) — move tempo-locked vocals to OT T3 |
| Rumble missing on reopening | Return A never printed — it's live plugins |

---

## Probation note (for the September Digitakt review)

This system gives the Digitakt two roles the current OT template doesn't cover *simultaneously*: the hard-wired GRP resample target (Loop 2) and the per-step sample-locked stab/repitch engine. Honest caveat: the OT *could* absorb both with track sacrifices and repatching. Judge in September on whether Loop 2 actually got used — if the GRP bus sat idle, the overlap argument wins and it goes.

---

## Revision history

| Version | Date | Summary |
|---|---|---|
| **v1.3** | **2026-08-03** | Marked the Part I sample system as a current starting template rather than a settled device-role decision; linked the forward, guided role-test and loading sequence. No live routing, MIDI or session procedure changed. |
| v1.0 | 2026-07-17 | Initial seven-phase guide; Method A rumble chain; Sends Only rule. |
| **v1.1** | **2026-07-17** | **Performance sample system added (Part I):** device role split; vocal cut-up decision (tempo-locked → OT Flex slices, repitched stabs → DT sample locks); OT CF folder layout + reusable project template (T1–T8, Static/Flex/Thru/Master); DT Sound Pool + track template with dual resample slots; three-loop resampling flywheel (OT recorder buffers · GRP→DT bus · Ableton→CF via A2); Part-save gotcha documented; flywheel moments woven into Phases 3–7; DT probation datapoint added. |
| **v1.2** | **2026-07-19** | **OT Track 8 reconciled to the current template:** Master OFF; T8 is a Static **LOOP C** hot-switch slot. Removed the conflicting master-track assignment and whole-mix-scene instruction. |
