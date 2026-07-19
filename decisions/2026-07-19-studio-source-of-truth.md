# 2026-07-19 — Studio setup gets a single git-tracked source of truth

## Decision

Consolidate all Eidetic Studio setup knowledge into this **private git repo (`eidetic-studio`)** as the single source of truth, and stop the drift caused by canonical docs living outside version control.

Specifically:

1. **Studio SOT = this private repo** (`~/Projects/eidetic-studio`, GitHub `you1anna/eidetic-studio`, private). Holds the knowledge base, v8 diagrams, guides (MIDI sync, session Method-A, track setup), an issues log, and this decisions log.
2. **`eidetic-sample-tools` stays public and product-only.** Studio-wiring guides that had been added to it (`e649ad7`) are removed from HEAD. (The public repo is the shareable CLI toolkit; personal studio wiring does not belong there.)
3. **`~/Projects/Production` kept as local Ableton scratch** for in-progress `.als`. The established archive is the SSD at `/Volumes/Extreme SSD/Production/ABLETON_PROJECTS` (167 sets). All documentation removed from `Production` — it now lives here in git.
4. **The old `Studio/` folder** (identical copy already on the SSD) is renamed `/Volumes/Extreme SSD/Production/_studio-archive` as a cold pre-git backup; the redundant internal copy is deleted.
5. **MIDI-sync guide reconciled** to one canonical `guides/midi-sync.md` v1.2: the screenshot-verified 2026-07-16 manual-tempo model (Digitakt CLOCK SEND = OFF, no Ableton tempo-follow), plus the 2026-07-19 "new Octatrack project starves the chain" gotcha (Fault 3). The competing tempo-follow/CLOCK SEND=ON draft was rejected.

## Rationale

- Canonical setup docs lived in `~/Projects/Production`, which was **not** a git repo — so changes were invisible, undated, and prone to conflicting copies (two live "v1.1" MIDI guides with contradictory decisions; a 3-layer self-duplicating archive).
- `eidetic-sample-tools` is **public**; committing patchbay/channel-map/MIDI-routing there would expose personal studio detail. A separate private repo keeps the public product story clean and the private wiring private, both under git.
- An Ableton project archive already existed on the SSD; making `Production` a second archive would re-create the drift. Keeping it as scratch with a clear pointer to the SSD archive avoids two competing homes.

## Consequences

- Editing studio setup now means a commit here — dated, diffable, one place. Agents (Claude Code + Codex) start from `README.md`/`AGENTS.md`.
- The command-center hub is updated to register both repos and the new path roles (Production = scratch, SSD `ABLETON_PROJECTS` = archive, SSD `_studio-archive` = old Studio backup).
- **Open item:** the two studio guides remain in `eidetic-sample-tools` *history* (commit `e649ad7`, already on public GitHub). Removing them from HEAD stops future exposure; a history scrub (git-filter-repo/BFG + force-push) is a separate follow-up decision if the exposure matters.
