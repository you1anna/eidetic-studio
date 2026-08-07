# 2026-08-07 — Octatrack Project-menu shortcut was wrong

## Symptom

The clean-card checklist said `[FUNC]` + `[MIDI]` would open the Octatrack PROJECT menu. On the
physical Octatrack MKII running OS 1.40C, that combination opened **MIDI SYNC** directly.

The same checklist also said the CF card should be “inserted and not mounted on the Mac”, which did
not clearly distinguish the card remaining physically inside the OT from USB DISK MODE exposing its
volume to Finder.

## Cause

An old in-repo shortcut assertion had been copied into several guides despite the retained official
manual consistently saying to press `[PROJ]`. The ambiguous USB wording then combined two distinct
states: physical card insertion and Mac volume mounting.

## Fix

- Use the dedicated `[PROJ]` button for the PROJECT menu.
- Record `[FUNC]` + `[MIDI]` only as the on-rig direct shortcut to MIDI SYNC.
- Keep the CF card physically inserted in the OT while formatting.
- A connected USB cable is harmless. Before formatting, USB DISK MODE must be off; if the CF volume
  is visible in Finder, eject it on the Mac and then leave USB DISK MODE on the OT.

## Prevention

Button paths observed on the physical rig override inherited shorthand. Future OT instructions must
name the button actually pressed and distinguish “card inserted” from “volume mounted on the Mac”.

**Source:** on-rig observation, Octatrack MKII OS 1.40C, 2026-08-07; confirmed against Octatrack MKII
User Manual OS 1.40A §§7.1, 8.4 and 8.5.1.
