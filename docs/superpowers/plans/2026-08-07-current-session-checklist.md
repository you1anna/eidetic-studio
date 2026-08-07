# Current-session checklist Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Give Robin one refreshable, literal checklist that starts the new sample workflow from a clean Octatrack CF card without altering the TR-8S configuration.

**Architecture:** `guides/current-session.md` is the only page Robin needs open while operating the
rig. It presents one complete hardware chunk at a time and records its outcome. The masterplan and
device page retain the durable rationale and manual sources; a decision record fixes the deliberately
destructive OT-card boundary.

**Tech Stack:** Markdown documentation, retained Elektron Octatrack MKII User Manual OS 1.40A,
existing private-repository sync script.

## Global Constraints

- Format the whole Octatrack CF card; it destroys all Sets, projects and samples on that card.
- Do not factory-reset or delete samples from the TR-8S; preserve its kick, routing, MIDI and sync configuration.
- The new Octatrack project must explicitly set CLOCK SEND and TRANSPORT SEND ON, and CLOCK RECEIVE and TRANSPORT RECEIVE OFF.
- Mark manual-derived button paths ⚠ until Robin confirms them on the physical rig.
- Preserve the established MIDI wiring and the TR-8S no-factory-reset constraint.
- After every studio-repository edit, run `scripts/sync.sh`.

---

### Task 1: Record the clean-baseline decision and reconcile the masterplan

**Files:**
- Create: `decisions/2026-08-07-clean-octatrack-card-baseline.md`
- Modify: `guides/sample-device-masterplan.md`

**Interfaces:**
- Consumes: Robin's explicit approval that no existing Octatrack Set or sample needs preservation.
- Produces: a permanent safe boundary used by the current-session checklist: format OT CF; do not reset TR-8S.

- [ ] **Step 1: Add the decision record**

State exactly that the Octatrack CF card is formatted for this new workflow, that this is not a
factory reset, and that the TR-8S configuration is retained. Include the consequence that all
Octatrack card-resident material is permanently removed.

- [ ] **Step 2: Update the masterplan's active starting state**

Replace references that instruct this run to start from the old Octatrack template with the approved
clean-card baseline. State that a new working Set/project requires the OT project MIDI SYNC values to
be restored before checking the downstream clock chain. Preserve every existing MIDI and TR-8S boundary.

- [ ] **Step 3: Verify the documentation is internally consistent**

Run:

```bash
rg -n -i 'saved template|blank project|format.*card|factory.reset|TR-8S' \
  guides/sample-device-masterplan.md decisions/2026-08-07-clean-octatrack-card-baseline.md
```

Expected: the masterplan describes the clean-card start for this run; no text authorises a TR-8S reset.

- [ ] **Step 4: Sync the repository**

Run:

```bash
scripts/sync.sh "record clean Octatrack baseline"
```

Expected: private remote reports a committed and pushed documentation change.

### Task 2: Create the live Octatrack checklist

**Files:**
- Create: `guides/current-session.md`
- Modify: `devices/octatrack.md`
- Modify: `guides/sample-device-masterplan.md`

**Interfaces:**
- Consumes: the clean-baseline decision, the Octatrack manual's FORMAT CARD, Set creation, project creation and project MIDI SYNC procedures.
- Produces: a self-contained `READY` checklist chunk ending with a single completion report from Robin.

- [ ] **Step 1: Add a literal clean-card procedure to the Octatrack device page**

Add a ⚠ manual-derived “Start with a clean CF card” procedure. It must include all of these states:

1. OT powered with its CF card inserted; confirmation that card contents are disposable.
2. PROJECT → SYSTEM → FORMAT CARD; acknowledgement that all card information and partitions will be lost; confirmation with `[YES]`.
3. Set mount/create path: SET → CHANGE → `<CREATE NEW SET>`; name `EIDETIC-01`; mount it.
4. Project creation path: PROJECT → CHANGE → `<CREATE EMPTY PROJECT>`; name `EIDETIC-01`; load it.
5. PROJECT → MIDI → SYNC values: CLOCK SEND ON, TRANSPORT SEND ON, CLOCK RECEIVE OFF, TRANSPORT RECEIVE OFF.
6. Save the new project, then test OT transport reaches the downstream chain before any sample is copied.

Every step includes the expected screen, explicit mismatch stop condition, success check and persistence action. Cite the retained manual sections 7.1, 8.2, 8.4.1 and 8.5.5.

- [ ] **Step 2: Create `guides/current-session.md`**

Use only these sections, in this order:

```markdown
# Current studio session

## Now — Clean Octatrack baseline
## What should happen
## Stop and report if
## When complete, send this
## Next, not yet
## Completed
## References
```

The `Now` section contains the complete procedure from Step 1, not a link or shorthand. It opens with
the permanent-loss warning and clearly says **do not touch the TR-8S settings**. The completion message
asks Robin to report `baseline complete` plus whether Digitakt, TR-8S and TB-03 started/stopped with the
OT. `Next, not yet` contains only “Load the prepared 140 BPM percussion loop onto OT Track 4.”

- [ ] **Step 3: Link the live page from the masterplan**

At the top of the masterplan, add one short “Current operating checklist” link to
`current-session.md`, explaining that it is the refreshable operator page and the masterplan remains
the forward reference. Bump the guide version and revision history.

- [ ] **Step 4: Verify paths, warnings and source status**

Run:

```bash
rg -n 'current-session|FORMAT CARD|EIDETIC-01|CLOCK SEND|TR-8S|⚠' \
  guides/current-session.md devices/octatrack.md guides/sample-device-masterplan.md
git diff --check
```

Expected: every named document and expected safety boundary appears; `git diff --check` produces no output.

- [ ] **Step 5: Sync the repository**

Run:

```bash
scripts/sync.sh "add live Octatrack clean-baseline checklist"
```

Expected: private remote reports a committed and pushed documentation change.
