# AGENTS.md — eidetic-studio operating manual

Read this fully before doing anything. It is written to be followed exactly, even by a small/fast
model. This repo is the **private single source of truth for Robin's physical studio** (Eidetic
Studio) — wiring, clocking, per-device operation, session workflow, faults. Docs only, no code.

Do **not** confuse it with `~/Projects/eidetic-sample-tools` (the public sample-library CLI product).
Keep this repo **private** — it describes a physical space.

---

## The one rule that must never break

**After ANY change you make to this repo, run this — every time, no exceptions:**

```bash
scripts/sync.sh "short message: what you changed"
```

It stages, commits, and pushes to the private GitHub remote. If you forget, a session-end safety net
may catch it, but do not rely on that — run it yourself. Never leave captured knowledge uncommitted.

---

## Map of the repo (where everything is)

| Path | Contents |
|---|---|
| `knowledge-base.md` | Canonical wiring/architecture: channel map, patchbay, MIDI/USB, monitoring. The authority for anything physical. |
| `devices/` | **Per-device "how do I…" answers** — `octatrack.md`, `digitakt.md`, `tr8s.md`, `tb03.md`. The local answer store. `_TEMPLATE.md` = shape for a new device. |
| `guides/` | `midi-sync.md` (clock chain), `session-method-a.md` (session workflow), `track-setup.md` (track/slot allocation). |
| `issues/` | Dated fault log (`YYYY-MM-DD-symptom.md`): symptom → cause → fix → prevention. |
| `decisions/` | Dated committed decisions (`YYYY-MM-DD-title.md`): Decision / Rationale / Consequences. |
| `diagrams/` | Current v8 diagram set (PNG+SVG). |
| `scripts/sync.sh` | Commit + push helper. Run after every change. |

Rest of the studio (NOT in this repo): samples → `/Volumes/Extreme SSD/Production/SAMPLES`;
Ableton archive → `/Volumes/Extreme SSD/Production/ABLETON_PROJECTS`; active `.als` scratch →
`~/Projects/Production`; old-docs cold backup → `/Volumes/Extreme SSD/Production/_studio-archive`.

---

## Mode A — answer a hardware "how do I…" question (the cheap default)

Do this before any web search — the answer is probably already on disk.

1. Identify the device. **Grep `devices/` for the device + a keyword:**
   `grep -rin "assign\|output" devices/tr8s.md`. Open only that file; read its **"How do I…"** table.
   Also check `guides/` and `knowledge-base.md` for wiring/clock questions.
2. Found it → **answer from it, cite the row, stop.** Do not web-search.
3. Not found → go to Mode B, then answer.

## Mode B — capture new or corrected knowledge (this is what keeps it cheap)

Trigger this whenever: the answer wasn't captured, OR Robin corrects something, OR you verify a new
procedure, OR a fault gets diagnosed.

1. **Get it right from a primary source** — the device's official manual / Roland/Elektron support,
   **not a blog or forum**. If Robin states what he sees on the actual hardware, **his on-rig
   observation wins** over any document.
2. **Write it down in the right place:**
   - A device procedure → a new row in that `devices/<device>.md` **"How do I…"** table:
     `| task (as Robin would ask it) | exact button/menu steps | source (manual + page, or "on-rig YYYY-MM-DD") |`
   - A new device with no file yet → copy `devices/_TEMPLATE.md` to `devices/<device>.md` and fill it,
     then add it to the table in `devices/README.md`.
   - A fault you solved → a file in `issues/`. A committed setup change → a file in `decisions/`.
   - A change to how the studio is wired → edit `knowledge-base.md` (and the diagram if affected).
3. **NEVER invent a button sequence.** If you cannot verify it, write the row with a ⚠ and
   `source: to verify` instead of a confident guess. A wrong hardware step is worse than none.
4. **Run `scripts/sync.sh "<what you captured>"`.**

## Mode C — always sync

Any edit here, however small, ends with `scripts/sync.sh "..."`. That is the whole "auto-push" story:
one command, run it.

---

## Conventions

- `knowledge-base.md` is canonical. If a guide, diagram, or device file conflicts with it, the KB
  wins — or the KB is wrong and you fix it here first (then sync).
- Guides carry a version + revision-history table; bump the version when you edit one.
- British English, plain and specific. Menu paths and parameter names must match the device manuals
  (or Robin's on-rig correction).

## Do not change without asking Robin

- `knowledge-base.md` architecture/channel-map facts — they mirror the real rig; edit only after a
  verified physical change.
- The committed device decisions in `guides/midi-sync.md` §8 (clock model, channels, Tempo Sync).
- These are safe to grow freely (that's the point): `devices/*.md`, `issues/`, `decisions/`.
