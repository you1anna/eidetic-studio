# Eidetic Studio — Knowledge Base

**Document version:** v2.5
**Last updated:** 2026-07-19
**Corresponds to diagram set:** **v8 — all four sheets** (footers read "v8 · July 2026"). v8 = v7 content plus the no-speculative-runs rule: patchbay rows 7–8 and 17–18 are left **unwired** (previously "synth-ready"/"flex" dest-side runs). Sheet 3's Digitakt USB label was corrected in v2.5: **Overbridge is not used**. The v8 set supersedes v6 and v7 entirely — delete all older copies.
**Owner:** Robin · DJ Eidetic · *Late Night Relics* on AAJA Radio

**Document suite — this KB is one of three companions:**
- **Knowledge Base (this file)** — *how the studio is wired*: architecture, channel map, patchbay, MIDI/USB, monitoring, warnings.
- **Sound & Production Workflow (v1.3)** — *what to do with it*: target sound, hybrid capture, element build order, performance sample layer (loop/vocal hot-switching), mix/master chains.
- **Claude Code Operating Brief (v0.2)** — *what to offload to AI*: the automation surface (bounce analysis, sample prep, doc/versioning) and what stays manual.

> **Single source of truth.** This document supersedes every earlier note. Where any diagram, text dump, or memory disagrees with this file, **this file wins.** The Channel Map (§4 / §0.2), Patchbay Map (§5 / §0.3) and PreSonus Input Map (§0.4) have drifted between versions before — treat them as authoritative and do not "tidy" them without a deliberate reason recorded in §15.

> **For a future assistant reading this:** the rig is fully specced and operational below. You do not need to re-derive the architecture. If asked to modify it, change this document and the diagrams together, and add a line to the revision history (§15). The validated hardware facts in §11 are sourced from primary manuals — please don't re-litigate them from forum posts.

---

## 0. Quick reference

### 0.1 Open items

| # | Item | Status | Notes |
|---|---|---|---|
| 1 | **Soundcraft mains re-route** | ⚠ **Physical action outstanding** | Design fully specified as of v2.3: Soundcraft Main XLR → **PreSonus In 7–8** (rear line, XLR(F)→TRS ×2); PreSonus Main Out → BM9S → HS8s. Previously deferred pending the In 1–2 vs line-input question — now resolved (§0.4, §11). Cables specced in §9. |
| 2 | **Sub model naming** | ⚠ Verify label | Robin referred to the sub as "BM92" on 2026-07-09; the model confirmed on 2026-07-02 (specs matched against the manual: all-XLR I/O, SAT HP Flat/60/80 Hz, SUB LP 50–150 Hz, ~29 Hz extension) is the **Dynaudio BM9S**. Dynaudio never made a "BM92". Check the rear badge once; if it genuinely differs, update §3.5 and this line. |
| 3 | **DJM-850 gain trim** | 🔧 One-time setup | On first connection, trim PreSonus front In 1–2 preamps to ~−12 dBFS peaks with a loud reference track playing; the Studio 192 preamps are digitally recallable, so save the scene in UC Surface (§3.6). |

### 0.2 Soundcraft channel map (authoritative)

| Ch | Source | Notes |
|---|---|---|
| 1 | **KICK** (TR-8S Assign 1) | **dbx limiter** — drive for analogue saturation |
| 2 | **TB-03** | **dbx limiter** — drive for analogue saturation |
| 3 | TR-8S Main L | |
| 4 | TR-8S Main R | |
| 5 | Digitakt L | |
| 6 | Digitakt R | |
| 7/8 | Future synth (empty) | Stereo jack pair |
| 9/10 | Octatrack Main L/R | **Zero all Aux + Group sends here** (feedback risk — §10.2) |
| 11/12 | Reference playback | **RCA only** — INTERVAL MUTE for A/B. Do NOT earmark for a synth. |

> The DJM-850 does **not** go through the Soundcraft. It connects directly to the PreSonus front inputs (§3.6).

### 0.3 Patchbay map (authoritative — Samson S-Patch Plus, half-normal)

**Rear (permanent):** see §5.1.
**Permanent front-panel capture taps (leave in):** row 1 front-top → PreSonus In 5 (dry kick); row 2 front-top → PreSonus In 6 (dry TB-03). See §3.4 and §5.2.

### 0.4 PreSonus Studio 192 input map (fixed — REVISED in v2.3)

The Studio 192's physical input architecture (verified, §11): **Inputs 1–2 are the two FRONT-panel mic/instrument combos and always pass through the XMAX preamps** (XLR = mic gain stage, max +12 dBu at min gain; ¼″ = unbalanced hi-Z instrument). **True line inputs exist only on rear inputs 3–8**, where the combo ¼″ TRS legs bypass the preamps entirely, direct-to-ADC. The v2.2 plan of landing the console sum on "In 1–2 line inputs" was therefore physically impossible — the sum has moved to In 7–8, and the front pair becomes the guest/mic slot. This is a strict improvement: cleaner conversion and more headroom for the sum, and the front panel is free for exactly the plug-in-and-go DJM use case.

| Input | Physical | Source | Role |
|---|---|---|---|
| 1–2 | **Front combo (via XMAX preamp)** | **DJM-850 REC OUT** (when connected) / vocal mic | Guest slot — DJ set capture (§3.6) or vocal tracking |
| 3–4 | Rear line (bypasses preamp) | Octatrack Cue L/R | "Pull one element out" stem on demand |
| 5 | Rear line (bypasses preamp) | Dry kick (PB row 1 front tap) | Feeds the in-the-box rumble + low-end carve |
| 6 | Rear line (bypasses preamp) | Dry TB-03 (PB row 2 front tap) | Recorded stem; optional sidechain / sub source |
| 7–8 | Rear line (bypasses preamp) | **Soundcraft Main Mix L/R** | Glued stereo sum — body + master reference |

**Trade-off accepted:** In 7–8 are no longer held free for a future-synth stem. A future synth sums through the desk regardless (SC ch 7/8); if an isolated synth stem is ever needed, capture it via the OT Cue path or temporarily swap a front tap. Recorded in §15.

---

## 1. Identity & context

| Field | Detail |
|---|---|
| Artist alias | DJ Eidetic |
| Show | *Late Night Relics* — AAJA Radio |
| Genre target | Contemporary hypnotic / driving / hard-minimal techno — Chlär, Chontane, ANNĒ, Hemka, Rosati |
| Day job | AI QE leader, Reward Gateway |
| Primary machine | Mac mini M4 Pro (also the day-job machine — treat stability as a hard requirement) |
| OS | macOS Tahoe 26 |
| DAW | Ableton Live 12 Suite (stable 12.4; keep on latest 12.x) |
| Use case split | ~50 % live performance / ~50 % studio tracking · DJ set practice/recording as needed |

---

## 2. Hardware inventory

### 2.1 Owned & operational

| Device | Type / role | Critical notes |
|---|---|---|
| Mac mini M4 Pro | Production computer | Also used for day-job work |
| Elektron Octatrack MKII | **Centrepiece sampler · sequencer · MIDI clock master** | USB is **CompactFlash transfer only** — no MIDI, no audio, no Overbridge |
| Soundcraft Signature 12 MTK | Analogue summing console | USB **intentionally disconnected** in this config |
| PreSonus Studio 192 | Audio interface + monitor controller | Sole primary interface; direct to Mac mini (not via hub). Front In 1–2 = preamp combos; rear In 3–8 = true line ins (§0.4) |
| **Pioneer DJM-850** | DJ mixer — guest gear | Connects **only when needed**: REC OUT → PreSonus front In 1–2 (§3.6). Its USB soundcard is never used with the Mac |
| Yamaha HS8 (×2) | Studio monitors | Fed from the BM9S SAT outputs (high-passed) — §3.5 |
| **Dynaudio BM9S** subwoofer | Sub for low-end / rumble monitoring | XLR I/O throughout; SAT HP Flat/60/80 Hz; SUB LP 50–150 Hz; phase 0/180°; ~29 Hz extension. (Label check pending — §0.1 item 2) |
| Samson S-Patch Plus 48-point | Patchbay (half-normal) | Installed in the Zaor rack; central routing hub |
| Elektron Digitakt MK1 | Drum sampler / resample target | **Probationary** — reassess ~September 2026 (§13). No timestretch. **USB CONFIG = USB MIDI; Overbridge is not used.** |
| Roland TR-8S | Drum machine + synth | Soft Thru **must** be ON (no hardware Thru port) |
| Roland TB-03 | Acid bass synth | Roland Boutique — **3.5 mm mini output**, not ¼″ TS |
| Arturia MiniLab 3 | USB MIDI controller | DAW control only; not in the clock chain |
| Powered USB hub (OWC/Anker) | Mac mini USB expansion | Hosts MIDI/USB devices; PreSonus stays **direct**, never on the hub |
| Zaor desk + rack mounts | Furniture | Patchbay lives in the rack |

**Software:** Ableton Live 12 Suite (12.4) · full **FabFilter Total Bundle** (Pro-Q, Pro-C, Pro-L, Pro-R, Saturn 2, Timeless 3, Twin 3, Volcano, Sigmund 2, Pro-MB, Pro-DS) · Ableton 12 Suite stock. No-spend path is the default.

### 2.2 Acquisition tracking

| Item | Status | Approx. cost |
|---|---|---|
| Samson S-Patch Plus | ✅ Installed / in use | ~£100 |
| Elektron Octatrack MKII (used) | ✅ Owned & patched in | ~£850–£950 |
| Dynaudio BM9S sub | ✅ Owned | — |
| Powered USB hub | ✅ In use | ~£80 |
| CompactFlash card 8–16 GB | ✅ In use | ~£30 |
| 3× Hosa CSS-800 8-packs (Session 4 rear-bottom runs + capture taps + spares) | ✅ Sourced (eBay · cablestoponline) | — |
| XLR(F)→TRS cables ×2 (Soundcraft mains → **PreSonus In 7–8**) | 🛒 **Buy** — same cable spec as before, revised landing (§0.4, §9) | ~£15 |
| TRS→XLR(M) cables ×2 (PreSonus Main Out → BM9S SAT/SUB IN) | 🛒 **Buy** (§9) | ~£15 |
| XLR(F)→XLR(M) cables ×2 (BM9S SAT OUT → HS8) | 🛒 **Buy** — standard mic cables (§9) | ~£12 |
| **RCA→XLR(M) cables ×2 (DJM-850 REC OUT → PreSonus front In 1–2)** | 🛒 **Buy** (§3.6, §9) | ~£10 |
| 3.5 mm→RCA (reference source → Soundcraft 11/12) | ⚠ Check owned — cheap, enables reference A/B | ~£6 |
| TRS patch cables (~30) | ✅ In use | ~£40 |
| 3.5 mm→dual ¼″ breakout | ✅ In use | ~£8 |
| Octatrack cables (TRS + DIN) | ✅ In use | ~£20 |

### 2.3 Explicitly NOT purchasing (with rationale)

| Item | Reason ruled out |
|---|---|
| Arturia Beatstep Pro | Octatrack MIDI sequencer handles TB-03 more powerfully |
| External headphone amplifier | PreSonus Studio 192 has two independent HP outs (drives 16 Ω–600 Ω) |
| MIDI Thru box | Octatrack MIDI out + Digitakt Thru + TR-8S Soft Thru covers the 4-device chain |
| Nome II / E-RM Multiclock | Octatrack-as-master removes DAW clock jitter; add only if measured drift appears |
| Audio interface upgrade | PreSonus Studio 192 is fully capable |
| Second mixer | Already have the Soundcraft — and the DJM-850 is a *source*, not a summing stage |

---

## 3. Audio architecture ("Option A")

### 3.1 Core principles

- **Soundcraft = pure analogue summing console.** USB physically disconnected; never a macOS audio device. No Aggregate Device required.
- **PreSonus Studio 192 = sole audio interface.** Direct to the Mac mini, never via the hub. The DJM-850's built-in USB soundcard is likewise never used with the Mac.
- **Everything routes through the patchbay first** — except two deliberate exceptions: the Soundcraft Main Mix → PreSonus In 7–8 record feed, and the DJM-850 → PreSonus front In 1–2 guest feed, both of which run direct.

### 3.2 Signal flow overview

```
Hardware sources
    → Patchbay rear (half-normal)
        → Soundcraft channels 1–10 (analogue summing)
            → Soundcraft Main Mix (XLR out)
                → XLR(F)→TRS → PreSonus Inputs 7–8 (rear line) → Ableton / recording

Octatrack Cue L/R
    → Patchbay 13–14 rear
        → PreSonus Inputs 3–4 (rear line) → Ableton (parallel stem recording path)

Patchbay row 1 front-top (KICK mult)  → PreSonus Input 5 (rear line)  (dry kick stem)
Patchbay row 2 front-top (TB-03 mult) → PreSonus Input 6 (rear line)  (dry TB-03 stem)

Pioneer DJM-850 REC OUT (RCA)  [guest — connect when needed]
    → 2× RCA→XLR(M) → PreSonus FRONT Inputs 1–2 (XMAX preamp) → Ableton

Soundcraft Aux 1/2 out (hard-wired)
    → Patchbay 15–16 rear
        → Octatrack Inputs A/B (console send effect — per-channel send knobs)

Soundcraft Group 1/2 out (hard-wired)
    → Patchbay 11–12 rear
        → Digitakt Inputs L/R (resampling bus — press GRP, hit sample)

Monitor chain (committed 2026-07-02 — §3.5)
PreSonus Main Out L/R (TRS)
    → Dynaudio BM9S SAT/SUB IN L/R (XLR)
        → BM9S SAT OUT L/R (high-passed 80 Hz) → Yamaha HS8 L/R (XLR)
```

### 3.3 Target latency

| Parameter | Value |
|---|---|
| Buffer size | 128 samples |
| Sample rate | 48 kHz |
| Round-trip estimate | ~6–8 ms |
| Avoids | macOS Aggregate Device complications entirely |

### 3.4 Hybrid capture (committed) — the In 5 / In 6 stem taps

The committed capture method is **hybrid**: the glued stereo sum is recorded **and**, in the same pass, the **dry kick and dry TB-03 are captured as isolated stems** via permanent half-normal front-panel taps.

- **Row 1 front-top → PreSonus In 5 (dry kick).** Half-normal mults a copy; the kick still flows to Soundcraft Ch 1. **Leave the cable in permanently.**
- **Row 2 front-top → PreSonus In 6 (dry TB-03).** Same.
- In 5/6 are rear **line** inputs (no preamp in the path), trimmed once to ~−12 dBFS peaks in software, **positions noted**. Set and forget.

**Known limit:** surgical kick-vs-bass *separation* after the fact is **not** available — both are baked into the sum. The low-end relationship is therefore set **at the desk** before recording (tune kick + TB-03 to complementary notes, keep the kick decay short, HP the TB-03 slightly so the kick owns the sub). See Workflow §6.

### 3.5 Monitor chain (committed 2026-07-02) — PreSonus in the speaker path

**History:** the Soundcraft mains previously ran directly into the BM9S. That topology is **incompatible with Option A**: the sum can't be recorded, and Mode 2 (Ableton) monitoring plays through speakers the DAW can't reach — you'd hear the raw desk while tracking, never the rumble/sidechain/glue.

**Committed wiring:**

| Leg | Cable | Notes |
|---|---|---|
| Soundcraft Main Mix L/R → **PreSonus In 7–8** | 2× XLR(F) → TRS ¼″ | The record feed. Rear line inputs — direct-to-ADC, no preamp (revised landing, §0.4) |
| PreSonus Main Out L/R → BM9S SAT/SUB IN L/R | 2× TRS ¼″ → XLR(M) | PreSonus main outs are balanced TRS; BM9S inputs are XLR |
| BM9S SAT OUT L/R → HS8 L/R | 2× XLR(F) → XLR(M) | Standard mic cables; signal arrives high-passed per SAT HP setting |

**BM9S settings (starting point):** SAT Highpass **80 Hz** · SUB Lowpass **~80 Hz** (match the handoff) · phase 0/180 by ear (flip while the mono rumble loops; keep the setting with more low-end energy at the listening position). **Alternative:** 60 Hz handoff — the HS8s extend to ~38 Hz, and a lower crossover reduces sub localisation; audition both with a kick+rumble loop and keep the cleaner one. Record the final positions in this section.

**Why this matters for the sound:** with ~29 Hz extension and the mono (single-driver) sub, this chain *is* the mono-sub discipline check — what you hear on the BM9S below the crossover is what a club stack's mono subs will reproduce.

### 3.6 DJM-850 guest path (NEW in v2.3) — plug-in-and-go DJ capture

**Goal:** connect the DJM-850 in under a minute, play through the studio monitors, and record sets into Ableton — with zero repatching of the committed rig.

**Wiring (the only two cables involved):**

| Leg | Cable | Notes |
|---|---|---|
| DJM-850 **REC OUT** L/R (RCA) → PreSonus **front In 1–2** (XLR combo) | 2× RCA → XLR(M) | Leave the cables attached to the DJM in its case/shelf; the studio end just clicks into the front panel |

**Why REC OUT, not Master/Booth:** REC OUT is post-fader/post-FX but **independent of the master level knob** — the recording level stays consistent regardless of how loud the room is turned up, which is exactly what you want for set capture. Its −10 dBV consumer level is also a comfortable match for the XMAX preamps with ~10 dB of gain (the front XLR legs max out at +12 dBu at minimum gain, so the hot XLR Master out would be the wrong feed anyway).

**Setup, once:** trim front In 1–2 to ~−12 dBFS peaks with a loud reference track; the Studio 192 preamps are digitally controlled and recallable, so **save the setting in UC Surface** and it comes back identically every session.

**Monitoring & recording:**
- **Mode 1 (UC Surface direct)** for DJ practice — zero latency, no DAW involvement needed. Sound reaches the room via the normal PreSonus → BM9S → HS8 chain.
- To record: arm In 1–2 in Ableton. For pure set capture, keep Ableton monitoring OFF and stay on Mode 1 (the comb-filter rule, §8/§10.6). Warp/edit afterwards.

**Hard rules:**
- The DJM-850's **USB soundcard is never connected to the Mac** — it would create a second macOS audio device and break the no-Aggregate-Device principle (§10.4a).
- The DJM does **not** route through the Soundcraft or the patchbay. It is a guest source, not part of the summing architecture.
- If a vocal mic session is planned, the mic takes the same front In 1–2 slot — **re-trim and re-save gain when swapping between DJM and mic** (§10.11).

---

## 4. Soundcraft Signature 12 MTK — channel layout

> Verified from the official Soundcraft Signature 10/12 user guide. Earlier (v5) diagrams had labelling errors that v6 corrects.

| Channel(s) | Type | Assigned to | Notes |
|---|---|---|---|
| 1 | Mono mic/line | **KICK** (TR-8S Assign 1) | Switchable **dbx limiter** — drive intentionally for analogue saturation |
| 2 | Mono mic/line | **TB-03** | Switchable **dbx limiter** — drive intentionally for analogue saturation |
| 3 | Mono mic/line | TR-8S Main L | |
| 4 | Mono mic/line | TR-8S Main R | |
| 5 | Mono mic/line | Digitakt L | |
| 6 | Mono mic/line | Digitakt R | |
| 7/8 | Stereo jack pair | Future synth (empty) | |
| 9/10 | Stereo jack pair | Octatrack Main L/R | **Feedback risk — §10.2** |
| 11/12 | **RCA only** — "Playback Channel" | Reference track playback | **Cannot accept balanced/TRS.** INTERVAL MUTE for instant A/B. Do NOT earmark for a synth. |

**Aux 1/2 outputs** → hard-wired to Octatrack Inputs A/B (OT as console send effect)
**Group 1/2 outputs** → hard-wired to Digitakt Inputs L/R (resampling bus)
**Main Mix (XLR)** → XLR(F)→TRS → **PreSonus Inputs 7–8** (rear line)

---

## 5. Patchbay wiring reference

**Unit:** Samson S-Patch Plus 48-point TRS, half-normal mode.
Rear connections are permanent (hardwired). Front-panel patches are workflow-specific — **except the two capture taps in §5.2, which are permanent.**

> **No speculative runs (v2.4 rule).** Cables are committed only to paths in active use. Rows 7–8 (future synth) and 17–18 (OT In C/D flex) stay **unwired** until a real device or recurring need exists — each would have consumed 2 of the 24 CSS-800s for nothing. Committed budget: **14 rear-bottom runs + 2 permanent front taps = 16 cables, leaving 8 true spares** for workflow patches. (If the Digitakt goes in September, rows 11–12 free another 2.)

### 5.1 Rear wiring (permanent / hardwired)

| Row | Source (rear top) | Destination (rear bottom) | Notes |
|---|---|---|---|
| 1 | KICK out (TR-8S Assign 1) | Soundcraft Ch 1 in | dbx limiter channel |
| 2 | TB-03 out (3.5 mm→TRS breakout) | Soundcraft Ch 2 in | dbx limiter channel |
| 3 | TR-8S Main L | Soundcraft Ch 3 in | |
| 4 | TR-8S Main R | Soundcraft Ch 4 in | |
| 5 | Digitakt L | Soundcraft Ch 5 in | |
| 6 | Digitakt R | Soundcraft Ch 6 in | |
| 7–8 | *(reserved: future synth L/R)* | **— leave unwired —** | No synth = no cables. Wire both sides in one go when a synth actually arrives |
| 9 | Octatrack Main L | Soundcraft Ch 9/10 in L | |
| 10 | Octatrack Main R | Soundcraft Ch 9/10 in R | |
| 11 | Soundcraft Group 1 out | Digitakt In L | Resampling bus |
| 12 | Soundcraft Group 2 out | Digitakt In R | Resampling bus |
| 13 | Octatrack Cue L | PreSonus Input 3 | Parallel stem capture |
| 14 | Octatrack Cue R | PreSonus Input 4 | Parallel stem capture |
| 15 | Soundcraft Aux 1 out | Octatrack In A | OT send bus (thru-FX) |
| 16 | Soundcraft Aux 2 out | Octatrack In B | OT send bus (thru-FX) |
| 17–18 | *(reserved: OT In C/D flex)* | **— leave unwired —** | Wire only on a concrete, recurring need — not speculatively |
| 19–24 | Future expansion | — | Unpopulated |

### 5.2 Front-panel patches

**Permanent (leave in):**

| Patch | Rows | Use |
|---|---|---|
| Kick stem tap | Row 1 front-top → PreSonus In 5 | Dry kick stem + feeds in-the-box rumble |
| TB-03 stem tap | Row 2 front-top → PreSonus In 6 | Dry TB-03 stem + optional sidechain |

**Workflow-specific (patch as needed):**

| Patch | Rows | Use case |
|---|---|---|
| Rumble-kick thru-FX | 1 → 15/16 front | Split kick to Aux → OT delay/reverb, resample under dry kick |
| Acid morph thru-FX | 2 → 15/16 front | Split TB-03 to Aux → OT filter/effects morph |
| Digitakt resample | 5–6 → GRP bus active | Enable Group 1/2 on chosen channels; OT captures via rows 11–12 |
| OT thru-FX on any source | Any row → 17–18 front | **Deferred** — requires wiring rear-bottom 17–18 → OT In C/D first (currently unwired by design). Aux 1/2 → OT In A/B covers the send use case |

> The DJM-850 never touches the patchbay — it goes straight to the PreSonus front panel (§3.6).

---

## 6. MIDI chain

```
Octatrack MKII (MIDI Clock Master)
    └─ MIDI Out → Digitakt MK1 MIDI In
                     └─ MIDI Thru → TR-8S MIDI In
                                        └─ Soft Thru (ON) → TB-03 MIDI In
                                                                └─ [end of chain]

Arturia MiniLab 3 → USB → Powered hub → Mac mini → Ableton Live
Digitakt MK1      → USB → Powered hub → Mac mini → Elektron Transfer (USB MIDI mode; no Overbridge)
TR-8S             → USB → Powered hub → Mac mini → no Ableton MIDI/clock role
Octatrack MKII    → USB → [CompactFlash transfer only — no MIDI, no audio]
```

### MIDI device roles

| Device | Role | Clock source |
|---|---|---|
| Octatrack MKII | MIDI clock master, sequencer for TB-03 + other tasks | Internal |
| Digitakt MK1 | Drum sampler, p-locks, MIDI pass-through | Slaves to Octatrack |
| TR-8S | Drum machine / synth, MIDI Soft Thru to TB-03 | Slaves to Octatrack |
| TB-03 | Acid bass, end of MIDI chain | Slaves to Octatrack |
| Arturia MiniLab 3 | DAW control — soft synths, transport, plugin params | USB MIDI to Ableton |

> The DJM-850 is not in the MIDI chain. (It has a DIN MIDI out; ignore it — it has no role here.)

---

## 7. USB topology

```
Mac mini M4 Pro (direct Thunderbolt/USB)
    ├─ PreSonus Studio 192  [DIRECT — never via hub]
    └─ Powered USB hub
            ├─ Arturia MiniLab 3
            ├─ Elektron Digitakt MK1  (USB MIDI mode for Elektron Transfer; no Overbridge)
            ├─ Roland TR-8S           (no Ableton MIDI/clock role)
            └─ [Octatrack MKII — CF transfer only, not for MIDI or audio]

Soundcraft Signature 12 MTK — USB cable physically disconnected
Pioneer DJM-850             — USB soundcard NEVER connected to the Mac
```

---

## 8. Monitoring modes

Three modes are established. The Hybrid-mode rule is non-negotiable.

### Mode 1 — Direct
- **Path:** UC Surface (PreSonus hardware monitoring), sub-millisecond.
- **Use for:** Hardware jamming with no DAW plugins in the path. **Also the default for DJM-850 practice/capture (§3.6).**
- **Setup:** Enable input monitoring in UC Surface; Monitor in Ableton OFF for those tracks.

### Mode 2 — Ableton (tracking default)
- **Path:** Monitor: IN via Ableton DAW plugins → ~6–8 ms round-trip.
- **Use for:** The default tracking mode. Hearing the full in-the-box picture (rumble, sidechain, glue) while performing. One signal path = no comb-filter footgun.

### Mode 3 — Hybrid
- **Path:** Both UC Surface and Ableton monitoring active simultaneously.
- **Use for:** Complex live performance — some channels direct, others through DAW FX.
- **⚠ CRITICAL RULE:** The same input must **never** be active in both paths at once. Mute it in whichever path is not in use, or you get comb-filter doubling. (E.g. a live soft synth off the MiniLab can go Direct on *that one track* only.)

---

## 9. Cable specifications

| Connection | Cable type | Notes |
|---|---|---|
| Soundcraft Main Mix → **PreSonus In 7–8** | 2× XLR(F) → TRS ¼″ | Soundcraft main outs are XLR; landing revised from In 1–2 (which are front preamp combos, not line ins — §0.4) |
| **DJM-850 REC OUT → PreSonus front In 1–2** | 2× RCA → XLR(M) | Guest connection; leave attached to the DJM end (§3.6) |
| PreSonus Main Out → BM9S SAT/SUB IN | 2× TRS ¼″ → XLR(M) | PreSonus main outs are balanced TRS; BM9S all-XLR I/O |
| BM9S SAT OUT → Yamaha HS8s | 2× XLR(F) → XLR(M) | Standard mic cables; high-passed feed to satellites |
| Reference source → Soundcraft 11/12 | 3.5 mm → RCA | Phone/Mac line out for INTERVAL MUTE A/B |
| TB-03 → Patchbay | 3.5 mm mini → dual ¼″ TRS breakout | Roland Boutique uses 3.5 mm stereo mini output |
| Capture taps (rows 1/2 front → In 5/6) | Short ¼″ TRS patch cables (Hosa CSS-800) | Permanent; passive bridge to rear line inputs |
| All other front patches | Short ¼″ TRS patch cables (~30 total) | |
| Session 4 rear-bottom runs | Hosa CSS-800 3 ft ¼″ TRS — **14 runs** from the three 8-packs (24 total) | Compatible with Samson S-Patch Plus (standard TRS, not Bantam). Rows 7–8 and 17–18 deliberately unwired (§5.1) — 16 cables committed incl. taps, 8 spares |
| TR-8S Assign 1 (Kick) → Patchbay | ¼″ TS | |
| All rear patchbay hookups | ¼″ TRS | |
| DIN MIDI connections | 5-pin DIN | Standard MIDI cables |

---

## 10. Critical warnings & gotchas

1. **Octatrack USB ≠ audio or MIDI.** No Overbridge. USB is CompactFlash sample transfer only. Any plan implying OT USB audio/MIDI is wrong — including any automation that assumes the Mac can reach the OT.

2. **Feedback risk on Octatrack's own channels.** Soundcraft 9/10 carry the OT Main L/R. Aux 1/2 are hard-wired back into OT Inputs A/B. If Aux sends are up on 9/10 you create a loop. **Zero all Aux and Group sends on 9/10 before raising faders.**

3. **Soundcraft USB must stay disconnected.** Plugging it in turns the Soundcraft into a macOS audio device and breaks Option A (may force an Aggregate Device). Leave the USB cable out.

4. **PreSonus must be direct to Mac — never via hub.** Don't share USB bandwidth with other devices.

4a. **DJM-850 USB soundcard must never be connected to the Mac.** Same failure mode as §10.3 — a second audio device invites an Aggregate Device. The DJM's audio enters the studio through the analogue REC OUT → front In 1–2 path only.

5. **TR-8S Soft Thru must be enabled.** The TR-8S has no hardware MIDI Thru port. The chain Digitakt → TR-8S → TB-03 depends on Soft Thru being active in TR-8S system settings. Verify on power-up.

6. **Hybrid monitoring comb-filter rule.** See §8 — never the same input in both UC Surface and Ableton paths at once. Applies to DJ capture too: Mode 1 monitoring means Ableton monitoring OFF on tracks 1–2 while recording a set.

7. **Soundcraft 11/12 = RCA only.** Unbalanced RCA "Playback Channel" — cannot accept TRS/XLR. Reserved for reference A/B via INTERVAL MUTE.

8. **Octatrack needs 44.1 kHz.** OT plays 48 kHz files at the wrong pitch — see §11. DAW sessions run at 48 kHz, so any OT-bound sample prep must resample to 44.1 kHz first.

9. **Soundcraft macOS Tahoe compatibility unverified.** Class-compliant but not Harman-certified for Tahoe. USB is disconnected here, so practical risk is low — but note it.

10. **Soundcraft mains must feed the PreSonus (In 7–8), never the monitors directly.** The mains previously ran straight into the BM9S; under Option A that silently breaks sum recording *and* Mode 2 monitoring. The speaker path is exclusively **PreSonus Main Out → BM9S → HS8s** (§3.5). If the desk ever seems "louder than Ableton" or the rumble is inaudible while tracking, check this first.

11. **Front In 1–2 gain is shared between the DJM and any vocal mic.** The Studio 192 preamps are digitally recallable — save a "DJM" scene and a "Vocal" scene in UC Surface and recall rather than re-trimming by ear each time. Never plug the DJM's XLR **Master** out into the front XLRs (too hot for the preamp's +12 dBu ceiling at min gain); REC OUT only.

12. **PreSonus In 1–2 are not line inputs.** They always pass through the XMAX preamps (§11). Nothing that expects a clean line path (console sums, sub feeds) belongs there — rear In 3–8 carry the true line inputs.

---

## 11. Compatibility status & sourced hardware facts

| Component | Status | Notes |
|---|---|---|
| PreSonus Universal Control 4.7.1 | ✅ Supports macOS Tahoe 26 | Per PreSonus release notes |
| Soundcraft Signature 12 MTK (USB) | ⚠ Class-compliant, not Harman-certified for Tahoe | USB disconnected — low practical risk |
| Elektron Octatrack MKII (USB) | ℹ️ CF transfer only | No Overbridge, no USB audio/MIDI by design |
| Ableton Live 12 Suite | ✅ Current (12.4) | Keep on latest 12.x |
| Elektron Overbridge | ❌ Not used in this rig | Digitakt MK1 supports it, but is set to **USB MIDI** for Elektron Transfer; Octatrack MKII does not support it |
| Pioneer DJM-850 (USB) | ❌ Not used with the Mac | Analogue REC OUT path only (§3.6, §10.4a) |

**Sourced facts (from primary manuals/spec sheets — do not re-litigate from forums):**
- dbx limiters exist on **Soundcraft channels 1 and 2 only** → correct home for kick and TB-03.
- Soundcraft **main outputs are XLR**; channels **11/12 are RCA-only**.
- **TR-8S has no hardware MIDI Thru** → Soft Thru required.
- **Octatrack MKII USB is CompactFlash-only** — no Overbridge, no USB audio/MIDI.
- **Octatrack sample format:** 16- or 24-bit, **44.1 kHz** WAV/AIFF, mono or stereo. 48 kHz files play at the wrong pitch. Realtime timestretch stays clean within roughly ±10 % of native tempo.
- **Digitakt MK1 sample format:** treat as 16-bit / mono but **verify sample rate before any batch conversion** — not yet confirmed; likely differs from the OT, so a single "sampler profile" is wrong. The Digitakt **cannot timestretch** (pitch and speed linked).
- **PreSonus Studio 192 input architecture (verified 2026-07-09):** 2 front-panel mic/instrument combos (**channels 1–2, always via XMAX preamps**; XLR max input +12 dBu at min gain; ¼″ leg = unbalanced instrument) + 6 rear combos (**channels 3–8**) whose ¼″ TRS **line inputs bypass the preamps entirely** (direct-to-ADC). Preamp gains are digitally controlled and recallable via UC Surface.
- **Pioneer DJM-850 outputs (verified 2026-07-09):** Master 1 = XLR (hot, master-knob controlled) · Master 2 = RCA · Booth = TRS (booth-knob controlled) · **REC OUT = RCA, post-fader/FX but independent of the master level knob** — the designed recording feed · S/PDIF digital out · DIN MIDI out. Onboard USB soundcard 24-bit/96 kHz (unused here).

---

## 12. Workflow recipes

### Rumble-kick
1. Soundcraft Ch 1 Aux 1 send up (kick → OT In A).
2. OT Thru machine on Track A: delay/reverb/pitch.
3. OT Main L/R returns to Soundcraft 9/10 → final mix.
4. Sample the result into a Digitakt pad via Group 1/2 bus.
5. Layer the sampled kick under the dry kick at different transient offsets.

### Acid morph
1. Soundcraft Ch 2 Aux 1 send up (TB-03 → OT In A or B).
2. OT Thru machine: crossfader / scenes to morph filter or effect.
3. TB-03 dry stays on Ch 2; processed version returns on OT 9/10.
4. Automate Aux send level live for in/out of effect.

### Console resampling
1. Route channels into Group 1/2 (press 1-2 routing buttons on Soundcraft).
2. Pan to set stereo balance in the Group bus.
3. Rows 11–12 deliver Group 1/2 into Digitakt In L/R.
4. Arm a Digitakt sample-record track and hit sample.
5. Zero Group routing when done.

### Reference A/B
1. Feed reference into Soundcraft 11/12 via RCA.
2. Bring the reference fader up to match perceived loudness.
3. Hit INTERVAL MUTE to flip between your mix and the reference.

### DJ set capture (NEW in v2.3)
1. Click the DJM's two RCA→XLR leads into PreSonus front In 1–2.
2. Recall the "DJM" preamp scene in UC Surface (gains restore automatically).
3. Mode 1 monitoring on In 1–2; Ableton monitoring OFF on those tracks.
4. Arm tracks 1–2 in Ableton, record the set (24-bit/48 kHz).
5. Warp/edit afterwards; unplug the two front leads when done — the studio is untouched.

---

## 13. Sample audition & timestretch workflow — confirmation (v2.3)

Robin's core session activity — auditioning loops, toms, percussion and rap-vocal samples and timestretching them to fit 138–142 BPM tracks — is fully served by the committed setup. Nothing new is required; this section exists so the answer is on record.

- **In Ableton (primary audition environment):** the "Eidetic Techno 140" template runs at the set tempo; browser preview with Warp enabled auditions any sample at session tempo before it's even dropped in. For placed clips: **Complex Pro** warp for rap vocals and melodic loops (formant-safe), **Beats** for toms/percussion hits and drum loops. Groove pool MPC swing (~90 %) applies after placement.
- **On the Octatrack (performance sample layer — Workflow v1.3 §5G):** realtime timestretch is clean within ~±10 % of a sample's native tempo, lo-fi/grainy beyond — which suits the raw aesthetic when wanted. For clean big stretches, samples are **pre-conformed in Ableton (Complex Pro → 44.1 kHz export)** via the Claude Code A2 prep pipeline (bar-trimmed, BPM+key named, ~−6 dBFS, `SetName/AUDIO/` layout). The prepped pool *is* the performance palette — no mid-set CF loading.
- **On the Digitakt:** no timestretch at all (pitch/speed linked) — logged as a September-review datapoint (§14).
- **Sample-rate rule:** DAW bounces are 48 kHz; **anything OT-bound resamples to 44.1 kHz first** (§10.8).

---

## 14. Digitakt MK1 — probationary status

Retained for now; long-term role under review. The Octatrack covers the same ground (stereo sampling, p-locks, sequencing depth). **The Octatrack is integrated (June 2026), so the reassessment window opens ~September 2026.**

**Datapoint logged 2026-07-02:** the committed performance sample layer (workflow v1.3 §5G — hot-switched loops/vocals with realtime timestretch) is a capability the **Digitakt MK1 cannot provide at all** (pitch and speed are linked; no timestretch). The one requirement added since probation began is OT-only — the Digitakt's overlap case has weakened, not strengthened.

Assess against:
- Is it serving a unique role the Octatrack cannot fill?
- Is the added routing/MIDI complexity worth the benefit?
- Would resale value (~£250–£350 used) be better invested elsewhere?

If the answer to all three is no, sell.

---

## 15. Revision history

| Version | Date | Summary of changes |
|---|---|---|
| Diagrams v1–v4 | ~Apr 2026 | Initial architecture; Option A validated; three monitoring modes established |
| Diagrams v5 | Apr–May 2026 | Baseline diagram set; Soundcraft channel labelling errors present; TR-8S MIDI Thru corrected |
| Diagrams v6 | 2026-06-13 | Soundcraft manual audit: 11/12 RCA-only; Kick→Ch 1 & TB-03→Ch 2 for dbx; Aux 1/2→OT In A/B; Group 1/2→Digitakt In L/R; XLR→TRS main-out spec; TB-03 3.5 mm; feedback warning; TR-8S Soft Thru confirmed |
| KB v1.0 | 2026-06-13 | First consolidated knowledge base, compiled from prior sessions |
| KB v2.0 | 2026-06-16 | Octatrack MKII reclassified to owned & patched in; MIDI chain promoted to live OT-as-master; Dynaudio sub added; §0 quick-reference maps + "this file wins" anti-drift rule; §11 sourced facts |
| KB v2.1 | 2026-06-29 | Reconciled with workflow v1.2 + Claude Code brief v0.1. In 5/In 6 hybrid-capture stem taps folded into §3.4/§0.4/§5.2; 44.1 kHz OT format fact added; document-suite header added |
| KB v2.2 | 2026-07-02 | Both open items closed: sub confirmed **Dynaudio BM9S** with crossover starting points; monitor/record split committed (§3.5); monitor-chain cables specced; warning §10.10 added; Digitakt no-timestretch datapoint |
| KB v2.3 | 2026-07-09 | **PreSonus input architecture verified against the Studio 192 spec:** In 1–2 are front mic/inst preamp combos; true line inputs are rear 3–8 only (bypass preamps). **Soundcraft Main Mix landing revised In 1–2 → In 7–8** (§0.4, §3.5, §9) — resolves the deferred XLR leg with the correct physical target; trade-off (no reserved future-synth stem inputs) recorded. **DJM-850 integrated as guest gear** (§3.6): REC OUT → 2× RCA→XLR(M) → front In 1–2, UC Surface recallable gain scenes, Mode 1 monitoring, new "DJ set capture" recipe (§12) and warnings §10.4a/§10.11/§10.12. **Full diagram set bumped to v7:** sheet 1 regenerated (BM9S monitor chain, capture taps, DJM path, revised input map); sheets 2 & 4 corrected (In 7–8 landing, BM9S chain, TR-8S/Digitakt row order aligned to §5.1, front-panel guest slot, permanent taps noted); sheet 3 gains USB rule 6 (DJM USB prohibition). New §13 confirms the sample audition/timestretch workflow (Ableton Complex Pro + OT ±10 % + A2 prep pipeline) is fully covered. Sub model naming flag opened (Robin said "BM92"; confirmed model is BM9S — verify badge, §0.1). |
| **KB v2.4** | **2026-07-09** | **No-speculative-runs rule adopted (mid-Session 4):** patchbay rows **7–8** (dest → SC ST 7/8, "synth-ready") and **17–18** (dest → OT In C/D, "flex") **cut from the wiring plan — leave unwired** (§5.1). These were the only two "might be used" runs in the plan; all remaining runs are load-bearing. Session 4 budget restated: 14 runs + 2 taps = 16 cables, 8 spares (§5, §9). OT thru-FX-on-any-source recipe marked deferred (§5.2). **Diagram set bumped to v8** (sheets 1/2/4 amended; sheet 3 footer only). Rows 11–12 (DT resample bus) retained as active workflow — noted as freeing 2 cables if the September review retires the Digitakt. |
| **KB v2.5** | **2026-07-19** | **Digitakt Overbridge explicitly retired from this configuration:** Digitakt USB CONFIG set/documented as **USB MIDI**, for Elektron Transfer only; no USB audio, Overbridge, or Ableton MIDI/clock workflow. Corrected the stale "MIDI + Overbridge" claims in §§2, 6, 7 and 11 and the v8 MIDI/USB-routing diagram. |
