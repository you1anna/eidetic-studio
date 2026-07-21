# CLAUDE.md

Follow [`AGENTS.md`](AGENTS.md) — it is the complete operating manual for this repo (same for Claude
Code and Codex).

TL;DR: this is Robin's **private studio knowledge base**. Answer hardware "how do I…" questions from
`devices/*.md` + `guides/` + `knowledge-base.md` (grep first, don't web-search if it's captured). When
you learn or correct something, capture it in the right file — never invent button sequences — and
then **always run `scripts/sync.sh "what changed"`** to commit + push.

## Relationship to command-center

Registered in the hub (`command-center/projects.md`) so it's discoverable across machines, but this
repo is self-syncing via `scripts/sync.sh` and owns all its own state — the hub does **not** track its
day-to-day. Only fold a decision back to the hub when it affects cross-project state (rare for a KB):
run `journal note "<one line>"` (the bridge on `$PATH`). Cloned per-host under `~/Projects`; git on
`main` is the only path between the Air and Mac mini. See
`command-center/prompts/dayflow-module.md` → "Two session types + the bridge".
