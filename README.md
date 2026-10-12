# Dynamic Modeling and Control of an ABE Fermentation–Flash Process

**Process Control course project | Sharif University of Technology | 2026**  
**Tools:** MATLAB R2024a, Simulink, control-system analysis and PI/feedforward control  
**Project type:** Team project

## Overview

Course project on the nonlinear dynamics and control of an acetone–butanol–ethanol (ABE) fermentation process coupled with flash separation. The model includes seven differential-state variables and a quasi-steady, six-component flash calculation. We examined operating-point linearization, multivariable response to disturbances, PI-controller tuning, and feedforward compensation.

## Methods

- Nonlinear mass-balance and kinetic model for the fermentation process, implemented in Simulink.
- Quasi-steady flash calculations accounting for vapor–liquid equilibrium.
- Model trimming and linearization to obtain state-space and transfer-function representations.
- Steady-state gain and disturbance-response analysis for ±5% and ±30% input changes.
- Comparison of PI-controller tuning by internal model control (IMC) and Ziegler–Nichols methods.
- Investigation of static feedforward compensation for feed-substrate concentration disturbances.

## Repository contents

```text
models/
  PCProject1.slx     Base Simulink process model
  PCProject3.slx     Simulink model with multiple disturbance scenarios
  PCProject4.slx     Simulink model containing PI-control loops
  PCProject5.slx     Additional Simulink control-study model
scripts/
  PCProject2.m       Operating-point trimming, gain analysis, linearization, PI and feedforward calculations
  PCProjectCHECK.m   Supplementary computational/checking script (see limitations)
```

These are the original course-project source files; their original names are retained.

## How to explore

1. Open the `models/PCProject1.slx` model in MATLAB/Simulink (created in R2024a).
2. Add the `models` folder to the MATLAB path before running `scripts/PCProject2.m`, because it calls `trim('PCProject1', ...)` and `linmod('PCProject1', ...)`.
3. Inspect the other Simulink models for the disturbance and control studies. The original model settings may require adjustment for a different MATLAB/Simulink installation.
4. **Do not treat `scripts/PCProjectCHECK.m` as a ready-to-run standalone entry point**; the provided source contains a local function declaration before subsequent script statements and may require restructuring.

## Requirements and verification status

- Original model metadata indicates MATLAB/Simulink **R2024a**.
- MATLAB, Simulink and control-system functionality are needed; additional installed products may be needed for the particular blocks and linearization commands.
- The included models and scripts **have not been re-executed in the publication-preparation environment**. Reproducibility and numeric outputs have therefore not been independently verified here.

## Important modeling limitations

The course report notes sensitivities to flash vapor–liquid equilibrium parameters and limitations of the kinetics and phase-equilibrium assumptions. The control-study results are tied to the specified model and operating conditions; they are not experimentally validated controller-performance guarantees.

## Sharing note

The original Persian-language group report and a separate Aspen HYSYS case file are not included in this public-ready package. The report contains student identification details, and the case file should undergo a separate sharing/licensing review.