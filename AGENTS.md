# AGENTS.md — eidetic-studio

Entry point for Codex/ChatGPT, Claude Code, and any other agent working in this repo.

## Read first

1. `README.md` — what this repo is and where the rest of the studio lives.
2. `knowledge-base.md` — canonical wiring/architecture. The authority for anything physical.
3. The relevant `guides/*.md` for the task (MIDI sync, session workflow, track setup).

## What this repo is

The **private source of truth for the physical studio setup** — wiring, clocking, session workflow, and a dated issues log. Documentation only; no code. Do not confuse it with `~/Projects/eidetic-sample-tools` (the public CLI product).

## Conventions

- `knowledge-base.md` is canonical. If a guide or diagram conflicts with it, the KB wins; fix the source here rather than adding a contradicting note elsewhere.
- New faults → `issues/YYYY-MM-DD-symptom.md` (symptom → cause → fix). New committed setup changes → `decisions/YYYY-MM-DD-title.md` (Decision / Rationale / Consequences).
- Guides carry a version + revision-history table. Bump the version and log the change when editing.
- Prose is British English, plain, specific. Menu paths and parameter names must match the primary device manuals.

## Sensitive / external (do not commit here)

- Sample library data (`/Volumes/Extreme SSD/Production/SAMPLES`) and Ableton projects (`/Volumes/Extreme SSD/Production/ABLETON_PROJECTS`, `~/Projects/Production`) — large binary/media, they live outside git.
- This is a **private** repo because it describes a physical space. Keep it private.

## Do not change without asking

- `knowledge-base.md` architecture/channel-map facts — these mirror the real rig; edit only after a verified physical change.
- The committed device decisions in `guides/midi-sync.md` §8 (clock model, channels, Tempo Sync) — these were verified against hardware and screenshots.
