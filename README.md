# Eidetic Studio — source of truth

The **single source of truth** for the physical Eidetic Studio: how it's wired, how it's clocked, how a session runs, and the issues encountered along the way. Git-tracked so the setup can't drift silently. **Private repo** — this is personal studio knowledge, not the public `eidetic-sample-tools` product.

## What's here

| Path | What it is |
|---|---|
| `knowledge-base.md` | Canonical wiring/architecture: channel map, patchbay, MIDI/USB routing, monitoring. Supersedes every earlier note and diagram. |
| `diagrams/` | Current v8 diagram set (PNG + SVG): system overview, patchbay wiring, MIDI/USB routing, build order. |
| `guides/midi-sync.md` | DIN clock chain config (OT → Digitakt → TR-8S → TB-03) + Ableton's relationship to it. Merged canonical (v1.2). |
| `guides/session-method-a.md` | Full session workflow: device roles, Method-A rumble, resampling, phase-by-phase cycle. |
| `guides/track-setup.md` | Per-machine track/slot allocation and sample-folder → track mapping. |
| `issues/` | Dated log of setup faults and their fixes. |
| `decisions/` | Dated decision records (`YYYY-MM-DD-title.md`, Decision / Rationale / Consequences). |

## Where the rest of the studio lives (not in this repo)

- **Sample library:** `/Volumes/Extreme SSD/Production/SAMPLES` — managed by the `eidetic-sample-tools` CLI (public repo).
- **Ableton project archive:** `/Volumes/Extreme SSD/Production/ABLETON_PROJECTS` (167+ `.als`).
- **Active Ableton scratch:** `~/Projects/Production` (internal disk, work-in-progress sets).
- **Raw pre-git backup of this knowledge:** `/Volumes/Extreme SSD/Production/_studio-archive` (the old `Studio/` folder, cold backup).
- **Tooling:** `~/Projects/eidetic-sample-tools` (public CLI product for sample library management + device export).

## Conventions

- This repo is the authority. If a diagram, a taped label, or memory disagrees with `knowledge-base.md`, the KB wins — or the KB is wrong and gets updated here first.
- Log every real fault in `issues/` (symptom → cause → fix) so it's never re-derived. Record every committed setup change in `decisions/`.
- Worked on from both Claude Code and Codex/ChatGPT — see `AGENTS.md`.
