# 2026-08-07 — Start the sample workflow from a clean Octatrack card

## Decision

Format the Octatrack CompactFlash card before loading the new sample palette. Existing Octatrack
Sets, projects and samples do not need to be preserved.

This is a card format, **not an Octatrack factory reset**. After formatting, create and mount one new
Set and create one empty project for the workflow. Restore and save the established project-specific
MIDI clock settings before loading any sample.

Do **not** factory-reset the TR-8S or delete its user samples. Its kit skeleton, kick routing, MIDI
and sync configuration remain protected.

## Rationale

The new workflow needs an unambiguous sample baseline. Reusing the existing Octatrack Set would
leave historical audio-pool files and project slot assignments mixed with the approved export.
Robin confirmed on 2026-08-07 that the existing Set and its samples have no preservation value.

Formatting the card gives a directly observable result: the new Set's audio pool starts empty and
only material copied during this workflow can appear in it.

## Consequences

- Formatting permanently removes every Set, project, sample and partition on the inserted CF card.
- The old Octatrack template is not used for this run.
- A newly created project starts without the studio's saved project state. CLOCK SEND and TRANSPORT
  SEND must be enabled; CLOCK RECEIVE and TRANSPORT RECEIVE must remain disabled.
- Track machines, sample assignments and performance state are created deliberately as later
  checklist chunks require them.
- The TR-8S is not cleaned down. Samples may be added later without disturbing its existing kick,
  routing or system settings; deletion remains prohibited until dependency behaviour is verified.
