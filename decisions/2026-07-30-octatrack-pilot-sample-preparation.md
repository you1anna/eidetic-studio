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
- Lasting choices are separate dated files in `decisions/`; operational faults go in `issues/`.
- Tool-generated evidence lives under a named `octatrack-pilot-01` run in the sample-tools working
  area and remains rebuildable. `_EXPORT/` stays derived output only.
- The first export must be previewed with `sample-export octatrack --list`, then `--dry-run`, before
  a conversion is allowed.
- A real session may show that this allocation is cumbersome or that another device is better for a
  role. Record that observation and revise the pilot; do not treat this decision as an architecture
  change.
