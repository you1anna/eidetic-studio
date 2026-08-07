# Current-session checklist — design

**Date:** 2026-08-07  
**Status:** Approved for implementation

## Purpose

Keep one page open while working in the studio. It replaces chat history as the place to see exactly
what to do, one self-contained chunk at a time.

## Location and role

`guides/current-session.md` is the live checklist.

- It shows the current chunk in full: starting state, every action, expected result, stop condition,
  success check and what to report when the chunk is complete.
- It shows the next chunk only as a title, so the direction is clear without mixing instructions.
- It records completed chunks and Robin's observed results.
- `devices/*.md`, `guides/sample-device-masterplan.md` and `knowledge-base.md` remain the underlying
  reference material. The checklist links to them but is the page Robin monitors.

## First chunk: clean Octatrack baseline

The first checklist chunk formats the Octatrack CompactFlash card, then creates one named working
Set/project and restores the project-specific clock settings. Formatting is chosen because old OT
Sets, projects and samples have no preservation value.

This is deliberately **not** a factory reset. Formatting destroys everything on the CF card, so the
checklist must state that consequence before the confirmation action. It does not authorise changes
to the TR-8S.

The TR-8S keeps its existing kit skeleton, kick routing, MIDI and sync configuration. Its later
sample-loading chunk may add an approved user sample only where the native voice is insufficient;
it must never delete existing TR-8S user samples until the dependency behaviour is verified.

## Checklist flow

1. **Clean Octatrack baseline** — format CF; create working Set/project; set and save OT clock
   settings; prove the downstream transport works.
2. **Load one prepared loop** — copy the selected 140 BPM percussion loop to the new Set; load it to
   OT Track 4; set tempo handling; prove it plays; save and power-cycle.
3. **Build the useful palette** — add only selected approved groups to the appropriate device.
4. **TR-8S addition only if needed** — import and assign one approved sample without altering the
   protected kick or configuration.

Each chunk is marked `READY`, `WAITING FOR RESULT`, `BLOCKED` or `DONE`. A mismatch stops that
chunk; the checklist records the observed screen before any workaround is attempted. Manual-derived
hardware instructions retain `⚠` until verified on this rig.

## Acceptance checks

- Opening `guides/current-session.md` immediately answers: “What do I do now?”
- Robin can complete a chunk without reading chat history.
- The Octatrack clean baseline contains no historical samples or projects.
- The TR-8S configuration remains unchanged.
- Each completed chunk has a recorded result and its saved/reload state is known.
