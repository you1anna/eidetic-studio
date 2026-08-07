# SetGPT Octatrack library — design

**Status:** approved in conversation on 2026-08-07

## Purpose

Put the complete, currently classified Octatrack collection on the CF card so Robin can start a
track immediately without choosing TSV rows or repeating transfers. The collection is a source
library; it is not a claim that all files must be loaded into RAM or placed on tracks at once.

## Collection

Export the 24 samples currently assigned to Octatrack groups in the accepted audio-classification
packet. Copy one visible folder tree into the `AUDIO` folder of Set `SetGPT`:

```text
SetGPT/AUDIO/SETGPT-01/
  PERCUSSION-LOOPS/     13 files
  FULL-DRUM-LOOPS/       4 files
  VOCAL-PHRASES/         6 files
  LONG-VOCALS/           1 file
```

Each file must be derived from the existing accepted classification snapshot, converted with the
Octatrack export profile, and recorded in a batch manifest. The source archive remains unchanged.
The existing one-file `octatrack-smoke` export is historical transfer evidence only; it is not the
SetGPT collection and will not be used in the live checklist.

## Working method

The live session page will give Robin a single physical task at a time:

1. Copy the complete `SETGPT-01` folder tree to the Octatrack CF card in USB Disk Mode.
2. Load a small working palette from that library only when directed by the next checklist chunk.
3. Build the first pattern from a maximum of four purposeful roles at once: percussion loop,
   full-drum loop, vocal phrase, and an optional variation layer.

This separates **library completeness** from **track complexity**. All 24 candidates are ready to
audition on the device, while each creation step stays short, explicit and reversible.

## Guardrails and success criteria

- No individual TSV selection is required from Robin.
- No existing SetGPT project, clock configuration, or other device changes are deliberately erased.
- The new collection is staged and verified on the Mac before copying.
- Finder must show all four folders and 24 files inside `OCTATRACK-R/SetGPT/AUDIO/SETGPT-01` before
  USB Disk Mode is exited.
- The next on-device load instructions must be manual-verified or clearly marked ⚠ until Robin
  confirms them on-rig.
- Digitakt and TR-8S remain out of scope until the Octatrack library copy and first playable
  Octatrack pattern are complete.

