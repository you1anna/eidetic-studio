# Current studio session

**Status:** `READY`

**Current device:** Octatrack MKII, OS 1.40C

**Keep this page open and refresh it after each completed chunk.**

## Now — Clean Octatrack baseline

⚠ **This permanently erases the entire CompactFlash card currently inserted in the Octatrack:** all
Sets, projects, samples and partitions. Robin confirmed on 2026-08-07 that none needs preserving.
This is not a factory reset. **Do not change anything on the TR-8S.**

### A. Format the card

**Start:** stop the OT. Leave its CF card inserted. Make sure it is not mounted on the Mac by USB.

1. Open PROJECT with `[FUNC]` + `[MIDI]`.
2. Select **SYSTEM**; press `[YES]` or `[RIGHT]`.
3. Select **CARD TOOLS**; press `[YES]` or `[RIGHT]`.
4. Select **FORMAT CARD**; press `[YES]`.
5. The OT should display a confirmation prompt. Read it, then press `[YES]` to erase the card.
6. Do not switch off the OT or remove the card. Wait until formatting finishes.

### B. Create the clean Set

1. If **NO SET IS MOUNTED! PLEASE MOUNT ONE.** appears, press `[YES]`.
2. If it does not appear, open PROJECT → **PROJECT** and choose **CHANGE** under the **SET** heading;
   press `[YES]`.
3. If **NOT WITHIN A PROJECT. CHANGES MADE WILL BE DISCARDED. CONTINUE?** appears, press `[YES]`.
4. Select **`<CREATE NEW SET>`**; press `[YES]`.
5. Name it **`EIDETIC-01`** using the `[ARROW]` keys; press `[YES]`.
6. If the Set list remains open, select **`EIDETIC-01`**; press `[YES]` to mount it.

### C. Create the clean project

1. The project selection screen should open automatically.
2. Select **`<CREATE EMPTY PROJECT>`**; press `[YES]`.
3. If your screen instead says **`<CREATE NEW PROJECT>`**, select that—it is the same operation.
4. Name the project **`EIDETIC-01`** using the `[ARROW]` keys; press `[YES]`.
5. Reopen PROJECT. Confirm the top of the screen shows Set `EIDETIC-01` and project `EIDETIC-01`.

### D. Restore the OT clock settings

1. Open PROJECT → **MIDI** → **SYNC**.
2. Set **TRANSPORT SEND = ON**.
3. Set **CLOCK SEND = ON**.
4. Set **TRANSPORT RECEIVE = OFF**.
5. Set **CLOCK RECEIVE = OFF**.
6. Leave **PROG CH SEND** and **PROG CH RECEIVE** OFF.
7. Open PROJECT → **PROJECT** → **SAVE**; press `[YES]`.
8. Reopen MIDI → SYNC and confirm the four clock/transport settings still match steps 2–5.

### E. Test and reload

1. Keep the established DIN MIDI chain connected. Power on Digitakt, TR-8S and TB-03.
2. Press OT `[PLAY]`. The transport or step indicators on all three downstream devices should start.
   They do not need to make sound.
3. Press OT `[STOP]`. All three should stop.
4. Power-cycle the OT.
5. Confirm Set and project `EIDETIC-01` load automatically.
6. Recheck PROJECT → MIDI → SYNC; confirm the four settings remain correct.
7. Press `[PLAY]`, then `[STOP]`, again. Confirm all three downstream devices follow.

## What should happen

- The old OT Sets, projects and samples are gone.
- Set `EIDETIC-01` and project `EIDETIC-01` exist with an empty audio pool.
- The OT remains clock master after a power cycle.
- Digitakt, TR-8S and TB-03 start and stop from the OT.
- Nothing on the TR-8S has been reset, deleted or reconfigured.

## Stop and report if

- **CARD TOOLS** or **FORMAT CARD** is not present.
- The format screen names a different operation, displays an error or does not complete.
- Neither **CREATE EMPTY PROJECT** nor **CREATE NEW PROJECT** appears.
- An old OT project or sample appears after creating `EIDETIC-01`.
- A SYNC value changes after saving or power-cycling.
- Any downstream transport does not follow the OT.

Do not improvise around a different screen. Tell me the heading and every visible option.

## When complete, send this

```text
baseline complete
Digitakt transport: pass/fail
TR-8S transport: pass/fail
TB-03 transport: pass/fail
```

## Next, not yet

Load the prepared 140 BPM percussion loop onto Octatrack Track 4.

## Completed

- Audio-classified 63-sample audition packet passed the accepted review gate.
- Selected percussion loop 12 was promoted and exported as a 16-bit, 44.1 kHz stereo WAV.
- Existing Octatrack material was declared disposable; TR-8S configuration remains protected.

## References

- [Prepared Octatrack loop](</Volumes/Extreme SSD/Production/SAMPLES/_EXPORT/OCTATRACK/EIDETIC-CURATED/AUDIO/octatrack-smoke/DRUM-LOOP/DL01_tribal-t_000a.wav>)
- [Full Octatrack reference](../devices/octatrack.md)
- [Sample-to-device masterplan](sample-device-masterplan.md)
- [Clean-card decision](../decisions/2026-08-07-clean-octatrack-card-baseline.md)
