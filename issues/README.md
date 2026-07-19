# Studio issues log

Dated record of real studio faults and their fixes, so nothing gets re-derived from scratch.

## Convention

One file per fault: `YYYY-MM-DD-short-symptom.md`. Structure each as:

- **Symptom** — what you actually observed (exactly as it presented — often a symptom looks like a different fault).
- **Cause** — the root cause once found.
- **Fix** — the concrete steps that resolved it.
- **Prevention** — the standing change (a KB/guide edit, a power-up check) so it can't recur silently. Link the guide/KB section updated.

Keep it terse and factual. If a fault produced a permanent config decision, also record it in `../decisions/` and update the relevant guide.

## Known faults already folded into the guides

These happened before this log existed and are captured in `../guides/midi-sync.md`:

- **TR-8S Soft Thru OFF after factory reset** → TB-03 dead, rest of chain fine. (midi-sync §1 Fault 1, §4)
- **TR-8S Tempo Sync = AUTO gives USB clock priority over DIN.** (midi-sync §1 Fault 2, §4)
- **Fresh Octatrack project starves the chain of clock** (CLOCK/TRANSPORT SEND default OFF); TR-8S sits silent on PLAY, looks like a volume fault. Confirmed 2026-07-19. (midi-sync §1 Fault 3, §2, §7)
