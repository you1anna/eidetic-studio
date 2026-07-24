# Dynaudio BM9S — quick reference

**Role in the rig:** Mono low-frequency monitor; receives the PreSonus Studio 192 Main Out stereo feed and high-passes the Yamaha HS8 pair from its SAT/SUB outputs.
**Menu access:** Rear-panel rotary controls and switches only; no stored preset.

> Cross-refs: [`../knowledge-base.md`](../knowledge-base.md) §3.5 monitor chain and §8 monitoring modes.

## How do I… (task → exact steps)

| Task | Steps | Source |
|---|---|---|
| **Set the BM9S correctly for the single-sub PreSonus → BM9S → HS8 monitor chain** | **Starting state:** one BM9S only; PreSonus **Main Out L/R** connected to BM9S **SAT/SUB IN L/R**; BM9S **SAT/SUB OUT L/R** connected to HS8 L/R; no external bass-management crossover. 1. Turn the PreSonus Main level fully down (or mute Main Out). 2. On the BM9S rear panel, set **Mode = LFE**. Do **not** use **Slave**: that position is for a second sub or an external bass-management system. 3. Set **SAT Highpass = 80 Hz**; the SAT/SUB OUT feed is now high-passed below 80 Hz. 4. Set **SUB Lowpass = 80 Hz**; the sub’s upper range is now limited at the same handoff. 5. Set **Phase = 0°** as the initial state; set **Gain** to a conservative position below halfway. 6. Restore the Main level gradually. Play a bass-rich mono reference that includes 60–100 Hz, then compare **0°** and **180°** phase from the normal listening position. Retain the setting with the most even bass through the crossover, not simply the greatest apparent bass. 7. Leave the crossover and phase fixed while adjusting only Gain; stop when the sub does not call attention to itself as a separate sound source. **Success check:** the sub responds to its Gain and Phase controls, the HS8s receive signal from SAT/SUB OUT, and kick/bass moves evenly through roughly 60–100 Hz. **Persistence:** controls are physical; photograph or record the final positions. | Dynaudio BM9S Owner’s Manual pp. 5–7 (manufacturer manual, archived); cross-checked against Dynaudio Professional Audio Subwoofers User Manual pp. 8–18 (2026), https://dynaudio.com/hubfs/Manuals/dynaudio_manuals_pro_audio_pro-subs_9s_en.pdf?hsLang=en |

## Known gotchas

- **Slave is not the normal single-sub setting.** In Slave mode, the sub’s local Gain and Phase controls are controlled by the master and cannot be calibrated at the BM9S.
- **Avoid two crossover systems.** The PreSonus Main Out is a full-range monitor feed in this rig; use the BM9S filters. Do not introduce a second bass-management filter in UC Surface or software.
- A 60 Hz handoff is a valid later comparison, but change both the satellite high-pass and sub low-pass together, then repeat the phase check.

## Sources

- Dynaudio Professional Audio Subwoofers User Manual (official, 2026): controls, single-sub LFE mode, phase and crossover procedure.
- [`../knowledge-base.md`](../knowledge-base.md) §3.5 — committed monitor topology and 80 Hz starting point.
