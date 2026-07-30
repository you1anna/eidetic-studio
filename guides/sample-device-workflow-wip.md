# Sample-to-device workflow — investigation and pilot

**Document version:** v0.4
**Date:** 2026-07-30
**Status:** **WIP — investigation design, not an operating procedure**
**Scope:** Selecting, preparing and transferring a small track palette from
`/Volumes/Extreme SSD/Production/SAMPLES` to the Octatrack MKII, Digitakt MK1 and TR-8S.

> Nothing in this document settles the long-term role of a device. The existing guides remain the
> current operating reference until the experiments below have been completed, reviewed and
> reconciled across the repo.

## 1. Aim

Develop the easiest repeatable way to start a groove-led, hypnotic techno track using this rig. The
workflow must support:

- tribal percussion as a structural part of the groove, not an afterthought;
- several independently sequenced rap cuts, ranging from short stabs to longer phrases;
- fast auditioning and replacement of samples;
- clear separation between library curation, device transfer and writing music;
- a small enough palette that the machines remain immediate;
- literal, verified procedures that can be followed from a known starting state.

The first deliverable is one pilot workflow for one track. A complete track-building guide comes
later.

## Progress ledger

This is a deliberately bounded cross-repo ledger: add one row only when a gate changes state or a
reproducible run is completed. Keep command output, manifests and labels in the public tooling repo;
record only the run ID, result and next gate here. A lasting choice belongs in `decisions/`; a fault
belongs in `issues/`.

| Date | Run ID | State | Evidence location | Next gate |
|---|---|---|---|---|
| 2026-07-30 | `octatrack-pilot-01` | Approved scope: an Octatrack-first, 15-file maximum pilot. A fresh read-only review enumerated 22,952 audio files; no manifest, source, curated copy or export was written. | `eidetic-sample-tools` `STATUS.md` (2026-07-23) records the live-library reconciliation block; `sample-review --no-probe --summary` completed on 2026-07-30; this repo's decision log records the pilot boundary. | Human recovery review of the 130 protected `PACKS/` discrepancies and one missing Foundation identity; then create a fresh audition packet. |

### Pilot crate boundary — approved

After the recovery gate and a complete listening decision, `octatrack-pilot-01` may contain at most
15 approved files: three alternatives each for **Loop A** (T1), **Loop B** (T2), **Vocal Phrase**
(T3), **Percussion Loop** (T4) and **Loop C** (T8). T5 and T6 remain recorder-buffer tracks; T7
remains the Thru path. The allocation is a bounded test palette, not a claim that the current device
roles are final.

### Export-set contract

The crate TSV is the authoritative record of a set for export; the `_EXPORT/` tree is only its
rebuildable, converted staging copy. The completed pilot will therefore be recorded as:

```text
eidetic-sample-tools/library-tools/manifests/crates/octatrack-pilot-01.tsv
```

Its required columns are `sample_id`, `source_path`, `role`, `descriptor` and `reason`. Every
`source_path` must resolve below `CURATED/`, where it arrived by a hash-verified **copy** from the
source library. `sample_id` is the SHA-256 identity checked again by the exporter. The TSV therefore
answers exactly which 15 files are selected, why, and whether the source changed; it is never
replaced by a folder listing or a hand-maintained list of output filenames.

The first successful Octatrack export of that crate must stage only below:

```text
/Volumes/Extreme SSD/Production/SAMPLES/_EXPORT/OCTATRACK/
  EIDETIC-CURATED/AUDIO/octatrack-pilot-01/<role>/
```

The process is: validate the crate with `--list`; preview conversion with `--dry-run`; convert only
after both agree; then separately copy the staged tree to the mounted CompactFlash card. Each real
run updates the single ledger row with its crate path, item count, conversion result and CF test
result. It does not add a session diary entry.

Other devices receive separate crates, even if a source sound is useful on more than one device.
The exporter permits loop and long-form roles for the Octatrack, but rejects them for Digitakt and
TR-8S crates; their one-shot sets and their `_EXPORT/<DEVICE>/` trees stay independent. This keeps a
device-appropriate selection from accidentally becoming a generic all-device dump.

## 2. What is settled, and what is not

### Settled constraints

- The repo is the living private source of truth. A workflow is not complete if affected guides,
  device pages and decisions disagree.
- Old projects are not part of the preservation goal.
- The devices must start the pilot with a deliberately chosen sample palette, not accumulated
  historical sample choices.
- The TR-8S must **not** receive a factory reset.
- The useful TR-8S kit skeleton must survive:
  - kick in the BD role, routed to Assign Out 1;
  - clap/snare, closed-hat, open-hat, ride/cymbal, shaker/roll and extra-percussion roles;
  - the studio's verified MIDI and sync settings.
- Existing TR-8S patterns and unwanted user-sample assignments do not need to survive.
- Any TR-8S user sample must be checked for dependencies before it is removed.
- Sample metadata and automated classification may narrow the search, but listening decides whether
  a sample belongs in the palette.

### Working hypotheses — **not decisions**

The current guides suggest:

- TR-8S for the native drum backbone;
- Digitakt for percussion one-shots and short vocal stabs;
- Octatrack for loops and longer tempo-dependent vocal material.

These are useful hypotheses for the pilot, not the answer. Timestretch, slicing, sample locking,
track cost, preparation time, transfer friction and live playability must all be tested on the actual
machines before the roles are adopted or changed.

## 3. Known work before the pilot

### Repo consistency audit

Review these together rather than editing one in isolation:

| Source | Why it needs review |
|---|---|
| `guides/track-setup.md` | Presents a fixed device split and direct folder-to-device mapping. |
| `guides/session-method-a.md` | Calls its vocal split “settled” and assigns fixed OT/DT templates. |
| `devices/octatrack.md` | Must hold every verified loading, slot, slicing, timestretch and persistence procedure used by the final guide. |
| `devices/digitakt.md` | Must distinguish direct sample locks from Sound Pool/Sound locks and capture the simplest verified method. |
| `devices/tr8s.md` | Must preserve the kit skeleton and replace the unverified sample-format statement with verified facts. |
| `guides/midi-sync.md` | Its committed clock model and channel decisions are fixed unless Robin separately approves a change. |
| `knowledge-base.md` | Physical routing remains canonical and is changed only after a verified physical change approved by Robin. |

The audit must record contradictions explicitly. It must not silently make a WIP experiment
canonical.

### Sample-library readiness

Before building an export:

1. Resolve or deliberately quarantine the current library reconciliation problem.
2. Verify that source paths in any export manifest resolve to real files.
3. Treat catalogue categories and BPM labels as search aids, not ground truth.
4. Listen to every selected sample.
5. Record the source identity and checksum so the same palette can be rebuilt.
6. Keep the pilot crate independent of the full catalogue: only approved pilot files are transferred.

The public tooling repo remains responsible for catalogue and export mechanics. This studio repo
records why each machine receives a type of material and how the resulting workflow is used on the
physical rig.

## 4. Investigation sequence and evidence gates

### Gate 0 — capture the starting state

- Photograph or write down the TR-8S kit allocation and outputs that must survive.
- Save a minimal backup/reference snapshot of each machine before destructive work. This is
  protection from an operational mistake, not preservation of old projects.
- Record OS versions, installed transfer software and mounted removable media.
- Check that the documented MIDI chain and kick routing still match the rig.

**Pass condition:** the preserved TR-8S state and the rollback boundary are unambiguous.

### Gate 1 — verify clean-baseline procedures

For each device, use its official manual and then validate on the rig:

- what an empty project, new set, initialised pattern or cleared sample pool actually changes;
- what remains on storage;
- the exact backup, transfer, save and restore steps;
- the accepted audio formats and practical limits;
- how to prove that only the pilot palette is available to the working project.

No destructive step belongs in the operating guide until its exact target, consequence and success
check are documented.

**Provisional baseline:**

- **Octatrack:** use a clean set/project and an isolated audio pool. Formatting the CF card is not
  assumed necessary.
- **Digitakt:** establish a clean project and sample context after the verified backup and storage
  procedure is understood.
- **TR-8S:** preserve and back up the kit skeleton and system settings; initialise only the working
  pattern/kit context proven safe. Do not factory-reset the machine.

**Pass condition:** Robin can reach and verify the intended baseline without relying on an inferred
button sequence.

### Gate 2 — compare device roles on the rig

Use the same representative material where technically appropriate:

1. A short rap stab.
2. A one-bar rap hook.
3. A longer rap phrase.
4. A tribal percussion one-shot.
5. A tribal percussion loop.
6. A core drum alternative only if the TR-8S native engine does not supply the required character.

For each candidate device, record:

- preparation and transfer steps;
- time from power-on to a useful pattern;
- ease of auditioning and replacing the sound;
- timing behaviour when the track tempo changes;
- quality and control of timestretch or repitching;
- ability to layer, mute and vary rap cuts independently;
- track, memory and slot cost;
- ease of saving, reloading and recovering the result;
- whether the operation feels immediate enough to use while writing.

This test may confirm the current role split, produce a hybrid, or show that a device is unnecessary
for part of the workflow.

**Pass condition:** device roles are supported by observed workflow evidence rather than capability
lists or genre assumptions.

### Gate 3 — build the pilot crate

Build one intentionally small crate around groove and hypnosis. The exact count remains provisional
until the role test, but it must contain enough material to test:

- a native TR-8S rhythmic foundation while retaining the established slot allocation;
- contrasting tribal hits and at least one tribal loop;
- multiple independent rap cuts across short, medium and long lengths;
- limited supporting texture or impact material;
- replacement candidates only where an A/B decision is genuinely useful.

Each selected file needs a listening decision, intended role, destination hypothesis, technical
format, source path and checksum. Commercial rap material is for private study in this pilot; any
release workflow needs a separate clearance-or-replacement gate.

**Pass condition:** the crate is small, reproducible and sufficient to test the workflow without
browsing the full library during the session.

### Gate 4 — transfer, load and make a groove

- Transfer only the pilot crate.
- Follow literal device procedures with a starting state, every action, expected display, success
  check and save/persistence step.
- Build a minimal groove that exercises the tribal and rap layers.
- Stop to correct the documentation whenever the physical machine differs from it.
- Record friction immediately rather than normalising a cumbersome step.

**Pass condition:** the groove can be rebuilt from the written procedure, and each rap or percussion
layer can be identified, muted and replaced without losing the core rhythm.

### Gate 5 — decide and reconcile

Only after the pilot:

1. Select the device-role split and explain why it was the least complicated successful option.
2. Record the decision in `decisions/`.
3. Update `guides/track-setup.md` and `guides/session-method-a.md` together.
4. Add every newly verified hardware procedure to the relevant `devices/*.md` page.
5. Update sample-tool profile assumptions if the approved device formats or export organisation
   differ.
6. Change `knowledge-base.md` only if a verified physical change was made and Robin approved it.
7. Search the whole repo for superseded claims and remove or clearly retire them.
8. Run the repo sync after each completed documentation change.

**Pass condition:** the repo gives one coherent answer about roles, sample flow and operation, with
remaining uncertainty visibly marked.

## 5. What the eventual operating guide must contain

The final guide will be written only after the gates above. It must include:

1. Preflight and preserved-state checklist.
2. Listening-led sample-selection worksheet.
3. Pilot crate schema and naming rules.
4. Export preparation and validation.
5. One literal transfer/loading procedure per device.
6. On-device organisation and save procedure.
7. A first-pattern recipe that tests—not dictates—the agreed device roles.
8. Recovery steps and common failure checks.
9. A short post-session review that feeds discoveries back into this repo.

## 6. Open questions

- Which machine makes short, medium and long rap cuts fastest to sequence and vary in practice?
- How many independent vocal layers are useful before track allocation becomes cumbersome?
- Does tribal material work best as loops, individual hits, TR-8S native voices, or a deliberate
  combination?
- Which current Octatrack and Digitakt template tracks should be retained, reassigned or removed?
- Does the Digitakt Sound Pool add useful speed here, or is direct sample assignment simpler?
- Which TR-8S kit parameters beyond slot role and BD output are part of the skeleton Robin wants to
  preserve?
- What artist was meant by “xtqe”, and which musical traits from that reference matter?
- Which sample-tool reconciliation and profile issues must be fixed before a trustworthy export can
  be generated?

## Revision history

| Version | Date | Summary |
|---|---|---|
| **v0.4** | **2026-07-30** | Logged the successful fresh, read-only 22,952-file inventory; recovery remains unresolved and no audio/output was created. |
| **v0.3** | **2026-07-30** | Defined the crate TSV as the authoritative export-set record, the OT staging path, copy-only lifecycle and separate device-crate rule. |
| **v0.2** | **2026-07-30** | Added the bounded cross-repo progress ledger and approved `octatrack-pilot-01`: maximum 15 files, aligned to T1–T4/T8; recovery review remains the export gate. |
| **v0.1** | **2026-07-29** | Initial approved WIP design: preservation boundary, evidence gates, role experiments, pilot crate and repo-wide reconciliation requirements. |
