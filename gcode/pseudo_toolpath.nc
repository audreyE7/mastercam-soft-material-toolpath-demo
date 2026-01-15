%
(---------------------------------------------)
( PSEUDO TOOLPATH — SOFT MATERIAL DEMO )
( Project: Mastercam Soft-Material Toolpath )
( Author: Audrey Enriquez )
( Purpose: Demonstrate CAM strategy + G-code logic )
( Material: Polymer / Fiber Composite (wig-like analog) )
( Machine: 3-Axis CNC, Vacuum Hold-Down )
( Units: mm )
( NOTE: Non-production, geometry abstracted )
(---------------------------------------------)

G21            ( Units: millimeters )
G90            ( Absolute positioning )
G17            ( XY plane selection )
G94            ( Feedrate per minute )

(--- SAFETY & SETUP ---)
G54            ( Work offset )
G40 G49 G80    ( Cancel cutter comp, tool length, canned cycles )
M09            ( Coolant OFF — soft material, air only )

(--- TOOL SELECTION ---)
( T1: 6mm Ball End Mill — soft material, low shear )
T1 M06
S12000 M03     ( Spindle ON, high RPM for clean cut )
G00 G43 H01 Z20.0

(--- APPROACH ---)
G00 X0 Y0
Z5.0           ( Safe approach height )

(--- PASS 1: SHALLOW SURFACE SKIM ---)
( Purpose: Establish reference surface, minimize fiber pull )
G01 Z-0.5 F300
G01 X80.0 Y0.0 F800
G01 X80.0 Y40.0
G01 X0.0  Y40.0
G01 X0.0  Y0.0

(--- STEP-OVER PASSES ---)
( Small step-over to avoid tearing / deformation )
G01 Z-1.0 F250
G01 X80.0 Y5.0 F700
G01 X0.0  Y10.0
G01 X80.0 Y15.0
G01 X0.0  Y20.0
G01 X80.0 Y25.0
G01 X0.0  Y30.0

(--- FINISH CONTOUR ---)
( Reduced feed for edge quality )
G01 Z-1.2 F200
G01 X80.0 Y30.0 F500
G01 X80.0 Y0.0
G01 X0.0  Y0.0
G01 X0.0  Y30.0

(--- RETRACT ---)
G00 Z20.0
M05            ( Spindle OFF )

(--- END ---)
G53 Z0         ( Machine home )
M30
%
