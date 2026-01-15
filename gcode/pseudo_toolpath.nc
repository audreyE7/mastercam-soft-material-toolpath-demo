%
O2025 (SOFT_MATERIAL_TOOLPATH_DEMO)

(===============================================================)
( PSEUDO G-CODE / CAM-INTENT DEMO — SOFT / DEFORMABLE MATERIALS  )
( CAM-GENERATED INTENT: VALUES REPRESENTATIVE, NOT PRODUCTION.  )
( MACHINE: 3-AXIS VMC / ROUTER | CONTROL: FANUC-STYLE DIALECT   )
( UNITS: MM | PLANE: G17 (XY) | WCS: G54                        )
( PURPOSE: Show safe approach + contour + raster logic that     )
(          minimizes drag, snagging, and deformation.           )
(===============================================================)

( SOFT-MATERIAL PROCESS NOTES )
( - Prefer ramps over plunges; avoid aggressive Z engagement )
( - Keep near-surface rapids to a minimum; short retracts reduce re-contact risk )
( - Use gentle lead-in/out arcs to avoid “hooking” fibers/edges )
( - Conservative stepovers + smooth corners reduce pulling/tearing )
( - Add checkpoints for tension/fixturing verification when needed )
( - Air blast / vacuum extraction preferred over flood coolant )

(-----------------------------)
( 0) SAFE START / MODAL RESET )
(-----------------------------)
G90 G94 G17            (ABS, FEED/MIN, XY PLANE)
G21                    (MM)
G40 G49 G80            (CANCEL COMP, TOOL LENGTH, CANNED CYCLES)
G54                    (WORK OFFSET)

(-----------------------------)
( 1) TOOL 1 - FINISH/CONTOUR  )
(-----------------------------)
( TOOL: SMALL DIA END MILL / POLISHED / SHARP, SOFT-MATERIAL FRIENDLY )
T1 M06                 (TOOL CHANGE)

S8000 M03              (SPINDLE ON - PLACEHOLDER RPM)
G00 G43 H01 Z30.0      (APPLY TOOL LENGTH, SAFE Z)
M07                    (AIR BLAST ON - IF AVAILABLE)
( NOTE: If vacuum/dust extraction is used, enable via shop M-code )

( Optional pre-position away from part before approaching plane )
G00 X-20.0 Y-20.0

(------------------------------------------)
( 2) APPROACH STRATEGY - RAMP ENTRY EXAMPLE )
(------------------------------------------)
( RAMP INTO CUT: shallow Z descent while moving in XY )
( FEEDS intentionally conservative to limit drag/deformation )
G00 X10.0 Y10.0
G01 Z2.0 F600          (APPROACH ABOVE PLANE)
G01 X20.0 Y10.0 Z1.5 F450
G01 X30.0 Y15.0 Z1.0
G01 X40.0 Y25.0 Z0.5
G01 X50.0 Y40.0 Z0.0   (REACH CUTTING PLANE)

(----------------------------------------)
( 3) OUTLINE PASS - CONTINUOUS CONTOURING )
(----------------------------------------)
( Avoid sharp corners; use arcs to maintain smooth load & tension )
G01 X120.0 Y40.0 F700
G02 X130.0 Y50.0 I0.0 J10.0
G01 X130.0 Y120.0
G02 X120.0 Y130.0 I-10.0 J0.0
G01 X50.0 Y130.0
G02 X40.0 Y120.0 I0.0 J-10.0
G01 X40.0 Y50.0
G02 X50.0 Y40.0 I10.0 J0.0

(---------------------------------------------)
( 4) INTERNAL FEATURE PASS - LIGHT STEP-OVERS )
(---------------------------------------------)
( Light stepovers reduce pulling / snagging in soft materials )
G00 Z3.0
G00 X60.0 Y60.0

( Gentle re-entry ramp )
G01 Z1.5 F500
G01 X65.0 Y60.0 Z1.0 F400
G01 X70.0 Y62.0 Z0.5
G01 X75.0 Y66.0 Z0.0

( Example pocket/slot raster - abstracted )
G01 X110.0 Y66.0 F650
G01 Y70.0
G01 X75.0
G01 Y74.0
G01 X110.0
G01 Y78.0
G01 X75.0

(----------------------------------------------)
( 5) PATTERN / REPEAT OP - CHECKPOINTED MOTION )
(----------------------------------------------)
( CHECKPOINT: Verify material tension / fixture hold if required )
G00 Z5.0
( --- OPERATOR CHECKPOINT (NO DWELL BY DEFAULT) --- )
( OPTIONAL: G04 P2.0  (DWELL 2s) )

( Example repeated “stitch line” style path )
G00 X55.0 Y95.0
G01 Z0.0 F450
G01 X115.0 Y95.0 F600
G00 Z5.0

G00 X55.0 Y100.0
G01 Z0.0 F450
G01 X115.0 Y100.0 F600
G00 Z5.0

G00 X55.0 Y105.0
G01 Z0.0 F450
G01 X115.0 Y105.0 F600
G00 Z5.0

(------------------------------------)
( 6) RETRACT / END OF TOOL 1 OPERATION )
(------------------------------------)
G00 Z30.0
M09                    (AUX OFF: AIR/VAC/OFF IF MAPPED)

(----------------------------)
( 7) SAFE RETURN / PROGRAM END )
(----------------------------)
G00 X0.0 Y0.0
M05                    (SPINDLE STOP)

( Optional “machine home” style retract—use only if your shop prefers it )
( G91 G28 Z0.0 )
( G90 )

M30                    (END / REWIND)
%
