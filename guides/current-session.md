# Current studio session

**Version:** v1.1  
**Status:** `READY — copy the complete SETGPT-01 library to the Octatrack`  
**Current device:** Octatrack MKII, OS 1.40C

Keep this page open. Complete only **Now**. When it passes, refresh this page for the next short
track-building chunk.

## Now — copy the full 24-sample collection

**Goal:** copy the complete prepared library into the existing working Set `SetGPT`. This is only a
file transfer: it does not load samples onto tracks, change the clock, or touch Digitakt, TR-8S or
TB-03.

**Starting state:**

- Octatrack is powered on with the working project in Set `SetGPT` loaded.
- The CF card remains physically inside the Octatrack.
- The USB cable between Mac and Octatrack is connected.
- The Mac source library is ready here: [SETGPT-01](</Volumes/Extreme SSD/Production/SAMPLES/_EXPORT/OCTATRACK/EIDETIC-CURATED/AUDIO/SETGPT-01>).

1. On the Octatrack, press `[PROJ]`.
2. Select **SYSTEM**, then press `[YES]` or `[RIGHT]`.
3. Select **USB DISK MODE**, then press `[YES]`.
4. **Expected:** Finder displays the CF card as a removable volume named **`OCTATRACK-R`**.
5. On the Mac, open **Finder**. Under **Locations**, click **`OCTATRACK-R`**.
6. Open **`SetGPT`**, then open **`AUDIO`**. The destination is:
   `/Volumes/OCTATRACK-R/SetGPT/AUDIO/`.
7. In another Finder window, open [SETGPT-01](</Volumes/Extreme SSD/Production/SAMPLES/_EXPORT/OCTATRACK/EIDETIC-CURATED/AUDIO/SETGPT-01>).
8. Drag the **entire `SETGPT-01` folder** into `OCTATRACK-R/SetGPT/AUDIO/`. Do not drag individual
   WAV files and do not rename the folder.
9. Wait for the copy to finish. Inside `OCTATRACK-R/SetGPT/AUDIO/SETGPT-01/`, confirm these four
   folders exist:

   - `PERCUSSION-LOOPS` — 13 WAV files
   - `FULL-DRUM-LOOPS` — 4 WAV files
   - `VOCAL-PHRASES` — 6 WAV files
   - `LONG-VOCALS` — 1 WAV file

   **Success check:** 24 WAV files in total. `README.md` and `manifest.tsv` should also be present
   at the top of `SETGPT-01`.
10. In Finder, eject **`OCTATRACK-R`** using its eject icon. Wait until it disappears from Finder.
    **Do this before leaving USB DISK MODE.**
11. Look at the Octatrack screen. If it still shows USB DISK MODE and the exit action is not
    explicit, stop and report the exact screen rather than guessing.

## Stop and report if

- `OCTATRACK-R`, `SetGPT`, or `AUDIO` is missing.
- Finder reports any copy error.
- The four folder counts do not total 24 WAV files.
- The Octatrack screen differs from the documented USB DISK MODE state after Finder eject.

## When complete, send this

```text
SETGPT-01 copied — 24 WAV files confirmed
USB DISK MODE screen after Finder eject: <what it shows>
```

## Next, not yet

We will load just the first working four-role palette from this library and make the opening
pattern. The remaining 20 files stay available for audition; you will not need to load everything
at once.

## Completed

- ✅ CF card formatted on-rig through `[PROJ]` → SYSTEM → CARD TOOLS → FORMAT CARD.
- ✅ New Set `SetGPT` and its working project created and loaded.
- ✅ OT clock-master settings restored and saved.
- ✅ Digitakt, TR-8S and TB-03 transport followed the OT before and after an OT power-cycle.
- ✅ Audio-classified 63-sample packet passed the accepted review gate.
- ✅ `SETGPT-01` prepared on the Mac: 24 verified 44.1 kHz, 16-bit PCM WAV files in four folders.

## References

- [SETGPT-01 source-to-output manifest](</Volumes/Extreme SSD/Production/SAMPLES/_EXPORT/OCTATRACK/EIDETIC-CURATED/AUDIO/SETGPT-01/manifest.tsv>)
- [Full Octatrack reference](../devices/octatrack.md)
- [Sample-to-device masterplan](sample-device-masterplan.md)
- [Clean-card decision](../decisions/2026-08-07-clean-octatrack-card-baseline.md)

## Revision history

| Version | Date | Summary |
|---|---|---|
| v1.1 | 2026-08-07 | Replaced the misleading one-file transfer with the complete 24-file SETGPT-01 card library. |
| v1.0 | 2026-08-07 | Introduced the live clean-baseline and first-transfer checklist. |
