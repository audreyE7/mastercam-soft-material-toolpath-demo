# Toolpath Strategy – Soft Material & Fiber-Safe Motion

This document outlines toolpath and motion-planning strategies for CNC and
robotic systems interacting with **soft, deformable, fiber-based materials**.

The emphasis is on **process stability**, **repeatability**, and **surface
integrity**, rather than aggressive material removal.

---

## Design Philosophy

For compliant materials, the primary failure modes are not geometric error,
but:

- Fiber displacement
- Surface distortion
- Permanent deformation
- Variability between cycles

Toolpaths are therefore designed to **manage force and sequence**, not maximize speed.

---

## Core Strategy Principles

### 1. Progressive Engagement Over Plunge

- Direct plunges are avoided
- Tool engagement uses:
  - Lead-in arcs
  - Shallow ramp entries
  - Tangential approach vectors
- Initial contact force is minimized to prevent fiber lift or compression

---

### 2. Sequencing Before Optimization

- Toolpath order is more critical than feed rate
- Features are approached in a sequence that:
  - Reduces cumulative distortion
  - Maintains local material stability
- Finishing passes are delayed until bulk stabilization occurs

---

### 3. Constant Engagement & Smooth Motion

- Abrupt direction changes increase local stress
- Preferred motion includes:
  - Continuous curvature paths
  - Reduced jerk profiles
  - Limited start/stop cycles
- Machine dynamics are treated as part of the material interaction

---

### 4. Low-Normal-Force Bias

- Toolpaths prioritize lateral motion over normal penetration
- Depth of engagement is controlled incrementally
- Force is distributed spatially rather than concentrated

---

### 5. Direction-Aware Cutting

- Toolpaths account for dominant fiber orientation
- Cross-fiber engagement is minimized or broken into staged passes
- Parallel-fiber passes are favored for surface-critical regions

---

## Feed, Speed, and Thermal Considerations

- Conservative feeds reduce elastic lag and spring-back
- Lower spindle speeds minimize heat accumulation
- Dwell time is explicitly limited to avoid softening effects

Thermal behavior is treated as a **secondary deformation driver**, not a cutting concern.

---

## Error Recovery & Variability Handling

Because soft materials exhibit cycle-to-cycle variation:

- Toolpaths are tolerant of small positional drift
- Re-touch and verification passes are preferred over aggressive correction
- Process repeatability is achieved through:
  - Stable motion
  - Predictable force
  - Consistent sequencing

---

## CAM-Level Control Over Machine Power

This strategy assumes that:

- Machine stiffness is finite
- Sensors may not capture micro-deformation
- Software decisions dominate physical outcomes

As a result, the CAM layer is treated as a **primary control system**, not a translation step.

---

## Applicability

While inspired by CNC workflows, these strategies apply equally to:

- Multi-axis robotic end-effectors
- Hybrid CNC-robot cells
- Vision-guided soft-material automation

---

## Scope Note

This document describes generalized motion principles and does not reflect
any proprietary processes, tooling, or materials.

Its purpose is to demonstrate **engineering judgment under soft-material constraints**.
