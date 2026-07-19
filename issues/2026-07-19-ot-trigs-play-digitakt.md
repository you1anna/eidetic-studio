# 2026-07-19 — Octatrack trig presses chromatically play Digitakt samples

## Symptom

Pressing OT trig keys while using the OT MIDI sequencer also triggers Digitakt sounds. The samples can sound very low-pitched and slow because MIDI note number changes their playback pitch and therefore speed.

## Cause

The OT MIDI tracks were sending note-ons into the Digitakt. The Digitakt was configured to receive external notes, although this rig uses the OT only as the DIN clock/transport master and the Digitakt as its own sequencer/resample target.

## Fix

On the Digitakt: `[SETTINGS]` → MIDI CONFIG → PORT CONFIG → set **RECEIVE NOTES = OFF**. Save the Digitakt project.

On the OT, leave only the deliberately used MIDI track assigned: MIDI track 1 → channel 2 for the TB-03. Any unused OT MIDI track should have **CHAN = OFF** on its SRC/NOTE setup page.

## Prevention

The Digitakt must not receive external MIDI notes in this setup. It still receives OT clock/transport, and its hardware MIDI THRU still carries the OT stream to the TR-8S, so this setting does not break the clock chain. See `../guides/midi-sync.md` §3.

## Sources

- Digitakt User Manual OS 1.51, MIDI PORT CONFIG / RECEIVE NOTES and CHANNELS, pp.68–70.
- Octatrack MKII User Manual OS 1.40A, MIDI sequencer and NOTE SETUP, pp.90–92.
