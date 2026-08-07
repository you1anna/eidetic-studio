# Living studio session board — design

**Date:** 2026-08-07  
**Status:** Approved for planning  
**Scope:** Presentation and progress tracking only; no wiring, clock or device-role changes.

## Purpose

Create one friendly page that tells Robin what to do now, what result to expect and exactly how to
reply. The board replaces long chat instructions during a working session. The existing masterplan,
device pages and knowledge base remain authoritative reference material.

## Location and ownership

The live page will be `guides/current-session.md`.

- `guides/current-session.md` owns the current checkpoint, progress and open questions.
- `guides/sample-device-masterplan.md` retains the full multi-device sequence.
- `devices/*.md` retain literal device procedures and their source status.
- `knowledge-base.md` remains authoritative for physical wiring and architecture.

The board links to those sources instead of duplicating entire procedures.

## Page layout

The top of the page contains the only action Robin needs to consider:

1. **Current status** — device, phase, state and last update.
2. **Do this now** — starting state plus one short numbered action block.
3. **What you should see** — the expected screen or audible result and the mismatch condition.
4. **Reply with** — one exact response such as `copied`, `I see <message>` or a short observation.

Lower sections retain context without competing with the active step:

- **Completed** — checked milestones with evidence links.
- **Questions and observations** — Robin's questions, answers and unresolved discrepancies.
- **Coming later** — a collapsed roadmap of later chunks, not instructions to perform now.
- **Reference links** — the current export, device page and masterplan.

## Status model

Use only these labels:

- `READY` — Robin can perform the displayed action.
- `WAITING FOR ROBIN` — the action has been given and the board awaits the stated reply.
- `BLOCKED` — a mismatch or missing prerequisite prevents safe progress.
- `DONE` — the checkpoint has been observed and recorded.

Only one current action may be `READY` or `WAITING FOR ROBIN`. Later steps never appear as active
instructions.

## Update flow

1. Codex reads the current board and the authoritative device procedure.
2. Codex presents one action block in chat and on the board.
3. Robin replies with the requested result or asks a question.
4. Codex records the observation, answers the question and either advances one checkpoint or marks
   the current checkpoint `BLOCKED`.
5. Any newly verified hardware fact is also captured in the correct device or issue page.
6. Every repository edit ends with `scripts/sync.sh`.

The initial board starts at the Octatrack CompactFlash copy checkpoint for
`DL01_tribal-t_000a.wav`. The next checkpoint—Track 4 loading—must not appear as the active action
until Robin confirms that the file copy is complete.

## Safety and discrepancy handling

- A board summary never overrides a device page or the knowledge base.
- Manual-derived hardware steps retain the `⚠` marker until observed on the rig.
- If the device differs from the documented expectation, stop at that exact screen, mark the board
  `BLOCKED`, capture what Robin sees and correct the authoritative procedure before continuing.
- Questions do not reset progress. They remain logged below the current action, and the active
  checkpoint stays unchanged until its success condition is met.
- No sample is transferred, assigned or deleted merely because it appears on the later roadmap.

## Acceptance checks

The first version is acceptable when:

- opening the page immediately reveals one action and one requested reply;
- the current Octatrack export is a clickable local link;
- completed and future work cannot be mistaken for current instructions;
- all hardware steps link back to their authoritative procedure and preserve `⚠` status;
- the board can be advanced by editing one checkpoint without restructuring the page;
- the studio repository is clean after the mandatory sync.
