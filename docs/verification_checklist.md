# Verification Checklist (CAM → Post → Shop-Floor Readiness)

Purpose: A repeatable checklist for validating CAM toolpaths and posted code, with extra notes for **soft / flexible / deformable materials** (e.g., polymers, foams, compliant composites, thin laminates, “skin-like” materials).

> This repo contains a **demo** workflow. Items below reflect real CAM verification habits.

---

## 1) Pre-CAM Inputs (Before Toolpaths)

- [ ] Confirm drawing/model revision + datum scheme (what is X0/Y0/Z0?).
- [ ] Confirm stock definition (size, thickness, overhang, sacrificial layers).
- [ ] Confirm fixturing method (vacuum, adhesive, pins, clamps) and where it can deform material.
- [ ] Identify “no-go” regions (clamps, hold-downs, sensors, vacuum ports, robot end-effector clearance).
- [ ] Choose material strategy:
  - [ ] Low chip load / conservative engagement for soft materials
  - [ ] Minimize “hooking” edges (entry/exit must be smooth)

---

## 2) CAM Toolpath Verification (Inside CAM)

### Geometry & strategy
- [ ] Toolpaths reference the correct surfaces/contours (no accidental edges).
- [ ] Stepdown and stepover are conservative for soft material (avoid aggressive engagement).
- [ ] Entry method is appropriate:
  - [ ] Ramp / helix preferred
  - [ ] Avoid straight plunges into material
- [ ] Lead-in/lead-out exists and is smooth (arcs preferred vs sharp corners).
- [ ] Cornering strategy avoids sudden direction reversals that can tug flexible stock.

### Feeds/speeds sanity
- [ ] Feeds and spindle speeds are within a plausible range for tool + material.
- [ ] No “mystery” feed overrides on specific segments (check linking moves).
- [ ] Verify retract heights: not excessive, but safely clears clamps/fixtures.

### Collision & clearance
- [ ] Holder clearance verified (tool + holder + spindle nose if modeled).
- [ ] No collisions with fixtures, clamps, vacuum table, or part walls.
- [ ] Verify safe Z for rapids.

---

## 3) Post-Processing Checks (NC Output Review)

- [ ] Units correct (G20 vs G21).
- [ ] Work coordinate system correct (G54/G55/etc.).
- [ ] Plane selection correct (G17/G18/G19).
- [ ] Absolute vs incremental behavior correct (G90 vs G91).
- [ ] Cutter compensation behavior is intentional (G41/G42) OR explicitly not used.
- [ ] Tool length comp applied and correct (G43 H##) with safe Z.

### Soft-material specific NC checks
- [ ] No plunges at high feed into Z0 plane (prefer ramp).
- [ ] No rapids close to the material surface (minimize dragging risk).
- [ ] Avoid long dwells at contact that could melt/mark material (unless intentional).
- [ ] Avoid aggressive stop/start segments; smooth motion blocks preferred.

---

## 4) Dry Run / Prove-Out Plan

- [ ] First run is a **dry run** above stock (e.g., Z +10 mm) to check motion envelope.
- [ ] Then a **single-pass** shallow cut to validate holding + deformation behavior.
- [ ] Confirm chip evacuation strategy (air blast / vacuum) if applicable.
- [ ] Confirm spindle warmup / tool runout check when precision matters.

### Inspection checkpoints
- [ ] After first contour, pause to inspect:
  - [ ] Material slip / shift
  - [ ] Tearing, fuzzing, burring, snagging
  - [ ] Surface marking / heat effects
- [ ] Measure critical features with a simple go/no-go or calipers before full depth.

---

## 5) Typical Failure Modes + Fixes (Soft / Deformable Materials)

**Failure: part shifts mid-cut**
- Fix: increase hold-down area, add tabs, switch to adhesive + sacrificial plate, reduce lateral engagement.

**Failure: edge “hooks” / tears**
- Fix: add smoother lead-in/out arcs, reduce feed at entry/exit, avoid sharp corners, use climb/conventional appropriately.

**Failure: surface melting / glossing**
- Fix: lower spindle or increase feed slightly, add air blast, reduce dwell, ensure sharp tool.

**Failure: dimensional drift due to deflection**
- Fix: add finishing pass with minimal engagement, reduce tool pressure, verify tool sharpness/runout.

---

## 6) What I’d Show a Hiring Team (Deliverables)

- [ ] Screenshot(s): toolpath preview, stock/fixture setup, collision check result.
- [ ] A short “prove-out note” describing what was validated and what changed.
- [ ] Posted NC excerpt with safe-start block and ramp entry example.
