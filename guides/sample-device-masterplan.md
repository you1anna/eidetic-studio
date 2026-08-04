# Eidetic Studio — sample-to-device master plan

**Document version:** v1.2
**Date:** 2026-08-04
**Status:** Active — the single forward plan for the guided pilot
**Evidence log:** [`sample-device-workflow-wip.md`](sample-device-workflow-wip.md) preserves
historical pilots, gates and cross-repo evidence; it is not the forward operating sequence.

> **For a future assistant:** lead one numbered phase at a time. Before an action, give Robin the
> literal starting state, each button/menu action, expected result, impact, trade-off, success
> check and save action. If a required procedure is not in `devices/`, verify it in the official
> manual, add it to that device page, and sync this repo before using it.

## 1. Goal and fixed boundaries

The goal is one music-first path from listening to a deliberately small device-specific palette,
through loading and configuration, to an Ableton performance that can be reopened. This is not a
generic library-clean-up exercise and it does not require a precautionary machine backup before
starting.

The current machine split is a **starting hypothesis**, not a decision:

| Machine | First job to test | Why it is the first choice | Cost / trade-off to test |
|---|---|---|---|
| TR-8S | Native rhythmic foundation | Immediate drum controls, motion and the fixed kick route | May not supply a specific sampled character |
| Octatrack | Loops, long vocals and cut-ups | Tempo control, slicing, scenes and performance swapping | More project, Part and RAM management |
| Digitakt | One-shots, short stabs and desk resampling | Fast sequencer and expressive repitch/sample-lock variation | No timestretch; larger pools can become browsing |
| Ableton | Capture, rumble, arrangement and finish | Existing stem/sum capture and production environment | Manual tempo is a deliberate baseline, not a missing feature |

### Non-negotiable boundaries

- The TR-8S kick remains BD → Assign Out 1. Its kit-role skeleton and the documented DIN MIDI chain
  stay intact; do not factory-reset it.
- The live clock model remains Octatrack master and Ableton manual tempo until Phase 7 produces an
  observed reason to change it. Do not alter `guides/midi-sync.md` or MIDI cabling before then.
- The source library remains read-only/copy-only: do not run `--apply` organisation, intake,
  dedupe or catalogue-migration commands.
- Listening chooses sounds. Classification and metadata can only narrow the search.

## 2. The guided sequence

Each phase produces one visible outcome. The assistant stops at its pass condition, records verified
discoveries in this repo, and only then moves to the next phase.

| Phase | Outcome | Why this comes now | Pass condition |
|---|---|---|---|
| 1. Track brief | One sentence, BPM and four to six required roles | Makes auditioning decisive rather than exploratory | Each candidate can be judged keep, alternate or reject |
| 2. Library readiness | A named audition packet, listened through, promoted into `CURATED/` | Nothing downstream can run while `CURATED/` is empty | `CURATED/` contains the promoted palette and every source path resolves under it |
| 3. Role trial | Observed device strengths, friction and save/reload cost | Tests workflow on the rig, not capability lists | Each material type has a provisional preferred destination |
| 4. Device crates | A small approved crate per device | Separates listening from transfer and avoids an all-device dump | Every item is heard, named by role and assigned to one device |
| 5. Load and configure | One playable, named state per machine | Turns samples into musical control | Each state plays and survives reload |
| 6. Performance and capture | Two Ableton takes from a real groove | Shows whether the hand-offs work in music | A take and its machine states can be reopened |
| 7. Sync comparison | A measured choice between manual tempo and hardware-following Live | Avoids clock complexity before it has a job | Keep manual tempo or record an explicit new MIDI decision |

## 3. Phases 1–4 — choose material before moving it

### Phase 1 — define the track

Start from the saved Octatrack template, never a blank project. Set a deliberate tempo in the
138–142 BPM range and agree only these facts:

1. One sentence describing the movement, for example: “rolling tribal percussion, sparse acid and
   one cut-up vocal phrase that builds pressure”.
2. The required roles: native kick/backbone, one percussion character, one loop or texture, one
   vocal role, acid, and at most one optional impact or resample.
3. What is deliberately absent. The default maximum is five or six simultaneously audible elements.

**Trade-off:** a narrow brief gets to a groove quickly but rejects attractive, unrelated samples.
Keep those out of this run instead of widening the palette.

### Phase 2 — audition, promote into `CURATED/`, then make listening groups

**Start here, and know why:** `CURATED/` is empty. Phase 4's export contract requires every
`source_path` to resolve below `CURATED/`, and `sample-export` has enforced that since 2026-08-01.
Until a promotion has run, Phases 2–4 cannot complete. Promotion is a **listening session**, not a
command — `sample-curate promote` copies only rows whose decision is `favourite`, and no label set in
either repo currently has a single favourite row.

The sequence, run from `~/Projects/eidetic-sample-tools` (tools at `~/.venvs/library-tools/bin/`):

1. **Generate a packet** — `sample-curate prepare --output-dir library-tools/manifests/<run-id>-audition`.
   It writes `audition.m3u8` and `labels.tsv`. It cannot be narrowed by argument, so it produces
   roughly 112 rows from `PILOT_QUOTAS`.
2. **Trim to the Phase 1 brief.** Every remaining row needs a decision, so cutting the packet to the
   brief-relevant rows is the difference between a short session and a long one. Trimming is safe —
   only the header schema is validated, never the row count. Record the trim and its reason in the
   packet `README.md`; it is a human selection, not a silent edit.
3. **Listen to every retained candidate** and set `decision` to `reject`, `keep` or `favourite`. A
   favourite additionally needs a `true_role` from the trusted-role set and a non-empty `descriptor`.
4. **Validate, then promote** — `sample-curate validate --labels <packet>/labels.tsv`, then
   `sample-curate promote --labels <packet>/labels.tsv --run-id <run-id>`. Promote hash-checks every
   source and refuses a stale or missing file. `sample-curate undo-promotion --run-id <run-id>` is
   the reversal path.

Only then search `CURATED/` and make short listening groups — not an export. The deferred
`octatrack-pilot-01` packet remains historical evidence, not authority for a new run.

> **Standing risk:** the source library is single-copy — `tmutil destinationinfo` reports no
> destinations, and 28 GB across 22,952 files has no backup. Promotion writes a second copy **on the
> same physical disk**, which is not a backup. This does not block promotion (a hash-verified copy is
> within the copy-only boundary) but it is unresolved, and a drive failure still loses everything.

Build separate selection records after listening:

- **Octatrack:** loops, percussion loops and longer vocal phrases; retain alternatives only where a
  fast A/B swap is musically useful.
- **Digitakt:** one-shots, short vocal stabs, impacts and texture hits; exclude tempo-critical loops.
- **TR-8S:** only extra or replacement drum/percussion voices that its native engine cannot supply.

**Trade-off:** separate crates keep each machine immediate and make later replacement clear. A sound
that genuinely needs two machines needs two deliberate, separately justified entries.

### Phase 3 — test the same material on the rig

Use these representative roles where technically suitable: a short rap stab, one-bar hook, longer
phrase, tribal one-shot, tribal loop, and a drum alternative only if the TR-8S needs one. For each
trial, record time to a usable pattern, replacement speed, tempo behaviour, sound quality,
track/memory cost, playability, and save/reload result.

| Material | First device to try | Reason to keep it there | Reason to move it |
|---|---|---|---|
| Long loop or phrase | Octatrack | Tempo control, slicing and scenes | Flex/RAM or preparation burden outweighs the result |
| Short stab or percussion hit | Digitakt | Quick trigs, repitch and sample-lock variation | It needs tempo-locked duration or a less complex home |
| Core kick, hats, ride or roll | TR-8S native engine | Tactile controls and stable kick routing | The native voice lacks the required character |
| Extra percussion | TR-8S or Digitakt | TR-8S integrates with drums; Digitakt allows deeper variation | The alternative produces the better pattern faster |

### Phase 4 — approve device crates

Approve only the smallest palette that delivers the brief. Each crate row needs source identity, role,
descriptor, listening reason and device. Validate the source paths, preview conversion, then create
the derived `_EXPORT/` tree. `_EXPORT/` is never the selection record.

Format facts before export:

- Octatrack material must be 44.1 kHz.
- Digitakt's native format is 16-bit/48 kHz/mono; Transfer converts incoming files.
- TR-8S accepts WAV up to 96 kHz and AIFF at 44.1, 48 or 96 kHz, with 8–32-bit depths and mono or
  stereo files. Its first studio export profile remains a controlled test choice.

## 4. Phase 5 — load and configure one machine at a time

The order is intentional: make a playable TR-8S foundation, add the Octatrack performance layer,
then use Digitakt only for the detail it demonstrably improves. That creates music before the whole
rig is populated.

### TR-8S — foundation first

1. Confirm BD remains on Assign Out 1 and the slots retain their roles: clap/snare, closed hat, open
   hat, ride/cymbal, shaker/roll and extra percussion.
2. Build the core rhythm with native voices. Do not load a replacement if the native engine already
   supplies the required character.
3. For an approved extra, use the verified SD import procedure, assign it only to its chosen role,
   audition it in the pattern, and check that no user-sample dependency is being removed.
4. When the kit supports a useful groove, press `[WRITE]` and verify it remains after reopening or
   power cycling.

**Trade-off:** native voices keep the box tactile and its kick route dependable. User samples add
character but consume finite space and introduce kit dependencies.

### Octatrack — performance layer second

1. Load or duplicate the saved template; confirm CLOCK SEND and TRANSPORT SEND before changing
   material.
2. Use Static tracks for long swappable loops; use Flex tracks for tempo-dependent phrases, slicing,
   stretching and recording. Retain T5/T6 recorder capacity and T7 Thru capacity unless the trial
   proves another allocation genuinely better.
3. For every loaded item, audition at session tempo, set its playback/slice/stretch behaviour, and
   make one pattern that proves why it belongs there.
4. When it works, save the **Part first**, then the Project; reload and confirm machines, scenes and
   sample access survived.

**Trade-off:** Static tracks swap long files without RAM cost; Flex tracks are expressive but share
project memory. Preserving recorder tracks limits prepared roles but protects live resampling.

### Digitakt — detail and resampling third

1. Keep its MIDI-through and USB-MIDI configuration intact; it is a clock-chain component as well
   as a sampler.
2. Transfer the approved one-shots, load them into the working project, and place only the first
   useful sound on each allocated track. Do not fill the old 30–50 Sound Pool by default.
3. Compare direct assignment with one Sound Pool/sample-lock variation before choosing the faster
   method for this project.
4. Retain T7/T8 when desk resampling is part of the brief. Save and reload the project, confirming
   the sounds and any capture survive.

**Trade-off:** a small pool is immediate; a large Sound Pool offers rich per-step variation but can
turn writing back into browsing. Repitch makes stabs expressive but rules out tempo-critical loops.

### Literal procedures — captured 2026-08-04, ⚠ pending on-rig verification

All three are now written up from the retained official manuals, each as a numbered
literal-setup block on its device page:

- **Octatrack** — [`../devices/octatrack.md`](../devices/octatrack.md) → "Load a sample from the Mac":
  CF copy via USB DISK MODE, sample-slot load, machine assignment, timestretch, Part → Project →
  SYNC TO CARD.
- **Digitakt** — [`../devices/digitakt.md`](../devices/digitakt.md) → "Load a sample from the Mac":
  Elektron Transfer, `LOAD TO PROJ` then track assignment, direct-assignment vs Sound-pool-lock
  comparison, save/reload.
- **TR-8S** — [`../devices/tr8s.md`](../devices/tr8s.md) → "Import and assign a user sample": card
  layout and limits, `SAMPLE:Import`, instrument assignment, `[WRITE]` and power-cycle check.

**They are marked ⚠ and are manual-derived, not yet performed on the rig.** Verify each on first use
and change its source line to `on-rig YYYY-MM-DD`. Where the machine differs from the manual, the
machine wins — correct the page before continuing.

**One open gap:** the TR-8S Reference Manual documents **no dependency check** before deleting a user
sample, so the repo's requirement to check dependencies has no documented procedure. Do not delete
TR-8S user samples until it is established empirically — method recorded on the device page.

## 5. Phases 6–7 — Ableton and the clock decision

### Phase 6 — capture the first viable groove

Use the `Eidetic Techno 140` template with Studio 192 at 48 kHz: SUM on In 7/8, dry kick on In 5,
TB-03 on In 6, and OT Cue on In 3/4 when needed. Make a short rehearsal, then record two complete
takes. Save the Ableton Set in `~/Projects/Production`; archive an intentionally kept project on the
SSD at the normal archive point.

Save a state only when its role is audible, identifiable without browsing, and survives reload. The
actions are OT Part then Project, Digitakt Project, TR-8S `[WRITE]`, and Ableton Set save.

### Phase 7 — only test Ableton-following-hardware if it earns a benefit

Manual tempo is the control: type the OT BPM into Live, start Live recording, then start the OT. It
is simple, stable and requires no extra path. First make and keep one groove this way.

Only then compare the documented zero-USB option: TB-03 MIDI OUT → PreSonus Studio 192 MIDI IN,
enable Sync on that one Live **input**, and use EXT. Repeat the same short take with a stop/start and
a tempo change. Compare alignment, start/stop behaviour, recording friction and clock stability.

**Trade-off:** hardware-following tempo can remove manual BPM entry and align Live's grid, but adds
a cable, external-clock state and another failure path. Keep it only if the observed benefit outweighs
that overhead. A positive result requires a dated decision plus coordinated MIDI-guide and
knowledge-base changes; otherwise remove the cable and retain manual tempo.

## 6. Prerequisites and open issues

| Priority | Item | Effect | Resolution point |
|---|---|---|---|
| Open integrity risk — **not** a blocker | 130 protected `PACKS/` identities and one Foundation identity | Library preservation is not fully verified; it does **not** make a crate untrustworthy, because `sample-curate promote` hash-checks every source at promote time and refuses a stale or missing file | Demoted 2026-08-04 (see [`../decisions/2026-08-04-demote-packs-recovery-gate.md`](../decisions/2026-08-04-demote-packs-recovery-gate.md)); recovery review remains open in `eidetic-sample-tools` |
| ⚠ Verify on first load | The three load/assign/reload procedures are captured but manual-derived, not yet seen on the rig | A manual can differ from the machine; an unverified step must not be trusted silently | Follow each on its first real use, correct any difference, then mark it `on-rig YYYY-MM-DD` |
| Blocking before any TR-8S sample deletion | No documented dependency check exists for deleting a TR-8S user sample | A kit referencing a deleted sample may fail in an unknown way | Establish it empirically on a spare instrument (method on `devices/tr8s.md`) |
| Required before TR-8S batch export | Select one practical profile despite broad accepted formats | Inconsistent conversion undermines comparison | First controlled TR-8S import; record the chosen profile in sample tools and this repo |
| Required before role decisions | Observations from the common role trial | Current allocation remains hypothesis only | Phase 3 and the first performance |
| Deferred until a groove exists | Ableton follow-clock comparison | Premature sync work delays music and risks the stable chain | Phase 7 |
| Release-only | Clearance or replacement for commercial rap material | Private study does not imply release rights | Before any release workflow |

## 7. Documentation ownership

- This guide owns order, trade-offs and current prerequisites.
- `sample-device-workflow-wip.md` owns run IDs, evidence locations and deferred pilot history.
- `devices/*.md` own literal, verified hardware procedures.
- `track-setup.md` and `session-method-a.md` are starting templates; alter them only after observed
  results support a lasting role decision.
- `guides/midi-sync.md` and `knowledge-base.md` change only after a deliberate, approved physical or
  MIDI design change.

Run `scripts/sync.sh` after every captured knowledge change.

## Revision history

| Version | Date | Summary |
|---|---|---|
| **v1.2** | **2026-08-04** | Recorded the three load/assign/reload procedures as captured on their device pages (⚠ manual-derived, pending on-rig verification) and replaced the "blocking per first load" prerequisite with a verify-on-first-use row. Added a new blocker: no documented TR-8S dependency check before deleting a user sample. |
| v1.1 | 2026-08-04 | Rewrote Phase 2 around the step the plan was missing: `CURATED/` is empty, so promotion must happen before Phases 2–4 can complete — with the literal `prepare` → trim → listen → `validate` → `promote` sequence and the standing single-copy risk. Demoted the 130 `PACKS/` identities to an open integrity risk. |
| v1.0 | 2026-08-03 | First single forward plan: music-first, device-specific, evidence-gated loading and persistence; separates the deferred historical OT pilot from the active workflow and reserves Ableton sync for a measured comparison. |
