# Eidetic Studio — MIDI Clock & Transport Configuration Guide

**Document version:** v1.2
**Date:** 2026-07-19
**Companion to:** Knowledge Base (canonical, `../knowledge-base.md`) · diagram sheet 3/4 "MIDI & USB Routing" v8 (`../diagrams/midi-usb-routing-v8.png`)
**Scope:** Complete, verified per-device configuration for the DIN clock chain (Octatrack MKII → Digitakt MK1 → TR-8S → TB-03) and Ableton's relationship to it. All menu paths and parameter names sourced from the primary manuals (OT MKII manual, Digitakt manual, TR-8S Reference Manual, TB-03 Owner's Manual).

> **Context for this document:** written to resolve a chain failure after the TR-8S was factory reset and the Digitakt reconfigured. Follow §2–§6 top-to-bottom once; thereafter §7 is the fault-finding reference. v1.1 rewrote §6 against the actual Live 12.4 settings state (screenshots, 2026-07-16) and committed the manual-tempo decision. v1.2 folded in the new-project clock gotcha (§1 Fault 3) root-caused from a real 2026-07-19 incident.

---

## 1. The chain, and the three most likely faults

```
OCTATRACK MKII  ──MIDI OUT──▶  DIGITAKT MK1  ──MIDI THRU (hardware)──▶  TR-8S  ──MIDI OUT (Soft Thru)──▶  TB-03
(clock master)                 (receives + passes)                      (receives + echoes)              (end of chain)
```

**Fault 1 — TR-8S factory reset disabled Soft Thru.** Soft Thru defaults to **OFF**. With it off, nothing the TR-8S receives is re-sent from its MIDI OUT, so the TB-03 goes dead even though the TR-8S itself syncs fine.

**Fault 2 — TR-8S Tempo Sync reset to AUTO, and AUTO prioritises USB.** Per the Roland manual: if clock arrives at both the MIDI IN connector and the USB port simultaneously, **the USB port takes priority**. This guide sets Tempo Sync to **MIDI** (DIN only) so USB clock can never interfere. (As of 2026-07-16 Live exposes no Roland/Elektron MIDI ports at all — §6 — so the risk is currently theoretical, but the setting is the permanent architectural defence.)

**Fault 3 — a freshly created Octatrack project has no clock to give anyone.** Committing Tempo Sync to MIDI (Fault 2's fix) removes the TR-8S's USB fallback entirely — it now depends completely on receiving DIN clock. A brand-new OT project comes up on Elektron factory defaults (CLOCK SEND / TRANSPORT SEND both OFF), not on the template's settings. Nothing downstream ever gets a clock, so the TR-8S just sits there on PLAY — no error, no flicker, indistinguishable at a glance from a volume or routing fault. See §2, §7, §8. (Root-caused from a real "TR-8S no sound on PLAY" incident, 2026-07-19.)

Cabling sanity check before touching any menu:

| Leg | From port | To port | Common mistake |
|---|---|---|---|
| 1 | Octatrack **MIDI OUT** | Digitakt **MIDI IN** | Using OT MIDI THRU (echoes OT's *input*, which is empty — sends nothing) |
| 2 | Digitakt **MIDI THRU** | TR-8S **MIDI IN** | Using DT MIDI OUT (only carries DT's own sequencer data, not the OT clock — THRU is the correct port) |
| 3 | TR-8S **MIDI OUT** | TB-03 **MIDI IN** | None — TR-8S has no THRU jack; OUT-with-Soft-Thru is the only option |

---

## 2. Octatrack MKII — clock master

All sync settings live in the **PROJECT menu → MIDI → SYNC**. Open the PROJECT menu with **[FUNC] + [MIDI]**. Navigate with the [ARROW] keys; toggle checkboxes with [YES].

⚠ **These settings are stored per project.** A new or different project can arrive with different sync settings — if the chain dies after switching projects, check here first. Save the project (PROJECT menu → PROJECT → SAVE) after configuring.

⚠ **A brand-new project is not a blank version of the template — it's Elektron factory defaults.** CLOCK SEND and TRANSPORT SEND both come up OFF. With TR-8S Tempo Sync committed to MIDI (§4) instead of AUTO, there is no fallback clock source left: if CLOCK SEND is off, the TR-8S (and everything past it) receives nothing and sits silently on PLAY. This is not a rare edge case — it happened on 2026-07-19 from creating a new OT project mid-session. **Don't build sessions from a blank project.** Always load or duplicate the saved template project, which already carries the correct SYNC block below. If a new project genuinely is needed, set §2's table before doing anything else.

### PROJECT → MIDI → SYNC

| Parameter | Set to | Why |
|---|---|---|
| TRANSPORT SEND | **✓ ON** | Sends play/stop/continue + song position pointer downstream. Without this, slaves receive tempo but never start. |
| CLOCK SEND | **✓ ON** | Sends MIDI clock (the tempo itself). **Missing this is the single most common reason nothing downstream makes a sound** — see Fault 3 above and §7. |
| TRANSPORT RECEIVE | **✗ OFF** | Nothing is upstream of the OT. Off prevents any accidental external control. |
| CLOCK RECEIVE | **✗ OFF** | Same — the OT is master, full stop. |
| PROG CH SEND | Optional | Only if you want OT pattern changes to switch patterns on downstream boxes. Leave OFF until deliberately designed. |

### PROJECT → MIDI → CHANNELS (for sequencing the TB-03)

Clock and transport are channel-less — they reach every box regardless. But the OT's **MIDI-mode track that sequences the TB-03** must transmit on the TB-03's channel:

1. Press [MIDI] to enter MIDI mode, select the track used for the TB-03.
2. On that track's SRC/NOTE setup page, set **CHAN** to the TB-03's MIDI channel (see §5 — this guide commits **channel 2**).
3. The Digitakt and TR-8S must NOT be listening on that same channel for notes (see §3/§4), or they'll play the TB-03's bassline too.

---

## 3. Digitakt MK1 — link 2 (receive + hardware pass-through)

All settings under the **[SETTINGS] key (cogwheel) → MIDI CONFIG**. Two sub-menus matter: **SYNC** and **PORT CONFIG**.

### SETTINGS → MIDI CONFIG → SYNC

| Parameter | Set to | Why |
|---|---|---|
| CLOCK RECEIVE | **ON** | Follows the OT's tempo. |
| TRANSPORT RECEIVE | **ON** | Starts/stops with the OT. |
| CLOCK SEND | **OFF** | Nothing consumes it. Ableton free-runs on a manually typed tempo (§6) and no USB MIDI ports are in use. Downstream clock travels via the hardware THRU port, which is unaffected by this setting. |
| TRANSPORT SEND | **OFF** | Downstream transport is carried by the hardware THRU port, which echoes the OT's messages verbatim. |
| PRG CH RECEIVE / SEND | **OFF** | Until pattern-change choreography is deliberately designed. |

### SETTINGS → MIDI CONFIG → PORT CONFIG

| Parameter | Set to | Why |
|---|---|---|
| THRU PORT FUNCTIONALITY | **MIDI** | ⚠ The critical one. If this is set to DIN24/DIN48 (Roland DIN-sync pulses), the THRU port stops carrying MIDI and the TR-8S + TB-03 go dead with no error anywhere. |
| OUT PORT FUNCTIONALITY | **MIDI** | Keeps the OUT port standard (unused in this chain, but correct). |
| INPUT FROM | **MIDI+USB** | MIDI is required so the DT hears the OT on its DIN IN. USB is kept so Elektron Transfer can still reach the box for sample loading. |
| OUTPUT TO | **MIDI+USB** | Harmless with CLOCK/TRANSPORT SEND off, and Transfer needs the USB return path. |
| TURBO SPEED | **Do not engage** | Turbo negotiation requires a bidirectional OT↔DT connection; the chain is one-way. Leave at 1×. |

**Note channels:** the DT's audio tracks default to receiving on channels 1–8. If the OT's TB-03 MIDI track transmits on channel 2, the DT's track 2 will trigger from those notes as it passes them through. Either set the DT's track channels away from the TB-03 channel (SETTINGS → MIDI CONFIG → CHANNELS — set TRACK 2's channel to OFF or reassign), or accept it and keep track 2 empty. This guide's committed layout: **DT track channels moved off channel 2**.

---

## 4. TR-8S — link 3 (receive + Soft Thru echo)

Factory reset returned every setting below to default. All live in the **[UTILITY]** menu: press [UTILITY], hold [SHIFT] and turn the [VALUE] knob to jump between sections, release [SHIFT] and turn/press to select and edit.

⚠ **System settings must be saved with the [WRITE] operation** or they are lost at power-off — the single most common "it worked yesterday" failure on this box.

### UTILITY → SYNC/TEMPO

| Parameter | Factory default | Set to | Why |
|---|---|---|---|
| Tempo Sync | AUTO | **MIDI** | AUTO gives USB clock priority over DIN. MIDI locks the TR-8S to the DIN IN (the OT via DT Thru) and makes USB clock incapable of ever interfering. **Trade-off: this also removes any fallback if the OT sends no clock at all — see §1 Fault 3 and §2.** |
| Sync Out | (varies) | **OFF** | Sync Out transmits the TR-8S's *own* clock/start/stop from MIDI OUT. With Soft Thru already echoing the OT's clock to the TB-03, Sync Out ON would put **two clock streams on the same cable** — the TB-03 receives doubled F8 messages and runs at double speed or stutters. Off, always. |
| Start/Stop (external start/stop reception) | ON | **ON** | Lets the OT's transport start/stop the TR-8S sequencer. Verify it survived the reset. |

### UTILITY → MIDI

| Parameter | Factory default | Set to | Why |
|---|---|---|---|
| **Soft Thru** | **OFF** | **ON** | The TB-03's lifeline. Echoes everything arriving at MIDI IN out of the DIN MIDI OUT, unchanged. This is KB warning §10.5 — verify on every power-up. |
| USBMidiThru | OFF | **OFF** | If ON, MIDI arriving over USB would also be merged out of the DIN OUT towards the TB-03. Keep off. |
| Pattern Ch | 10 | **10** (or any ≠ 2) | Keep the TR-8S off the TB-03's note channel. |
| Rx Prog Chg | ON | Taste | OFF if you don't want external pattern switching. |

**Save:** press **[WRITE]** and confirm the system-settings save before powering down. Then power-cycle once and re-open UTILITY → MIDI to confirm Soft Thru = ON persisted — this proves the write took.

---

## 5. TB-03 — end of chain

System settings: **hold [FUNCTION] + turn [VALUE]** to select a parameter, release [FUNCTION], set the value with [VALUE], press [FUNCTION] to exit. Settings persist automatically.

| Parameter (display) | Set to | Why |
|---|---|---|
| MIDI Clock Source (`SYnC`) | **`NiDi`** (MIDI) | Default is `AutO`, which — same as the TR-8S — gives **USB priority over DIN**. The TB-03's USB port is unused in this rig, but `NiDi` hard-commits the DIN input and removes the ambiguity permanently. |
| MIDI Channel (`CH`) | **2** | **Committed value for this rig** (TB-03 family default). Must match the OT MIDI track's CHAN (§2) exactly. If a different channel is already in use on the OT side, match that instead and amend this line. |
| Soft Thru (`thrv`) | On (default) | Irrelevant — nothing is cabled to the TB-03's MIDI OUT. Leave at default. |
| Auto Off (`A.OFF`) | **OFF** | The default powers the unit down after 30 minutes — mid-session death that looks exactly like a sync failure. Turn it off for studio use. |

Operationally: the TB-03 has no transport-receive toggle. When externally clocked, put the [MODE] knob in **PATTERN PLAY** (or TRACK PLAY), select the pattern, and it chases the OT's start/stop and tempo automatically. When the OT sequences it note-by-note instead, the TB-03's own pattern should be empty/cleared so the two don't layer.

---

## 6. Ableton Live 12.4 — outside the clock loop, manual tempo (COMMITTED)

**Decision (2026-07-16): Live's session tempo is typed manually to match the OT.** No MIDI clock into Live, no Tempo Follower. Rationale: Live records audio only (Workflow Mode B); its tempo exists solely so the grid, warping, and tempo-synced plugins (FabFilter Timeless etc.) line up. The OT holds a fixed, deliberate BPM — automatic followers are built for sources that drift, and pointing one at a stable clock adds jitter and failure modes for zero benefit. The "Eidetic Techno 140" template already carries the tempo; adjust the number if the OT session runs at 138–142.

### 6.1 What Live's MIDI settings should look like (verified against 12.4)

As of 2026-07-16, **Settings → Tempo & MIDI** shows exactly one port pair — **PreSonus Studio 192 (Studio 192 MIDI)** — which is the DIN MIDI socket on the back of the interface. Nothing is cabled to it. The Digitakt and TR-8S do not appear because their USB MIDI is not in use (audio-only workflow), and the MiniLab 3 appears only when connected.

| Port | Track | Sync | Remote | Notes |
|---|---|---|---|---|
| PreSonus Studio 192 MIDI (In/Out) | Off | **Off** | Off | Physical DIN socket, nothing connected. All boxes stay unticked. |
| MiniLab 3 In (when present) | **On** | Off | **On** | Track for playing soft synths; Remote for mapped controls. |
| MiniLab 3 Out (when present) | Off | Off | Off | Nothing needs to reach the MiniLab. |
| Any Elektron/Roland port that ever appears | — | **Off** | — | Standing rule: Sync stays off on every port, input or output, forever. It is the only way Live can interfere with the hardware clock chain. |

**Settings → Link:** Link off, Start Stop Sync off (current state is correct). Link is phone-app/jam-session territory — irrelevant to the DIN chain.

### 6.2 Transport-bar housekeeping (declutter, remove foot-guns)

Two Live 12 features are currently toggled visible and neither is used:

1. **Settings → Tempo & MIDI → Show Tempo Follower Toggle → Hide.** The Tempo Follower listens to an *audio* input (it was pointing at Ext. In 1/2 — the DJM guest inputs) and moves Live's tempo to chase it. Unused; hiding it removes an accidental-enable risk one click from the tempo display.
2. **Settings → Tempo & MIDI → Show Resync Button → Hide.** Only meaningful when Live sends clock to hardware, which this rig never does.

Both are display toggles — hiding changes nothing functionally, it just keeps the transport bar honest about how this studio works.

### 6.3 The tracking routine (Mode B / Mode 2 monitoring)

1. Open the "Eidetic Techno 140" template; type the session BPM to match the OT exactly.
2. Arm audio tracks on In 7–8 (sum), In 5 (kick), In 6 (TB-03), In 3–4 (OT cue) as needed; Monitor: IN per KB §8 Mode 2.
3. Press record in Live first, then start the OT. Live is not transport-slaved — the take simply begins wherever the OT starts, and the downbeat is nudged to the grid afterwards (one warp marker; the tempo already matches so the whole take lines up).
4. Nothing in Live needs touching when the hardware chain starts/stops mid-take — Live just keeps recording audio.

**If OT-followed tempo is ever genuinely needed** (it is not today): the clean zero-USB route is a single DIN cable from the TB-03's MIDI OUT (its Soft Thru echoes the OT clock, and the port is free at the end of the chain) into the PreSonus Studio 192 MIDI IN, then Sync = On on that one *input* port + EXT in the transport bar. Documented so it never has to be re-derived; do not cable it speculatively (KB no-speculative-runs rule).

---

## 7. Verification sequence & fault matrix

Run in order after any configuration change. Each stage isolates one link.

| # | Action | Expected | If it fails |
|---|---|---|---|
| 1 | Press PLAY on the OT | OT runs at its own BPM | Not a sync issue — OT-local problem |
| 2 | Watch the Digitakt display | DT tempo shows the OT's BPM and its sequencer starts | OT SYNC page (§2); cable in DT **IN**; DT CLOCK/TRANSPORT RECEIVE (§3); DT INPUT FROM includes MIDI |
| 3 | Watch the TR-8S display | Tempo matches, sequencer starts | DT **THRU PORT FUNC = MIDI** (§3); cable from DT **THRU** not OUT; TR-8S Tempo Sync = MIDI (§4); TR-8S Start/Stop reception ON |
| 4 | Watch the TB-03 | Runs in lockstep from PATTERN PLAY | **TR-8S Soft Thru ON** (§4) — check this first, always; TR-8S settings actually saved with [WRITE]; TB-03 `SYnC` = `NiDi` |
| 5 | Stop the OT | Everything stops together | TRANSPORT SEND on OT; Start/Stop reception on TR-8S |
| 6 | Change OT BPM by ±10 while running | All three follow within a beat | A box stuck at old tempo = it's clocking from somewhere else (recheck §6.1 — Sync must be off on every Live port) |
| 7 | TB-03 plays notes from OT MIDI track | Bassline sounds; DT/TR-8S don't trigger from it | Channel mismatch (§2/§5); DT track channels overlapping channel 2 (§3) |
| 8 | Power-cycle the TR-8S, recheck UTILITY → MIDI | Soft Thru still ON | [WRITE] was skipped — save and re-verify |

**Symptom shortcuts:**

- *TB-03 dead, everything else syncs* → TR-8S Soft Thru OFF (or unsaved), 95% of the time.
- *TR-8S at wrong/unstable tempo* → something is feeding it USB clock with Tempo Sync on AUTO. Fix both: Sync off in Live, Tempo Sync = MIDI.
- *Everything dead below the OT* → wrong OT port (THRU instead of OUT), or OT project loaded without CLOCK/TRANSPORT SEND.
- *TR-8S + TB-03 dead, DT fine* → DT THRU PORT FUNC set to DIN24/DIN48.
- *TB-03 double-time/stuttering* → TR-8S Sync Out ON on top of Soft Thru (two clock streams). Sync Out OFF.
- *Chain drops sync after ~16 s of silence then recovers* → normal OT behaviour when both CLOCK and TRANSPORT RECEIVE are enabled on a slave Elektron box; not a fault.
- **TR-8S completely silent on PLAY — no LEDs stepping, powers on fine, all levels up, looks like a volume/routing fault** → the OT isn't sending clock at all. Almost always a **freshly created OT project** sitting on factory defaults (CLOCK SEND / TRANSPORT SEND OFF), not the saved template. Fix: load the template project, or start the OT running first and confirm PROJECT → MIDI → SYNC → CLOCK SEND / TRANSPORT SEND = ON, then save. Confirmed real-world cause, 2026-07-19.

---

## 8. Decisions committed in this document (for KB pick-up)

1. **TB-03 MIDI channel = 2** and the OT's TB-03 MIDI track transmits on channel 2. Digitakt track channels moved off channel 2.
2. **TR-8S Tempo Sync = MIDI** (not AUTO) — architectural defence against USB clock priority.
3. **TR-8S Sync Out = OFF** permanently; Soft Thru is the sole downstream path.
4. **TB-03 `SYnC` = `NiDi`** (not AUTO) and **Auto Off = OFF**.
5. **Ableton tempo is typed manually** to match the OT (template default 140). No MIDI clock into Live, no Tempo Follower, Sync off on all ports permanently. *(Revised from v1.0, which held open an Ableton-follows-OT option via Digitakt USB.)*
6. **Digitakt CLOCK SEND = OFF** — no USB MIDI consumers exist; port config retains MIDI+USB solely for Elektron Transfer. *(Revised from v1.0.)*
7. **Tempo Follower toggle and Resync button hidden** in Live's transport bar.
8. Documented (not cabled) fallback if tempo-follow is ever needed: TB-03 MIDI OUT → PreSonus Studio 192 DIN MIDI IN (§6.3).
9. New power-up ritual extends KB §10.5: verify TR-8S **Soft Thru ON** *and* **Tempo Sync = MIDI** on power-up (one UTILITY screen visit covers both).
10. **Never start a session from a blank/new Octatrack project.** Always load or duplicate the saved template project. A new project defaults to CLOCK SEND / TRANSPORT SEND OFF, which — combined with decision #2 removing the TR-8S's USB fallback — silently starves the entire downstream chain of clock. Confirmed as the root cause of a TR-8S "no sound on PLAY" fault on 2026-07-19.

---

## 9. Revision history

| Version | Date | Summary |
|---|---|---|
| v1.0 | 2026-07-16 | Initial guide, post TR-8S factory reset. All hardware menu paths verified against primary manuals. TB-03 channel committed as 2. |
| v1.1 | 2026-07-16 | §6 fully rewritten against the actual Live 12.4 settings state (screenshots: only the PreSonus Studio 192 DIN MIDI port exists; no Elektron/Roland USB MIDI ports; Link off). **Manual session tempo committed** — automatic tempo-follow rejected (stable master clock; follower adds jitter and failure modes for no benefit). Digitakt CLOCK SEND revised ON→OFF (no consumers); Overbridge references removed (not in use). Tempo Follower + Resync transport toggles set to hidden. Zero-USB tempo-follow fallback (TB-03 OUT → PreSonus DIN IN) documented but deliberately not cabled. |
| **v1.2** | **2026-07-19** | **New-project clock gotcha added** (§1 Fault 3, strengthened §2 warning, §7 symptom-shortcut row, §8 decision #10), root-caused from a real TR-8S "no sound on PLAY" incident: a freshly created OT project defaults to CLOCK SEND/TRANSPORT SEND OFF, and with Tempo Sync committed to MIDI (no AUTO/USB fallback) this leaves the TR-8S with no clock source at all. **Manual-tempo model retained** — the tempo-follow / Digitakt CLOCK SEND=ON variant floated in a parallel 2026-07-19 draft was rejected in favour of the screenshot-verified v1.1 decision. Merged into the studio SOT repo (`eidetic-studio`) as the single canonical MIDI guide. |
