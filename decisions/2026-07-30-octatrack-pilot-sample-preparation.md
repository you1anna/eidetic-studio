# 2026-07-30 — Octatrack-first sample-preparation pilot

## Decision

Run a small, listening-led Octatrack pilot before any wider device export. Its stable run ID is
`octatrack-pilot-01`; it may contain no more than 15 approved files:

| Intended Octatrack destination | Maximum files | Current track role |
|---|---:|---|
| Loop A | 3 | T1 Static |
| Loop B | 3 | T2 Static |
| Vocal Phrase | 3 | T3 Flex |
| Percussion Loop | 3 | T4 Flex |
| Loop C | 3 | T8 Static |

T5 and T6 stay reserved for recorder buffers and T7 remains the Thru path. This is a pilot
selection boundary only; it does not settle the final device-role split.

No selection, promotion, conversion or CompactFlash transfer may begin until the sample-tools
human recovery review resolves or deliberately quarantines the recorded 130 protected `PACKS/`
identity discrepancies and the one missing Foundation identity. Once that gate is passed, every
candidate must be listened to, labelled and hash-verified before it can enter `CURATED/` or an
Octatrack crate.

**Superseded for this separate no-move pilot, 2026-07-30:** the current library has no backup, so
the historical discrepancies cannot be recovered or explained from another copy. They remain
preserved evidence, but do not block `octatrack-pilot-01`. Its source-library operations are limited
to read-only review and hash checking; its only writes are copies into `CURATED/`, converted copies
under `_EXPORT/`, and a later CompactFlash copy. No `--apply` organisation command is permitted.

## Rationale

The existing OT template has five sample-playing roles (T1–T4 and T8). Three alternatives per role
provide an A/B/C choice without creating a browsing exercise during a writing session. The 15-file
ceiling is small enough to audition completely, repeat from evidence, and test the current working
hypothesis that the OT is best for tempo-dependent loops and longer vocal material.

The public `eidetic-sample-tools` repository remains the authority for library inspection,
curation, manifests and device conversion. This private repository records the physical-rig context,
the intended musical use and the observed result. It does not contain personal sample names, paths,
audio or generated manifests.

## Consequences

- `guides/sample-device-workflow-wip.md` holds a bounded current-state ledger: one row per gate
  transition or reproducible run, not a running session diary.
- The crate TSV `library-tools/manifests/crates/octatrack-pilot-01.tsv` is the authoritative record
  of what is set for the OT export. It pins each approved `CURATED/` copy to its role, descriptor,
  reason and SHA-256 identity; the exporter validates those identities again.
- The corresponding converted staging copy belongs only below
  `_EXPORT/OCTATRACK/EIDETIC-CURATED/AUDIO/octatrack-pilot-01/`. It is rebuilt from the crate and
  never substitutes for it as the selection record.
- Lasting choices are separate dated files in `decisions/`; operational faults go in `issues/`.
- Tool-generated evidence lives under a named `octatrack-pilot-01` run in the sample-tools working
  area and remains rebuildable. `_EXPORT/` stays derived output only.
- The first export must be previewed with `sample-export octatrack --list`, then `--dry-run`, before
  a conversion is allowed.
- A real session may show that this allocation is cumbersome or that another device is better for a
  role. Record that observation and revise the pilot; do not treat this decision as an architecture
  change.
