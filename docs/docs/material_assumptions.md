# Material Assumptions – Soft & Fibrous CNC Handling

This project models CNC toolpath and motion strategies for **soft, deformable,
fiber-based materials** similar to those found in advanced textile, polymer,
and composite-adjacent manufacturing systems.

The assumptions below intentionally reflect **non-ideal material behavior**
encountered in real production environments.

---

## Representative Material Class

The modeled material behaves most similarly to:

- Fiber-dense assemblies (e.g., bundled hair, filament packs)
- Elastomer-backed laminates
- Thin, compliant polymer skins
- Layered soft substrates with anisotropic stiffness

These materials are **not rigidly fixtured** and respond dynamically to tool
forces and motion sequencing.

---

## Key Mechanical Assumptions

### 1. Compliance & Elastic Recovery
- Material deforms under tool load
- Partial elastic recovery occurs after tool withdrawal
- Final geometry depends on **toolpath order**, not just geometry

### 2. Directional (Anisotropic) Behavior
- Resistance differs along fiber alignment vs transverse direction
- Tool engagement parallel to fibers behaves differently than cross-fiber passes
- Cutting forces must be minimized perpendicular to dominant fiber orientation

### 3. Low Force Tolerance
- Excess normal force leads to:
  - Surface distortion
  - Fiber pull-out or displacement
  - Permanent set in backing material
- Toolpaths prioritize **gentle engagement** over material removal rate

### 4. Sensitivity to Entry / Exit Conditions
- Plunge moves and abrupt entries are avoided
- Ramp-in, lead-in arcs, and progressive engagement preferred
- Tool exit strategy impacts surface finish and fiber stability

---

## Thermal Assumptions

- Heat generation is undesirable and localized
- Elevated temperatures may:
  - Soften backing materials
  - Increase deformation under load
- Toolpaths favor:
  - Lower spindle speeds
  - Reduced dwell
  - Distributed contact time

---

## Fixturing & Boundary Conditions

- Material is assumed to be:
  - Lightly constrained
  - Supported by compliant backing or tensioning
- Rigid clamping is intentionally avoided
- Toolpath strategy compensates for limited constraint stiffness

---

## Manufacturing Implications

Because of these assumptions:

- CAM decisions dominate final quality
- Toolpath sequencing matters more than nominal geometry
- Conservative feeds and smooth motion reduce variability
- Repeatability is achieved through **process control**, not brute stiffness

---

## Scope Note

This document abstracts material behavior for educational and
demonstration purposes. No proprietary material formulations,
dimensions, or processes are disclosed.

The focus is on **engineering judgment**, not IP replication.
