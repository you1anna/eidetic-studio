# Devices — hardware quick reference

Per-device operational reference. This is the **local answer store** for "how do I do X on this box"
questions — so an agent (or you) can answer from disk instead of searching the web or re-deriving
from manuals every time.

## Lookup protocol (for agents — do this first, it's the cheap path)

1. Identify the device, then **`grep` this folder** for the device + a keyword from the question,
   e.g. `grep -rin "assign\|output" devices/tr8s.md`. Open **only** the matching file and read its
   **"How do I…"** table. Also check [`../guides/`](../guides) (MIDI sync, session, track setup) and
   [`../knowledge-base.md`](../knowledge-base.md) for wiring/architecture.
2. If the answer is here, **answer from it — do not web-search.** Cite the row.
3. **If it's NOT captured yet:** look it up **once** from a primary source (the device's official
   manual / Roland/Elektron support — not a blog), answer, then **append a new row** to that device's
   "How do I…" table: `task | exact steps | source (name + date)`. Next time it's a free local lookup.
4. **Never invent a hardware button sequence.** If you can't verify it, write the row with a ⚠ and
   `source: to verify` rather than a confident guess — a wrong procedure is worse than none.
5. **After writing anything, run `../scripts/sync.sh "<what you captured>"`** to commit + push. Every
   capture ends with a sync. (Full playbook: [`../AGENTS.md`](../AGENTS.md).)

## Device files

| Device | File | Role |
|---|---|---|
| Elektron Octatrack MKII | [`octatrack.md`](octatrack.md) | Sampler/sequencer · **MIDI clock master** |
| Elektron Digitakt MK1 | [`digitakt.md`](digitakt.md) | Drum sampler · MIDI pass-through (probationary) |
| Roland TR-8S | [`tr8s.md`](tr8s.md) | Drum engine · kick on Assign 1 · Soft Thru |
| Roland TB-03 | [`tb03.md`](tb03.md) | Acid bass · end of MIDI chain (ch 2) |
| Soundcraft Signature 12 MTK | [`soundcraft-signature-12-mtk.md`](soundcraft-signature-12-mtk.md) | Analogue summing · OT Aux 1/2 send pair |

## Non-sequenced gear (covered in the knowledge base, not here)

These are wiring/monitoring, not per-box operation — see [`../knowledge-base.md`](../knowledge-base.md):

| Gear | Where |
|---|---|
| PreSonus Studio 192 (input map, preamp vs line, UC Surface scenes) | KB §0.4, §3.6, §11 |
| Pioneer DJM-850 (guest DJ capture path) | KB §3.6, §12 |
| Dynaudio BM9S sub + Yamaha HS8 (monitor chain) | KB §3.5 |
| Samson S-Patch Plus patchbay (rear + front patches) | KB §5 |

If a real "how do I…" need recurs for one of these, spin it its own file here following the same shape.
