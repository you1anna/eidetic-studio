# SetGPT Octatrack Library Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Stage the complete 24-file audio-classified Octatrack collection as `SETGPT-01`, ready for one Finder copy into Set `SetGPT`.

**Architecture:** A packet-specific selection record is the durable record of Robin's authorisation; it preserves the original classification packet and avoids spreadsheet work. Four crate manifests give the exporter its normal hash and format gates, while a staged `SETGPT-01` folder provides the simple, human-facing category layout.

**Tech Stack:** Existing `sample-curate`, `sample-export`, SHA-256 inventory, ffmpeg conversion, Octatrack MKII CF card.

## Global Constraints

- Source archive is copy-only; never move, rename, delete, or overwrite a source file.
- Use the accepted `tribal-140-01-audition` classification snapshot only.
- Include exactly 24 files: 13 percussion loops, 4 full-drum loops, 6 vocal phrases, 1 long vocal source.
- Map percussion and full-drum groups to trusted role `DRUM-LOOP`; map both vocal groups to `VOCAL-LOOP`.
- Reuse the already promoted smoke-test file; promote only the 23 missing curated copies.
- Export 16-bit, 44.1 kHz WAV under profile `eidetic-studio`; preserve stereo where present.
- Final user-facing tree is `SetGPT/AUDIO/SETGPT-01/` with four named folders.
- No Digitakt or TR-8S change is part of this plan.
- Every studio-doc edit ends with `scripts/sync.sh "..."`.

---

### Task 1: Create the authorised 24-sample selection record

**Files:**
- Create: `/Users/macmini/Projects/eidetic-sample-tools/library-tools/manifests/tribal-140-01-audition/setgpt-01-selection.tsv`
- Read: `/Users/macmini/Projects/eidetic-sample-tools/library-tools/manifests/tribal-140-01-audition/classification.tsv`
- Read: `/Users/macmini/Projects/eidetic-sample-tools/library-tools/manifests/tribal-140-01-audition/labels.tsv`

**Consumes:** Accepted packet classifications and Robin's 2026-08-07 approval to prepare all 24 Octatrack candidates.

**Produces:** A normal eight-column `sample-curate` label TSV with 24 `favourite` rows, role mapping from the Global Constraints, deterministic descriptors `perc-loop-01` through `long-vocal-01`, `device:octatrack` tag, and note `Robin approved SETGPT-01 full collection 2026-08-07`.

- [ ] **Step 1: Select by classification, not filename**

  Keep only rows whose `audition_group` is one of `percussion-loops`, `full-drum-loops`,
  `vocal-phrases`, or `long-vocal-sources`. Sort within each group by `sample_id` so the record
  is reproducible.

- [ ] **Step 2: Create the selection record**

  Use the original packet's `sample_id` and `current_path` verbatim. Do not modify
  `labels.tsv` or `classification.tsv`.

- [ ] **Step 3: Validate the record**

  Run:

  ```bash
  ~/.venvs/library-tools/bin/sample-curate validate \
    --labels library-tools/manifests/tribal-140-01-audition/setgpt-01-selection.tsv
  ```

  Expected: `labels valid: 24`.

### Task 2: Promote the selected originals and make four exporter crates

**Files:**
- Create: `/Users/macmini/Projects/eidetic-sample-tools/library-tools/manifests/tribal-140-01-audition/setgpt-01/percussion-loops.tsv`
- Create: `/Users/macmini/Projects/eidetic-sample-tools/library-tools/manifests/tribal-140-01-audition/setgpt-01/full-drum-loops.tsv`
- Create: `/Users/macmini/Projects/eidetic-sample-tools/library-tools/manifests/tribal-140-01-audition/setgpt-01/vocal-phrases.tsv`
- Create: `/Users/macmini/Projects/eidetic-sample-tools/library-tools/manifests/tribal-140-01-audition/setgpt-01/long-vocals.tsv`

**Consumes:** Task 1 selection record; existing smoke promotion `tribal-140-01-octatrack-smoke-01`.

**Produces:** Curated copies for every selected source and four exact five-column exporter crate TSVs.

- [ ] **Step 1: Confirm the existing smoke promotion**

  Locate the curated path for sample id `000ab6a8ce5f7ab1cb08b4c0e4bc66b96d3850fd9fd4f2dc32c0a49a203ede08`.
  Keep it in the four crate manifests but exclude it from the promotion input so a duplicate
  curated destination is never attempted.

- [ ] **Step 2: Promote the other 23 approved copies**

  Create a second valid label TSV containing the remaining 23 favourites, then run:

  ```bash
  ~/.venvs/library-tools/bin/sample-curate \
    --root '/Volumes/Extreme SSD/Production/SAMPLES' \
    --library-db library-tools/manifests/sample-library.sqlite \
    promote --run-id tribal-140-01-setgpt-01 \
    --labels library-tools/manifests/tribal-140-01-audition/setgpt-01-promote.tsv
  ```

  Expected: `promoted: 23` and no original file is moved.

- [ ] **Step 3: Write one exporter crate per visible collection folder**

  Each TSV has exactly this header:

  ```text
  sample_id\tsource_path\trole\tdescriptor\treason
  ```

  Use the curated paths, not the `PACKS/` or `CATALOGUE/` locations. Counts are 13, 4, 6 and 1
  respectively. `reason` is `SETGPT-01 audio-classified <audition-group>`.

- [ ] **Step 4: Resolve every crate before conversion**

  Run `sample-export octatrack --profile eidetic-studio --crate <crate> --list` for all four
  crate files. Expected totals: 13, 4, 6, 1; zero missing sources.

### Task 3: Convert, assemble and verify the card-ready library

**Files:**
- Create: `/Volumes/Extreme SSD/Production/SAMPLES/_EXPORT/OCTATRACK/EIDETIC-CURATED/AUDIO/SETGPT-01/`
- Create: `/Volumes/Extreme SSD/Production/SAMPLES/_EXPORT/OCTATRACK/EIDETIC-CURATED/AUDIO/SETGPT-01/README.md`
- Create: `/Volumes/Extreme SSD/Production/SAMPLES/_EXPORT/OCTATRACK/EIDETIC-CURATED/AUDIO/SETGPT-01/manifest.tsv`

**Consumes:** Four valid crates from Task 2.

**Produces:** 24 converted PCM WAV files arranged as `PERCUSSION-LOOPS`, `FULL-DRUM-LOOPS`,
`VOCAL-PHRASES`, and `LONG-VOCALS`, plus a source-to-output manifest.

- [ ] **Step 1: Preview conversion**

  Run `sample-export octatrack --profile eidetic-studio --crate <crate> --dry-run` for all four
  crates. Expected combined result: 24 conversions and 0 skipped files on the first run.

- [ ] **Step 2: Convert the four crates**

  Run the same four commands without `--dry-run`. Retain the exporter output as evidence of the
  exact source-to-output mapping.

- [ ] **Step 3: Assemble the simple SetGPT layout**

  Copy the converted WAVs into the four named `SETGPT-01` folders without changing their compact
  exporter filenames. Write `manifest.tsv` with category, exported file, source sample id,
  curated source path, original packet path and SHA-256.

- [ ] **Step 4: Verify before hardware transfer**

  Confirm exactly 24 WAV files, category counts 13/4/6/1, all WAVs are 44.1 kHz 16-bit PCM, and
  each manifest hash matches its staged file. Stop on any mismatch; do not copy a partial tree.

### Task 4: Replace the one-file live instruction with the complete collection transfer

**Files:**
- Modify: `/Users/macmini/Projects/eidetic-studio/guides/current-session.md`
- Modify: `/Users/macmini/Projects/eidetic-studio/guides/sample-device-masterplan.md`

**Consumes:** Verified `SETGPT-01` staged folder from Task 3 and the known on-rig USB Disk Mode
procedure.

**Produces:** One short, literal Finder transfer chunk with the correct SetGPT destination and
links to the 24-file collection and its manifest.

- [ ] **Step 1: Update the live page**

  Replace the single-file copy instruction with copying the entire `SETGPT-01` folder to
  `/Volumes/OCTATRACK-R/SetGPT/AUDIO/`. State the expected four folders and 24 files, then retain
  the existing Finder eject-before-exit rule.

- [ ] **Step 2: Correct the masterplan state**

  Mark the one-file smoke export as historical evidence, identify the new full collection as the
  active Octatrack payload, and link its manifest. Do not claim on-device loading has happened.

- [ ] **Step 3: Sync studio documentation**

  Run:

  ```bash
  scripts/sync.sh "prepare SetGPT Octatrack collection transfer"
  ```

  Expected: private studio changes are committed and pushed.

## Plan self-review

- Spec coverage: the plan creates the approved 24 files, preserves the smoke evidence, supplies
  four clear folders, preserves copy-only source safety, and defers other hardware.
- No placeholders: every artefact, count, role mapping, command family and failure stop is named.
- Scope: sample selection/promotion/export is separated from the studio live instructions, so
  transfer cannot begin until the Mac-side payload is verified.
