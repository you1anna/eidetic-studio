# Eidetic Studio — sample-to-device master plan

**Document version:** v1.8
**Date:** 2026-08-06
**Status:** Active — Phase 2 classification has passed; category audition and feedback are next
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

### Phase 2 — audio-classify, ear-calibrate, audition, then promote into `CURATED/`

**Start here, and know why:** `CURATED/` is empty. Phase 4's export contract requires every
`source_path` to resolve below `CURATED/`, and `sample-export` has enforced that since 2026-08-01.
Until a promotion has run, Phases 2–4 cannot complete. Promotion is a **listening session**, not a
command — `sample-curate promote` copies only rows whose decision is `favourite`, and no label set in
either repo currently has a single favourite row.

The sequence, run from `~/Projects/eidetic-sample-tools` (tools at `~/.venvs/library-tools/bin/`):

1. **Generate a packet** — `sample-curate prepare --output-dir library-tools/manifests/<run-id>-audition`.
   It writes the authoritative `labels.tsv` and a combined candidate playlist. It deliberately does
   **not** publish name-derived categories.
2. **Trim to the Phase 1 brief.** Every remaining row needs a decision, so cut irrelevant rows before
   classification. Record the trim and reason in the packet `README.md`; do not silently change the
   candidate set.
3. **Run the local dual-CLAP hybrid classifier:**

   ```bash
   sample-curate \
     --root "/Volumes/Extreme SSD/Production/SAMPLES" \
     --library-db library-tools/manifests/sample-library.sqlite \
     classify-packet \
     --labels <packet>/labels.tsv \
     --benchmark <packet>/benchmark-labels.tsv
   ```

   It combines cached acoustic measurements and librosa rhythm evidence with two pinned local CPU
   models, run one at a time: `laion/clap-htsat-unfused` and
   `laion/larger_clap_music_and_speech`. Audio embeddings are cached; peak measured worker RSS on
   this M4 Pro Mac mini was below 1.7 GB. Filenames and folders have **zero decision weight**.
4. **Calibrate by ear in the browser, never by editing TSV rows.** Run:

   ```bash
   sample-curate review-packet --labels <packet>/labels.tsv --open
   ```

   Listen to every exception and blind sentinel, choose the heard form and content, and save. The
   digest-bound `review-state.json` resumes safely and regenerates the fixed 24-sample benchmark.
   A failed sentinel reopens its group. If an intentional prompt-tuning run changes the digest, add
   `--carry-review` to the classifier command; same-sample decisions carry forward and only newly
   affected checks reopen. `--restart-review` is the explicit archive-and-discard alternative.
5. **Require both independent gates.** Publication remains blocked until review has zero unresolved
   checks and the fixed benchmark reaches **22/24 correct form** plus **19/24 correct joint
   content-and-group matches**. Nineteen is the nearest discrete 24-file boundary to the approximately
   20% error tolerance Robin authorised on 2026-08-06; do not lower it further without a new recorded
   decision. The ensemble weights are chosen deterministically against that fixed reviewed cohort;
   filename weight remains zero. A failed, undone or incomplete gate withdraws the official playlist
   links into `archive/stale-publications/` and must never feed hardware.
6. **Publish only through the guarded command:**

   ```bash
   sample-curate playlists --labels <packet>/labels.tsv
   ```

   Publication is transactional: all new files render before the old set is replaced. The first
   valid run archives the rejected name-derived playlists once. `playlists/README.md` then indexes:
   `rim-one-shots`, `tom-one-shots`, `percussion-one-shots`, `percussion-loops`,
   `full-drum-loops`, `vocal-stabs`, `vocal-phrases`, `long-vocal-sources` and `out-of-brief`.
   Low-confidence best guesses are last. Set every retained `labels.tsv` row to `reject`, `keep` or
   `favourite`; a favourite also needs a trusted `true_role` and non-empty `descriptor`.
7. **Validate, then promote** — `sample-curate validate --labels <packet>/labels.tsv`, then
   `sample-curate promote --labels <packet>/labels.tsv --run-id <run-id>`. Promotion hash-checks
   every source and refuses a stale or missing file. `sample-curate undo-promotion --run-id <run-id>`
   is the reversal path.

#### Current packet — `tribal-140-01` — passed 2026-08-06

The 63-file packet has 57 stored decisions, zero unresolved review items and a passed fixed
benchmark: **23/24 form, 20/24 content, 19/24 group and 19/24 joint content/group**. All 24 benchmark
truth rows now have explicit decisions; none is automatic consensus. Fifty-five earlier decisions
were preserved, and the final two obvious benchmark boundaries were recorded as transparent
best-effort audio adjudications under Robin's accepted error tolerance. The selected dual-model
weights are 0.5/0.5; filename weight is 0.0. All 63 absolute source paths exist and each sample
appears in exactly one category playlist. The name-derived set and one superseded audio-derived
publication are archived as historical evidence and are not valid audition material.

- [Playlist index](/Users/macmini/Projects/eidetic-sample-tools/library-tools/manifests/tribal-140-01-audition/playlists/README.md)
- [Classification TSV](/Users/macmini/Projects/eidetic-sample-tools/library-tools/manifests/tribal-140-01-audition/classification.tsv)
- [Two-model classification audit](/Users/macmini/Projects/eidetic-sample-tools/library-tools/manifests/tribal-140-01-audition/classification-audit.jsonl)
- [Fixed 24-sample benchmark sheet](/Users/macmini/Projects/eidetic-sample-tools/library-tools/manifests/tribal-140-01-audition/benchmark-labels.tsv)
- [Digest-bound review state](/Users/macmini/Projects/eidetic-sample-tools/library-tools/manifests/tribal-140-01-audition/review-state.json)

| Audio-derived audition group | Files | Minimum / median confidence | Playlist | First device after approval |
|---|---:|---:|---|---|
| Rim one-shots | 12 | 0.467 / 1.000 | [listen](/Users/macmini/Projects/eidetic-sample-tools/library-tools/manifests/tribal-140-01-audition/playlists/rim-one-shots.m3u8) | Digitakt |
| Tom one-shots | 15 | 0.496 / 1.000 | [listen](/Users/macmini/Projects/eidetic-sample-tools/library-tools/manifests/tribal-140-01-audition/playlists/tom-one-shots.m3u8) | Digitakt |
| Percussion one-shots | 2 | 1.000 / 1.000 | [listen](/Users/macmini/Projects/eidetic-sample-tools/library-tools/manifests/tribal-140-01-audition/playlists/percussion-one-shots.m3u8) | Digitakt |
| Percussion loops | 13 | 1.000 / 1.000 | [listen](/Users/macmini/Projects/eidetic-sample-tools/library-tools/manifests/tribal-140-01-audition/playlists/percussion-loops.m3u8) | Octatrack |
| Full-drum loops | 4 | 1.000 / 1.000 | [listen](/Users/macmini/Projects/eidetic-sample-tools/library-tools/manifests/tribal-140-01-audition/playlists/full-drum-loops.m3u8) | Octatrack |
| Vocal stabs | 2 | 1.000 / 1.000 | [listen](/Users/macmini/Projects/eidetic-sample-tools/library-tools/manifests/tribal-140-01-audition/playlists/vocal-stabs.m3u8) | Digitakt |
| Vocal phrases | 6 | 1.000 / 1.000 | [listen](/Users/macmini/Projects/eidetic-sample-tools/library-tools/manifests/tribal-140-01-audition/playlists/vocal-phrases.m3u8) | Octatrack |
| Long vocal sources | 1 | 1.000 / 1.000 | [listen](/Users/macmini/Projects/eidetic-sample-tools/library-tools/manifests/tribal-140-01-audition/playlists/long-vocal-sources.m3u8) | Octatrack |
| Out of brief | 8 | 1.000 / 1.000 | [listen](/Users/macmini/Projects/eidetic-sample-tools/library-tools/manifests/tribal-140-01-audition/playlists/out-of-brief.m3u8) | No hardware export |

The next action is Robin's category-by-category audition feedback. Core drum replacements reach the
TR-8S only when a native voice is demonstrably insufficient; `out-of-brief` is never promoted or
exported automatically.

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

For this packet, the explicit first-device map is: rim, tom and percussion one-shots plus vocal
stabs → Digitakt; percussion loops, full-drum loops, vocal phrases and long vocal sources →
Octatrack; core drum replacement → TR-8S only after a native-voice failure; out-of-brief → nowhere.

### Phase 4 — approve device crates

Approve only the smallest palette that delivers the brief. Each crate row needs source identity, role,
descriptor, listening reason and device. Validate the source paths, preview conversion, then create
the derived `_EXPORT/` tree. `_EXPORT/` is never the selection record.

Format facts before export:

- Octatrack material must be 44.1 kHz.
- Digitakt's native format is 16-bit/48 kHz/mono; Transfer converts incoming files.
- TR-8S accepts WAV up to 96 kHz and AIFF at 44.1, 48 or 96 kHz, with 8–32-bit depths and mono or
  stereo files. Its first studio export profile remains a controlled test choice.

#### First export smoke test — one sample per destination, not a batch

**Starting state:** the nine guarded playlists are current, but no row is approved for hardware yet.
Do not export all 63 classifications. Choose at most one Digitakt sample and one Octatrack sample;
add one TR-8S sample only after its native engine has audibly failed that role.

| Trial | Eligible playlist | First transfer |
|---|---|---|
| Digitakt | Rim, tom or percussion one-shots; vocal stabs | Elektron Transfer from the staged Digitakt folder |
| Octatrack | Percussion or full-drum loops; vocal phrases or long vocal sources | One staged file copied into the working Set's `AUDIO` folder in USB DISK MODE |
| TR-8S — optional | One percussion/drum one-shot that beats the native voice | One staged `ROLAND/TR-8S/SAMPLE/` file on a TR-8S-formatted SD card |

1. Robin listens in the linked category playlists and reports the playlist plus filename or item
   position for each chosen sample. The assistant records the decisions, trusted role and descriptor
   in `labels.tsv`; Robin does **not** have to edit TSV cells. Classifier membership is not approval.
2. Complete every decision in the packet, then run `sample-curate validate`. Stop on any blank or
   malformed decision. Run `sample-curate promote --run-id tribal-140-01-device-smoke` only after
   validation; success means the chosen hashes were rechecked and copied below `CURATED/`.
3. Retain minimal Digitakt and Octatrack crate TSVs beside the packet. Each must contain only the
   promoted favourite for that device and the normal fields `sample_id`, `source_path`, `role`,
   `descriptor`, `reason`. Do not pad the smoke crates to satisfy the separate Foundation quotas.
4. From `~/Projects/eidetic-sample-tools`, run the selected crate through all three Mac-side gates:

   ```bash
   sample-export DEVICE --profile eidetic-studio --crate <device-smoke.tsv> --list
   sample-export DEVICE --profile eidetic-studio --crate <device-smoke.tsv> --dry-run
   sample-export DEVICE --profile eidetic-studio --crate <device-smoke.tsv>
   ```

   **Expected:** `--list` resolves exactly one promoted file with no warning or missing row;
   `--dry-run` reports one conversion without writing; the final command reports one converted file.
   Inspect `_EXPORT/DIGITAKT/` or `_EXPORT/OCTATRACK/` before connecting hardware. Do not use
   `--force` or `--sync` on the first trial.
5. Load only the Octatrack file using the literal Octatrack procedure below. Confirm the slot,
   machine assignment and tempo behaviour, save **Part → Project → SYNC TO CARD**, power-cycle and
   confirm the assignment and any scene survived.
6. Load only the Digitakt file after the Octatrack result is recorded. Make one audible trig, save
   the project, load another project, reload the test project and confirm the sample and assignment
   survived.
7. Test the optional TR-8S file last. Preserve BD → Assign Out 1, import into a spare non-BD
   instrument, write the kit and power-cycle. Do not delete any TR-8S user sample during this test.
8. The smoke test passes only when each attempted device has: the expected single converted file,
   audible assignment, unchanged routing/clock state, and a successful save/reload. Record the
   observed steps as `on-rig YYYY-MM-DD` before adding a second file or producing a batch crate.

## 4. Phase 5 — load and configure one machine at a time

The order is intentional: make a playable TR-8S foundation, add the Octatrack performance layer,
then use Digitakt only for the detail it demonstrably improves. That creates music before the whole
rig is populated.

### TR-8S — foundation first

**Creation/initialisation choice:** do **not** factory-reset. Start on one named working kit/pattern
slot Robin has chosen for this track. Preserve the slot-role skeleton and initialise nothing else;
the repo has no verified safe dependency check for deleting existing user samples.

1. Power on the TR-8S. Press `[UTILITY]` → **SYNC/TEMPO** and confirm **Tempo Sync = MIDI** and
   **Sync Out = OFF**. Then `[UTILITY]` → **MIDI** and confirm **Soft Thru = ON** and Pattern Ch is
   not channel 2. If any value changes, press `[WRITE]` and confirm.
2. Confirm Assign Out 1 is audio: `[UTILITY]` → **ASSIGN OUT 1** → **Mode = BOOST**. Hold `[SHIFT]`,
   turn `[VALUE]` to **KIT:OUTPUT** for **BD**, press `[ENTER]`, choose **ASSIGN 1**, press `[ENTER]`,
   then `[KIT]` to exit. Press `[WRITE]` if changed.
3. Trigger the kick and verify it appears on the dedicated kick/limiter path while the remaining kit
   reaches the normal drum path. Stop here if BD also appears only at MIX OUT.
4. Build the core rhythm with native voices. Keep the roles: kick; clap/snare; closed hat; open hat;
   ride/cymbal; shaker/roll; extra percussion. Do not import a replacement when a native voice
   already supplies the required character.
5. ⚠ For one approved user sample, use an SD card formatted by the TR-8S. On the Mac copy the file
   to `ROLAND/TR-8S/SAMPLE/`, eject the card and insert it. On the TR-8S press `[UTILITY]`, select
   **SAMPLE:Import**, `[ENTER]`, choose **FILE** or **FOLDER**, `[ENTER]`, select the item, press the
   blinking `[SAMPLE]` to preview, then `[ENTER]` → **OK**. Expected display: **Completed!**.
6. ⚠ Press `[SAMPLE]`, press the intended `[BD]`–`[RC]` instrument button—never `[BD]` for this
   trial—turn `[VALUE]` to the imported User sample, then press `[SAMPLE]` to leave. Trigger the
   instrument and confirm every other slot is unchanged.
7. Press `[WRITE]` and confirm. Power-cycle, reopen the kit and verify the imported assignment, the
   other slot roles, Soft Thru, Tempo Sync and **BD → Assign Out 1** all survived.

**Trade-off:** native voices keep the box tactile and its kick route dependable. User samples add
character but consume finite space and introduce kit dependencies.

### Octatrack — performance layer second

**Creation/initialisation choice:** never start from a blank project. Load or duplicate the saved
template so its project-specific clock settings and track allocation come with it.

1. Power on the OT and load/duplicate the saved template. Open PROJECT (`[FUNC]` + `[MIDI]`) →
   **MIDI** → **SYNC**. Confirm **CLOCK SEND = ON**, **TRANSPORT SEND = ON**, **CLOCK RECEIVE = OFF**
   and **TRANSPORT RECEIVE = OFF**. Save the project if corrected.
2. Confirm the working allocation before copying: Static for long swappable loops; Flex for
   tempo-dependent phrases/slicing; T5/T6 retained for recording; T7 retained as Thru. Stop if the
   loaded project does not match the intended template rather than silently remapping it.
3. ⚠ Connect USB. PROJECT → **SYSTEM** → **USB DISK MODE** → `[YES]`. Expected: the CompactFlash
   volume mounts on the Mac. Copy approved 16- or 24-bit **44.1 kHz** WAV/AIFF files into the set's
   `AUDIO` folder. Eject on the Mac, leave USB DISK MODE and confirm the normal OT screen returns.
4. ⚠ Double-press the destination `[TRACK]` key. In QUICK ASSIGN choose the Flex or Static list,
   highlight an empty slot and press `[YES]`. Browse to the file; `[FUNC]` + `[YES]` previews it from
   Main Out. Press `[YES]` to load it. Expected: its name appears in the slot.
5. ⚠ With that slot highlighted, press `[YES]` again to assign it to the track's machine. Put a trig
   on the track and press `[PLAY]`; loading a slot alone is not success—the track must sound.
6. ⚠ For tempo-dependent material, select the sample and press `[FUNC]` + `[BANK]`. In the audio
   editor correct **ORIGINAL TEMPO**, set TIMESTRETCH to `BEAT` for rhythm or `NORMAL` otherwise,
   exit with `[NO]`, then `[FUNC]` + `[SRC]` and set **TSTR = AUTO**. Change project BPM briefly and
   confirm the loop remains in time, then restore the track BPM.
7. Create one pattern/scene move that proves the sample's role. Then `[FUNC]` + `[PART]` → **SAVE**;
   PROJECT → **PROJECT** → **SAVE**; before removing the card, PROJECT → **PROJECT** →
   **SYNC TO CARD**.
8. Power-cycle, reload the project and confirm the machine type, sample assignment, trigs and scenes.
   Missing scenes mean the Part-save step was skipped.

**Trade-off:** Static tracks swap long files without RAM cost; Flex tracks are expressive but share
project memory. Preserving recorder tracks limits prepared roles but protects live resampling.

### Digitakt — detail and resampling third

**Creation/initialisation choice:** start with the named working project, not an undocumented purge
or reset. A clean-project creation sequence has not been verified on this rig; if a separate new
project is needed, stop and verify/capture it before using it. Keep T7/T8 empty when desk resampling
is in the brief.

1. Power on the Digitakt with the working project loaded. `[SETTINGS]` → MIDI CONFIG → PORT CONFIG:
   confirm **THRU PORT FUNCTIONALITY = MIDI** and **RECEIVE NOTES = OFF**. `[SETTINGS]` → SYSTEM →
   USB CONFIG: confirm **USB MIDI**. Save the project if corrected.
2. ⚠ Connect USB and open Elektron Transfer. On CONNECTIONS select Digitakt for MIDI IN and MIDI OUT.
   Open EXPLORE; top-right choose **Samples**, top-left choose **My Computer**. Drag only approved
   one-shots to the device. Expected: Transfer converts to 16-bit/48 kHz/mono and the files appear
   on the device side. They are now on +Drive, not yet in the project.
3. ⚠ On Digitakt press `[SETTINGS]` → **SAMPLES** → `[YES]`. Highlight a transferred sample,
   `[YES]`, `[RIGHT]` → **LOAD TO PROJ** → `[YES]`, then confirm. Press `[SETTINGS]` to leave.
4. ⚠ Select the destination with `[TRACK]` + `[TRIG 1–8]`; press `[SRC]`, turn DATA ENTRY knob D to
   the sample and press `[YES]`. Press that track trig and confirm it sounds. Repeat only for the
   first useful sample on each approved track; do not populate a 30–50-sound pool by default.
5. Start with direct assignment. Only to test per-step variation: `[FUNC]` + `[SONG MODE]` →
   **MANAGE SOUNDS** → select the Sound(s) → `[RIGHT]` → **COPY TO …** → **SOUND POOL**. Hold the
   destination trig and turn `LEVEL/DATA` to select the Sound; expected: the trig flashes.
6. Make one pattern proving the direct or Sound-lock method is genuinely faster for this material.
   Press `[FUNC]` + `[SETTINGS]`, choose the project slot and confirm save.
7. Load another project only after saving, then reload this one. Confirm samples, assignments,
   Sound locks and any T7/T8 capture survived. Do not use PURGE ALL as a tidy-up.

**Trade-off:** a small pool is immediate; a large Sound Pool offers rich per-step variation but can
turn writing back into browsing. Repitch makes stabs expressive but rules out tempo-critical loops.

### TB-03 — initialise the acid voice and clock endpoint

The TB-03 receives no sample export. Its initialisation job is to be a known, clocked acid voice.

1. Power it on. Hold `[FUNCTION]` and turn `[VALUE]` to **MIDI Clock Source (`SYnC`)**; release and
   set **`NiDi`**. Press `[FUNCTION]` to exit. Settings persist automatically.
2. Hold `[FUNCTION]` + `[VALUE]` to **MIDI Channel (`CH`)**; set **2**, then exit.
3. Hold `[FUNCTION]` + `[VALUE]` to **Auto Off (`A.OFF`)**; set **OFF**, then exit.
4. Put `[MODE]` in **PATTERN PLAY** and select the working pattern. If the OT will sequence every
   note, use a known empty TB-03 pattern; the exact clear-pattern operation is not captured here, so
   do not invent one during the session.
5. On the OT select MIDI track 1, confirm CHAN = 2 and place a short test note. Press OT `[PLAY]`.
   Success: TB-03 follows start/stop and tempo once, with no doubled/stuttering note layer.

### Procedure status — captured 2026-08-04, ⚠ pending on-rig verification

The Mac-transfer/load/persistence blocks above are transcribed from the retained official manuals
and remain ⚠ until their first observed run. Their complete source procedures remain on the device
pages:

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
| **Completed 2026-08-06** | `tribal-140-01` audio classification, browser review and fixed benchmark | Authorised gate passed at 23/24 form and 19/24 joint content/group; nine resolution-digest-bound playlists now exist | Audition the linked category playlists and provide keep/reject/favourite feedback before any promotion or hardware export |
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
| **v1.8** | **2026-08-06** | Made the smoke-test execution order consistent with the established Octatrack-first objective: Octatrack save/reload proof, then Digitakt, with TR-8S still conditional on a native-voice failure. |
| **v1.7** | **2026-08-06** | Added the first export smoke test: one promoted sample per destination, three Mac-side preview/build gates, device-by-device transfer, save/reload checks and explicit stop conditions before any batch export. |
| **v1.6** | **2026-08-06** | Recorded the explicit 24-row reviewed benchmark, Robin's approximately 20% accepted error boundary, the final 23/20/19 scores and 57 preserved decisions. Documented resolution-digest publication and automatic withdrawal of stale playlist links. |
| **v1.5** | **2026-08-06** | Replaced manual TSV calibration with resumable browser review, recorded the passed dual-CLAP gate, linked all nine audited playlists and made the category-to-device hand-off explicit. |
| **v1.4** | **2026-08-05** | Replaced name-derived audition roles with local librosa + CLAP form/content classification and a strict 24-file ear gate; recorded the current 63-file candidate and benchmark paths. Expanded Phase 5 into literal creation/initialisation, load, expected-state, success and persistence sequences for TR-8S, Octatrack, Digitakt and TB-03, preserving every on-rig boundary and marking manual-derived operations ⚠. |
| **v1.3** | **2026-08-05** | Made Phase 2 category-first: `prepare` now produces per-role playlists and an index, `labels.tsv` remains the single decision record, and every manual trim is followed by playlist regeneration so removed candidates cannot remain audible. |
| **v1.2** | **2026-08-04** | Recorded the three load/assign/reload procedures as captured on their device pages (⚠ manual-derived, pending on-rig verification) and replaced the "blocking per first load" prerequisite with a verify-on-first-use row. Added a new blocker: no documented TR-8S dependency check before deleting a user sample. |
| v1.1 | 2026-08-04 | Rewrote Phase 2 around the step the plan was missing: `CURATED/` is empty, so promotion must happen before Phases 2–4 can complete — with the literal `prepare` → trim → listen → `validate` → `promote` sequence and the standing single-copy risk. Demoted the 130 `PACKS/` identities to an open integrity risk. |
| v1.0 | 2026-08-03 | First single forward plan: music-first, device-specific, evidence-gated loading and persistence; separates the deferred historical OT pilot from the active workflow and reserves Ableton sync for a measured comparison. |
