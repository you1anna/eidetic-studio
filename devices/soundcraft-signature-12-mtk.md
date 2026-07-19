# Soundcraft Signature 12 MTK — quick reference

**Role in the rig:** analogue summing console. Aux 1 and Aux 2 are the Octatrack's independent A/B send paths; Aux 3 is unused as an external send and shares each channel's `AUX3/FX` control with the internal Lexicon FX send.
**Menu access:** physical controls only. `AUX n PRE/POST` is set in the Aux Masters section.

> Cross-refs: wiring → [`../knowledge-base.md`](../knowledge-base.md) §4/§5.1; OT effect return → [`octatrack.md`](octatrack.md) "Set up the send-FX (thru) path".

## How do I… (task → exact steps)

| Task | Steps | Source |
|---|---|---|
| **Set the safe baseline for the OT Aux send/return** | Set **AUX 1 PRE/POST** and **AUX 2 PRE/POST** to **POST**; set **AUX 1 MST** and **AUX 2 MST** at their `0`/unity marks, then use individual channel **AUX 1** / **AUX 2** knobs as the effect amount. Start all channel sends at zero. Keep **AUX 3 MST** down (no external Aux 3 destination). Keep FX Return **AUX 1** and **AUX 2** down, so desk FX are not automatically sent into the OT. | Soundcraft *Signature 10/12/12MTK User Guide*, §§4.3–4.4, 5.1.1, 5.2; studio baseline 2026-07-19 |
| **Send a stereo source through OT Track 7** | Raise **AUX 1** on the source's left channel and **AUX 2** on its right channel by matching amounts; these feed OT A and B respectively. Use post-fade so a source's wet level follows its channel fader. | Soundcraft User Guide §§4.4, 5.2; KB §5.1 |
| **Prevent an OT feedback loop** | Keep **AUX 1**, **AUX 2**, and all Group sends at zero on Soundcraft channel **9/10** (OT Main L/R return). | KB §10.2; on-rig configuration |

## Known gotchas

- Aux sends are independent buses: the main mix does not automatically reach OT A/B.
- `AUX3/FX` is a shared per-channel send to both the Aux 3 bus and the internal FX processor; the buses themselves remain independent.
- The FX Return can feed Aux 1/2, but must not feed Aux 3/FX; the console prevents that positive feedback route by design.

## Sources

- Soundcraft, [*Signature 10/12/12MTK User Guide*](https://www.soundcraft.com/en/product_documents/soundcraft_signature_10-12_user_guide-pdf-10d8ee3f-0af6-42e4-8828-fb14879d879f), §§4.3–4.4, 5.1.1–5.2 (accessed 2026-07-19).
- [`../knowledge-base.md`](../knowledge-base.md) §4/§5.1.
