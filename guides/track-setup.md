# Eidetic Studio — Track Setup

**Version:** v2.1 · 2026-08-03
**Replaces:** v1.0 track allocation guide (delete it)

This is the current, proven **starting template**, not a final device-role decision. For the guided
sample-selection, loading and Ableton workflow, start with
[`sample-device-masterplan.md`](sample-device-masterplan.md). It tests this allocation on the rig
before any role becomes permanent.

---

## Octatrack — the 8 tracks

| Track | Machine | What lives on it | What you do with it |
|---|---|---|---|
| **1** | Static | Loop A | Your main loop. Swap it mid-take without stopping |
| **2** | Static | Loop B | Second loop. Crossfade or layer against Track 1 |
| **3** | Flex | Vocal phrase | Slice it, sequence the chops. This is your vocal engine |
| **4** | Flex | Percussion loop | Sits under the drums, stretched to tempo |
| **5** | Flex | Live capture A | Empty. Records whatever you're playing, instantly |
| **6** | Flex | Live capture B | Empty. So capture A survives when you grab another |
| **7** | Thru | Desk Aux return | Delay/reverb for anything you send from the mixer |
| **8** | Static | Loop C — *or* master track | See below. Currently Static |

### Track 8 — your choice

**Master is not a machine type.** You won't find it alongside Static/Flex/Thru/Neighbor/Pickup. It's a setting in the **PROJECT menu, under CONTROL** — look for the TRACK 8 option. Switch it on and track 8 stops playing samples; its track effects process everything else instead.

| Setting | You get | You lose |
|---|---|---|
| **Master ON** | Filter/comp sweep across the whole Octatrack in a scene | Track 8 as a sound source — seven tracks make sound |
| **Master OFF** (current) | A third loop slot on Static | No whole-mix sweep |

Keep it OFF unless you actually want a slow filter close across everything during a breakdown. The Soundcraft already glues the mix and the crossfader already gives you performance moves.

### The three machine types you use

- **Static** — plays long files straight off the CF card. Use for loops you switch between.
- **Flex** — loads into memory. Use for anything you slice, stretch or record live.
- **Thru** — no sample, just passes the mixer's Aux send through the Octatrack's effects.

### The TB-03

Sequenced on **MIDI track 1, channel 2**. The Octatrack's MIDI tracks are separate from the eight above — the bassline costs you nothing.

---

## Digitakt — the 8 tracks

One-shots only. Never loops — pitching a sample on the Digitakt also changes its speed, so loops drift.

| Track | What lives on it |
|---|---|
| **1** | Metallic percussion |
| **2** | Toms, low percussion |
| **3** | Claps, rims, snare accents |
| **4** | Impacts, rumble hits |
| **5** | Vocal stabs — single words, breaths |
| **6** | Noise and texture hits |
| **7** | Empty — records the mixer's Group bus |
| **8** | Empty — second recording slot |

Load 30–50 sounds into the Sound Pool before you start. Any of them can be dropped onto any step.

---

## TR-8S — the drum engine

| Slot | Sound |
|---|---|
| **1** | **Kick** — always Assign 1 |
| 2 | Clap or snare |
| 3 | Closed hat |
| 4 | Open hat |
| 5 | Ride or cymbal |
| 6 | Shaker / 16th roll |
| 7–11 | Extra percussion |

Slot 1 never moves. The kick on Assign 1 is what feeds the rumble.

---

## Starting destinations for the first palette

These are first destinations to test, not a direct folder-to-device rule. Listen first, keep separate
device crates, and move material when the on-rig trial proves a better home.

| Folder | Machine | Track |
|---|---|---|
| `DRUM-LOOPS/`, music loops | Octatrack | 1, 2, 8 |
| `VOCALS/` — phrases, acapellas | Octatrack | 3 |
| `PERC/` loops | Octatrack | 4 |
| `PERC/` hits, `CLAP-SNARE/` | Digitakt | 1–3 |
| Impacts, noise | Digitakt | 4, 6 |
| Vocal stabs — single words | Digitakt | 5 |
| `KICKS/`, `HATS-CYM/`, core drums | TR-8S | 1–6 |
| Other percussion hits | TR-8S | 7–11 |

**When you're unsure where a sample goes, use this first test:**

- Does it need to stay in time? → **Octatrack**
- Is it a single hit or accent? → **Digitakt**
- Is it a core drum voice? → **TR-8S**

---

## File formats

| Machine | Format |
|---|---|
| Octatrack | 16-bit, **44.1 kHz** |
| Digitakt | 16-bit, **48 kHz**, mono |
| TR-8S | WAV up to 96 kHz; AIFF at 44.1, 48 or 96 kHz; 8–32-bit; mono or stereo. The first export profile remains to be chosen on the rig. |

Ableton runs at 48 kHz, so anything going to the Octatrack gets converted to 44.1 kHz first.
Digitakt Transfer converts incoming files to its native format. Do not batch-convert for the TR-8S
until the first controlled import chooses the studio's practical export profile.

---

## Three things that bite

1. **Tracks 5 and 6 stay empty.** They're for live capture. If you load a file onto them you lose your recording slots.
2. **Save the Part** before you save the project, or your scenes and machine assignments vanish on reload.
3. **Aux and Group sends on mixer channels 9/10 stay at zero.** Those channels carry the Octatrack's own output — raising them creates a feedback loop.

## Revision history

| Version | Date | Summary |
|---|---|---|
| **v2.1** | **2026-08-03** | Reclassified the allocation and source mapping as a starting template for the master-plan role trial; recorded the verified TR-8S import formats while leaving its practical export profile open for a controlled test. |
| v2.0 | 2026-07-19 | Current track, slot and sample-folder allocation template. |
