#!/usr/bin/env bash
# Capture-and-push helper for the eidetic-studio knowledge base.
#
# Run this after ANY change to this repo (a new/updated device answer, a fixed
# fault, an edited guide). It stages everything, commits, and pushes to GitHub
# so nothing is ever lost and the private remote stays current.
#
#   Usage:  scripts/sync.sh "short message describing what changed"
#
# Safe to run any time: if there's nothing to commit it just says so and exits 0.
set -euo pipefail

# Always operate on this repo, regardless of caller's working directory.
cd "$(dirname "$0")/.."

if [ -z "$(git status --porcelain)" ]; then
  echo "eidetic-studio: nothing to sync (working tree clean)."
  exit 0
fi

msg="${1:-Update studio knowledge base}"

git add -A
git -c user.name="Robin Miklinski" -c user.email="robin.miklinski@gmail.com" \
    commit -q -m "$msg"

# Push if a remote is configured; never fail the whole run if offline.
if git remote get-url origin >/dev/null 2>&1; then
  if git push -q origin HEAD 2>/dev/null; then
    echo "eidetic-studio: committed + pushed — $msg"
  else
    echo "eidetic-studio: committed locally (push failed — offline? run scripts/sync.sh again when online) — $msg"
  fi
else
  echo "eidetic-studio: committed locally (no remote) — $msg"
fi
