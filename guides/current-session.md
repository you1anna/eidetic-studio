# Current studio session

**Status:** `READY — clean baseline passed; copy the prepared loop`

**Current device:** Octatrack MKII, OS 1.40C

**Keep this page open and refresh it after each completed chunk.**

## Now — Copy the prepared loop to the Octatrack

**Goal:** put the already converted 140 BPM percussion loop into Set `EIDETIC-01` without changing
any other device.

**Start:** Octatrack powered on with Set/project `EIDETIC-01` loaded. Keep the CF card physically
inside the OT. Connect the OT to the Mac by USB.

1. Press `[PROJ]`.
2. Select **SYSTEM** and press `[YES]` or `[RIGHT]`.
3. Select **USB DISK MODE** and press `[YES]`.
4. **Expected:** the Octatrack CF card appears in Finder as a removable volume.
5. In Finder, open the Set folder **`EIDETIC-01`**, then its **`AUDIO`** folder.
6. Copy this prepared file into that `AUDIO` folder:

   [DL01_tribal-t_000a.wav](</Volumes/Extreme SSD/Production/SAMPLES/_EXPORT/OCTATRACK/EIDETIC-CURATED/AUDIO/octatrack-smoke/DRUM-LOOP/DL01_tribal-t_000a.wav>)

7. Wait for the copy to finish. Confirm `DL01_tribal-t_000a.wav` appears inside the Set's `AUDIO`
   folder.
8. Eject the Octatrack CF volume in Finder. **Do this before leaving USB DISK MODE.**
9. Look at the OT screen. If it still shows USB DISK MODE and the exit action is not explicit, stop
   and report the exact screen rather than guessing a button.

## What should happen

- Finder shows the OT CF volume only while USB DISK MODE is active.
- The file exists at `EIDETIC-01/AUDIO/DL01_tribal-t_000a.wav` on the CF card.
- The source file remains on the Extreme SSD.
- No TR-8S, Digitakt or TB-03 setting changes.

## Stop and report if

- The CF volume does not appear in Finder.
- Set folder `EIDETIC-01` or its `AUDIO` folder is missing.
- Finder reports a copy error.
- The OT screen differs from the documented USB DISK MODE state.

## When complete, send this

```text
loop copied
USB DISK MODE screen after Finder eject: <what it shows>
```

## Next, not yet

Load `DL01_tribal-t_000a.wav` into a Flex slot, assign it to Octatrack Track 4 and configure its
140 BPM timestretch behaviour.

## Completed

- ✅ CF card formatted on-rig through `[PROJ]` → SYSTEM → CARD TOOLS → FORMAT CARD.
- ✅ New Set and project `EIDETIC-01` created and loaded.
- ✅ OT clock-master settings restored and saved.
- ✅ Digitakt, TR-8S and TB-03 transport followed the OT before and after an OT power-cycle.
- ✅ Audio-classified 63-sample packet passed the accepted review gate.
- ✅ Selected percussion loop 12 was promoted and exported as a 16-bit, 44.1 kHz stereo WAV.

## References

- [Full Octatrack reference](../devices/octatrack.md)
- [Sample-to-device masterplan](sample-device-masterplan.md)
- [Clean-card decision](../decisions/2026-08-07-clean-octatrack-card-baseline.md)
