# 2026-08-04 — Demote the PACKS recovery gate from blocker to open risk

## Decision

The 130 absent protected `PACKS/` identities and the one missing Foundation identity are **no longer
a blocker on selection, promotion or export**. They are reclassified as an open library-integrity
risk that remains recorded and unresolved.

This unblocks the Phase 2 promotion into `CURATED/`. It changes nothing else: the source-library
copy-only boundary stands, and no `--apply` organisation, intake, dedupe or catalogue-migration
command is permitted.

## Rationale

The gate was standing in for a guarantee that the code already provides per file.
`promote_favourites` in `eidetic-sample-tools` (`library-tools/src/librarytools/curate.py`) resolves
every labelled row against the current inventory, re-computes its SHA-256, and raises `CurationError`
on `stale or missing source` or `hash changed since inventory scan` before copying anything. A file
that is absent or altered cannot reach `CURATED/`, whether or not the historical discrepancy has been
explained.

The 130 entries also sit outside the pilot's path. The forward plan sources from `CURATED/`, filled
by promotion from the inventory; the absent `PACKS/` entries are by definition not in the inventory
and so cannot be selected. Blocking the whole workflow on them protected nothing that promote does
not already protect.

There is also no realistic route to resolving them. The library has no backup, so the discrepancies
cannot be recovered or explained from another copy — the same reasoning already recorded in
[`2026-07-30-octatrack-pilot-sample-preparation.md`](2026-07-30-octatrack-pilot-sample-preparation.md),
which superseded this gate for the no-move pilot on 2026-07-30. This decision extends that
supersession to the workflow as a whole rather than leaving one pilot exempt from a gate that still
nominally blocked everything else.

The practical cost of leaving it in place was measurable: between 2026-07-29 and 2026-08-03 the gate
contributed to 582 lines of planning documentation, one deferred pilot, and no promoted samples.

## Consequences

- **The 130 entries remain unexplained, and may never be explained.** This decision does not recover
  them, does not prove `PACKS/` preservation, and does not authorise inferring why they are absent.
  Anyone reading a preservation claim about `PACKS/` should treat it as unverified.
- The recovery review stays open in `eidetic-sample-tools`. If it later shows the absences were
  caused by a process fault rather than an untracked deletion, that fault must be recorded in
  `issues/` and this decision revisited.
- `guides/sample-device-masterplan.md` §6 now lists the item as an open integrity risk; §2 and Phase 2
  no longer wait on it.
- Trust moves from a document-level gate to a per-file check at promote time. That is only as good as
  the inventory scan behind it, so a promotion run against a stale inventory must be re-scanned rather
  than forced.
- **The no-backup risk is untouched by this decision.** The library remains single-copy — 28 GB across
  22,952 files, `tmutil destinationinfo` reports no destinations configured. Promotion writes a second
  copy on the same physical disk, which is not a backup. Robin declined a backup on 2026-08-04 with
  this stated.
