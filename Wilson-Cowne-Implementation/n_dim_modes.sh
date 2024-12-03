#!/bin/bash

# Test Case 1: Stable Node Solution (Low Coupling)
python wilson_cowan_n_modes.py \
    -n 3 \
    -tstop 200 \
    --ie_base 0.1 0.5 1 \
    --ie_amp 1 0.1 0.5 \
    --noise_level 0 0 0 \
    --ze_thresh 0.5 0.6 0.7

# Test Case 2: Limit Cycle (Moderate Coupling)
python wilson_cowan_n_modes.py \
    -n 3 \
    -tstop 200 \
    --ie_base 0.3 0.4 0.5 \
    --ie_amp 0.5 0.6 0.7 \
    --noise_level 0 0 0 \
    --ze_thresh 0.4 0.5 0.6

# Test Case 3: Complex Oscillations (High Coupling)
python wilson_cowan_n_modes.py \
    -n 3 \
    -tstop 200 \
    --ie_base 0.5 0.6 0.7 \
    --ie_amp 1.0 1.1 1.2 \
    --noise_level 0 0 0 \
    --ze_thresh 0.3 0.4 0.5

# Test Case 4: Quasi-Periodic Behavior
python wilson_cowan_n_modes.py \
    -n 3 \
    -tstop 200 \
    --ie_base 0.2 0.3 0.4 \
    --ie_amp 0.8 0.9 1.0 \
    --noise_level 0 0 0 \
    --ze_thresh 0.6 0.7 0.8

# Test Case 5: Near-Chaotic Dynamics
python wilson_cowan_n_modes.py \
    -n 3 \
    -tstop 200 \
    --ie_base 0.4 0.5 0.6 \
    --ie_amp 1.5 1.6 1.7 \
    --noise_level 0 0 0 \
    --ze_thresh 0.2 0.3 0.4

# Summary
echo "Completed 5 Wilson-Cowan Model Test Cases with Zero Noise Level"