# Problem Statement

Modern CNC systems are optimized for rigid materials such as metals and hard plastics.
However, emerging manufacturing applications increasingly involve **soft, deformable,
and viscoelastic materials** that behave very differently under cutting forces.

Examples include:
- Polymer-based substrates
- Elastomeric fixtures
- Fiber-dense or compliant assemblies
- Soft composite or layered materials

In these cases, traditional high-force toolpaths can cause:
- Material drag or tearing
- Dimensional inaccuracy due to elastic recovery
- Surface distortion from excessive tool pressure
- Inconsistent repeatability across cycles

This project explores **toolpath strategies for soft-material CNC machining**, focusing on:
- Reduced cutting forces
- Controlled entry and exit paths
- Feed-rate modulation to limit deformation
- Toolpath geometry designed for compliance-aware machining

The goal is not production-ready code, but to demonstrate **CAM judgment, toolpath intent,
and an understanding of how G-code decisions affect real material behavior**.
