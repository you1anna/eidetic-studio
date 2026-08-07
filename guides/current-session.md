# Current studio session

**Version:** v1.2  
**Status:** `READY — load the first percussion loop onto Track 4 and make it play`  
**Current device:** Octatrack MKII, OS 1.40C

Keep this page open. Complete only **Now**. When it passes, refresh this page for the next short
track-building chunk.

## Now — make the first loop play on Track 4

**Goal:** load the first prepared percussion loop into an empty Flex slot, assign it to Track 4,
place one trig and hear it at the current project tempo. Do not touch Tracks 5, 6 or 7: they are
reserved for recording and the desk input path.

**Starting state:** the Octatrack is on its normal screen. Set `SetGPT` and its working project are
loaded. `SETGPT-01` has been copied to the Set's `AUDIO` folder and the CF card is no longer mounted
on the Mac.

> ⚠ The following loading screens are manual-derived and have not yet been confirmed on this new
> project. If a named screen or list does not appear, stop and report what it does show.

1. Press `[TRACK 4]` twice quickly.
2. **Expected:** **QUICK ASSIGN** opens. Because Track 4 is intended as a Flex percussion-loop
   track, its **Flex** sample-slot list should appear.
3. If a **machine list** appears instead, highlight **FLEX**, press `[YES]`, then press `[RIGHT]`.
   **Expected:** the Flex sample-slot list opens.
4. At the top of the list you may see entries such as **`R1 > RECORDING1`**. These are the
   Octatrack's built-in recorder buffers, not old samples. **Do not delete or select them.** Use
   `[DOWN]` to move past the `R1`–`R8` entries to the first empty **numbered Flex slot**, then press
   `[YES]`.
5. **Expected:** the file browser opens. Open the folder **`SETGPT-01`**, then
   **`PERCUSSION-LOOPS`**.
6. Highlight **`DL01_perc-loo_000a.wav`**.
7. Hold `[FUNC]` and press `[YES]` to preview it. **Expected:** you hear the loop through the main
   outputs. If you do not hear it, stop here; do not load it yet.
8. Press `[YES]` once. **Expected:** the file name appears in the selected Flex slot.
9. With that same loaded slot highlighted, press `[YES]` again. **Expected:** it is assigned to
   Track 4, rather than merely stored in the shared Flex list.
10. Press `[NO]` until the normal track screen returns. Press `[RECORD]` once, then press `[TRIG 1]`
    to place a sample trig at step 1. Press `[RECORD]` again to leave Grid Recording.
11. Press `[PLAY]`.
12. **Success check:** Track 4 plays the percussion loop repeatedly and in time. If it is silent,
    stop and report whether the loaded slot name is visible and whether trig 1 is lit.

**Save this first layer only after it is audible:**

13. Press `[FUNC]` + `[PART]`, select **SAVE**, then press `[YES]`.
14. Press `[FUNC]` + `[PROJ]`, select **SAVE**, then press `[YES]`.
15. Press `[PROJ]` → **PROJECT** → **SYNC TO CARD**. **Expected:** the project data is written to
    the CF card.

## Stop and report if

- QUICK ASSIGN, the Flex list, or the file browser differs from the expected screen.
- `SETGPT-01` or `PERCUSSION-LOOPS` is absent from the file browser.
- The preview is silent, the slot name never appears, or Track 4 is silent after placing trig 1.

## When complete, send this

```text
Track 4 loop audible: yes/no
First screen that differed, if any: <exact text or photo>
```

## Next, not yet

Add the first full-drum loop and vocal phrase to the track. The remaining files stay available for
audition; you will not load everything at once.

## Completed

- ✅ CF card formatted on-rig through `[PROJ]` → SYSTEM → CARD TOOLS → FORMAT CARD.
- ✅ New Set `SetGPT` and its working project created and loaded.
- ✅ OT clock-master settings restored and saved.
- ✅ Digitakt, TR-8S and TB-03 transport followed the OT before and after an OT power-cycle.
- ✅ Audio-classified 63-sample packet passed the accepted review gate.
- ✅ `SETGPT-01` prepared on the Mac: 24 verified 44.1 kHz, 16-bit PCM WAV files in four folders.
- ✅ Robin reported `SETGPT-01` copied to the Octatrack CF card on-rig, 2026-08-07.
- ✅ Robin ejected `OCTATRACK-R`; the Octatrack returned to its normal screen on-rig, 2026-08-07.

## References

- [SETGPT-01 source-to-output manifest](</Volumes/Extreme SSD/Production/SAMPLES/_EXPORT/OCTATRACK/EIDETIC-CURATED/AUDIO/SETGPT-01/manifest.tsv>)
- [Full Octatrack reference](../devices/octatrack.md)
- [Sample-to-device masterplan](sample-device-masterplan.md)
- [Clean-card decision](../decisions/2026-08-07-clean-octatrack-card-baseline.md)

## Revision history

| Version | Date | Summary |
|---|---|---|
| v1.2 | 2026-08-07 | Recorded clean exit from USB DISK MODE and grouped the next creation chunk: load, assign, trig, audition and save the first Track 4 percussion loop. |
| v1.1 | 2026-08-07 | Replaced the misleading one-file transfer with the complete 24-file SETGPT-01 card library. |
| v1.0 | 2026-08-07 | Introduced the live clean-baseline and first-transfer checklist. |
