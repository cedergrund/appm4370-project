# # # #!/bin/bash
# # # set -ex

# # # No Drive

# # echo "No-drive case"
# # python wilson_cowan_extended.py -wee 10. -wei 12. -wie 8. -wii 3. -ze 0.2 -zi 4. -wew 5. -wiw 4. -ie1 0 -ii1 0 -ie2 0 -ii2 0

# # echo "Exploring coupling"
# # python wilson_cowan_extended.py -wee 20. -wei 21. -wie 16. -wii 6 -wew 10. -wiw 8. -ze 1.6 -zi 7. -zw 3. -ie1 0.5 -ii1 0.3 -ie2 0.2 -ii2 0.1

# # echo "Increasing coupling"
# # python wilson_cowan_extended.py -wee 15. -wei 18. -wie 12. -wii 5. -wew 7. -wiw 6. -ze 2. -zi 5. -zw 2.5 -ie1 1. -ii1 0.8 -ie2 0.6 -ii2 0.4


# # echo "Test cases completed. Check limit_cycle.png, saddle_point.png, and heteroclinic_channel.png for visualizations."


# # Test Case 1: Baseline Symmetric Coupling
# #!/bin/bash

# # Wilson-Cowan Neural Population Model: Comprehensive Test Cases

# # Baseline and Foundational Scenarios
# echo "### Test Case 16: Stable Fixed-Point Solution"
# echo "Explores dynamics with balanced excitation and inhibition, aiming for a stable steady-state solution."
# python wilson_cowan_extended.py \
#     -wee 10.0 -wei 9.0 -wie 8.0 -wii 7.0 \
#     -wew 5.0 -wiw 4.0 -www 3.0 \
#     -wiw 1.0 -wwi 1.0 \
#     -ie1 0.2 -ie2 0.3 \
#     -ii1 0.15 -ii2 0.2 \
#     -iw1 0.1 -iw2 0.15 \
#     -w 0.2 -tstop 200

# echo "### Test Case 17: Gradual Convergence to Stability"
# echo "Parameters tuned for a long transient before reaching stability."
# python wilson_cowan_extended.py \
#     -wee 10.2 -wei 9.8 -wie 8.5 -wii 7.2 \
#     -wew 5.0 -wiw 4.5 -www 3.2 \
#     -wiw 0.9 -wwi 0.9 \
#     -ie1 0.25 -ie2 0.27 \
#     -ii1 0.2 -ii2 0.18 \
#     -iw1 0.1 -iw2 0.1 \
#     -w 0.05 -tstop 500


# # Test Case 1: Baseline Symmetric Coupling
# echo "Running Test Case 1: Establishes a balanced, symmetric neural network with moderate coupling and input."
# python wilson_cowan_extended.py \
#     -wee 10.0 -wei 12.0 -wie 8.0 -wii 3.0 \
#     -wew 5.0 -wiw 4.0 -www 3.0 \
#     -wiw 2.0 -wwi 2.0 \
#     -ie1 0.1 -ie2 0.5 \
#     -ii1 0.1 -ii2 0.3 \
#     -iw1 0.05 -iw2 0.2 \
#     -w 0.25 -tstop 200

# # Test Case 2: Weak Coupling, Low Frequency
# echo "Running Test Case 2: Explores a minimally coupled system with low-frequency inputs, simulating a quiescent neural state."
# python wilson_cowan_extended.py \
#     -wee 5.0 -wei 6.0 -wie 4.0 -wii 2.0 \
#     -wew 2.5 -wiw 2.0 -www 1.5 \
#     -wiw 1.0 -wwi 1.0 \
#     -ie1 0.05 -ie2 0.3 \
#     -ii1 0.05 -ii2 0.2 \
#     -iw1 0.02 -iw2 0.1 \
#     -w 0.1 -tstop 200

# # Test Case 3: Strong Local Coupling
# echo "Running Test Case 3: Investigates strong local interactions, potentially leading to more synchronized neural activity."
# python wilson_cowan_extended.py \
#     -wee 15.0 -wei 18.0 -wie 12.0 -wii 5.0 \
#     -wew 7.0 -wiw 6.0 -www 5.0 \
#     -wiw 3.0 -wwi 3.0 \
#     -ie1 0.3 -ie2 0.0 \
#     -ii1 0.25 -ii2 0.0 \
#     -iw1 0.2 -iw2 0.0 \
#     -w 0.5 -tstop 200

# ## Exploring Input Dynamics

# # Test Case 4: High-Frequency External Input
# echo "Running Test Case 4: Simulates high-frequency external stimulation, exploring potential resonance or synchronization effects."
# python wilson_cowan_extended.py \
#     -wee 8.0 -wei 10.0 -wie 6.0 -wii 4.0 \
#     -wew 6.0 -wiw 5.0 -www 4.0 \
#     -wiw 2.5 -wwi 2.0 \
#     -ie1 0.2 -ie2 1.0 \
#     -ii1 0.1 -ii2 0.7 \
#     -iw1 0.1 -iw2 0.5 \
#     -w 1.0 -tstop 200

# # Test Case 5: Asymmetric Input Amplitudes
# echo "Running Test Case 5: Examines asymmetric input amplitudes, potentially revealing nonlinear response characteristics."
# python wilson_cowan_extended.py \
#     -wee 9.0 -wei 3.0 -wie 4.0 -wii 3.5 \
#     -wew 5.5 -wiw 4.5 -www 3.5 \
#     -wiw 2.0 -wwi 2.0 \
#     -ie1 0.05 -ie2 1.5 \
#     -ii1 0.2 -ii2 0.1 \
#     -iw1 0.1 -iw2 0.2 \
#     -w 0.75 -tstop 200


# # Test Case 6: Low-Amplitude Persistent Input
# echo "Running Test Case 6: Investigates sustained low-amplitude inputs and their potential for maintaining neural activity."
# python wilson_cowan_extended.py \
#     -wee 7.0 -wei 9.0 -wie 5.0 -wii 3.0 \
#     -wew 4.0 -wiw 3.5 -www 2.5 \
#     -wiw 1.5 -wwi 1.5 \
#     -ie1 0.5 -ie2 0.1 \
#     -ii1 0.3 -ii2 0.05 \
#     -iw1 0.2 -iw2 0.02 \
#     -w 0.2 -tstop 200

# ## Complex Interaction Scenarios

# # # Test Case 7: Strong Cross-Population Interactions
# # echo "Running Test Case 7: Explores enhanced cross-population interactions, potentially revealing complex dynamical behaviors."
# # python wilson_cowan_extended.py \
# #     -wee 12.0 -wei 15.0 -wie 10.0 -wii 6.0 \
# #     -wew 8.0 -wiw 7.0 -www 6.0 \
# #     -wiw 4.0 -wwi 4.0 \
# #     -ie1 0.15 -ie2 0.6 \
# #     -ii1 0.1 -ii2 0.4 \
# #     -iw1 0.08 -iw2 0.3 \
# #     -w 0.5 -tstop 200


# # echo "### Test Case 8: Minimal Cross-Population Coupling"
# # echo "Investigates neural dynamics with minimal cross-population interactions."
# # python wilson_cowan_extended.py \
# #     -wee 11.0 -wei 13.0 -wie 9.0 -wii 4.0 \
# #     -wew 1.0 -wiw 1.0 -www 2.0 \
# #     -wiw 0.5 -wwi 0.5 \
# #     -ie1 0.1 -ie2 0.4 \
# #     -ii1 0.1 -ii2 0.3 \
# #     -iw1 0.05 -iw2 0.2 \
# #     -w 0.3 -tstop 200

# # echo "### Test Case 9: Competing Oscillatory Modes"
# # echo "Explores potential competitive oscillatory dynamics between populations."
# # python wilson_cowan_extended.py \
# #     -wee 10.0 -wei 12.0 -wie 8.0 -wii 5.0 \
# #     -wew 6.0 -wiw 5.0 -www 4.0 \
# #     -wiw 3.0 -wwi 2.5 \
# #     -ie1 0.2 -ie2 0.8 \
# #     -ii1 0.15 -ii2 0.6 \
# #     -iw1 0.1 -iw2 0.5 \
# #     -w 1.5 -tstop 200

# echo "### Test Case 10: Extremely High Coupling"
# echo "Pushes the model to its limits with extremely strong coupling, potentially revealing saturation or breakdown effects."
# python wilson_cowan_extended.py \
#     -wee 20.0 -wei 25.0 -wie 15.0 -wii 10.0 \
#     -wew 12.0 -wiw 10.0 -www 8.0 \
#     -wiw 6.0 -wwi 6.0 \
#     -ie1 0.3 -ie2 1.0 \
#     -ii1 0.2 -ii2 0.8 \
#     -iw1 0.15 -iw2 0.6 \
#     -w 2.0 -tstop 200

# echo "### Test Case 11: Minimal Input, Strong Self-Interaction"
# echo "Explores self-sustaining dynamics with minimal external input."
# python wilson_cowan_extended.py \
#     -wee 15.0 -wei 18.0 -wie 12.0 -wii 8.0 \
#     -wew 10.0 -wiw 8.0 -www 7.0 \
#     -wiw 5.0 -wwi 5.0 \
#     -ie1 0.01 -ie2 0.05 \
#     -ii1 0.005 -ii2 0.02 \
#     -iw1 0.002 -iw2 0.01 \
#     -w 0.1 -tstop 200

# echo "### Test Case 12: Rapid Frequency Modulation"
# echo "Investigates neural response to very high-frequency inputs."
# python wilson_cowan_extended.py \
#     -wee 9.0 -wei 11.0 -wie 7.0 -wii 4.0 \
#     -wew 5.0 -wiw 4.0 -www 3.0 \
#     -wiw 2.0 -wwi 2.0 \
#     -ie1 0.1 -ie2 0.5 \
#     -ii1 0.1 -ii2 0.3 \
#     -iw1 0.05 -iw2 0.2 \
#     -w 3.0 -tstop 200

# echo "### Test Case 13: Minimal Interaction, Maximum Noise"
# echo "Explores system behavior under minimal coupling but high input variability."
# python wilson_cowan_extended.py \
#     -wee 6.0 -wei 7.0 -wie 5.0 -wii 2.0 \
#     -wew 1.0 -wiw 1.0 -www 1.0 \
#     -wiw 0.5 -wwi 0.5 \
#     -ie1 0.05 -ie2 1.5 \
#     -ii1 0.03 -ii2 1.0 \
#     -iw1 0.02 -iw2 0.8 \
#     -w 0.5 -tstop 200

# # echo "### Test Case 14: Deep Inhibitory Suppression"
# echo "Investigates neural dynamics under strong inhibitory suppression."
# python wilson_cowan_extended.py \
#     -wee 8.0 -wei 10.0 -wie 4.0 -wii 15.0 \
#     -wew 3.0 -wiw 2.0 -www 2.0 \
#     -wiw 6.0 -wwi 3.0 \
#     -ie1 0.2 -ie2 0.4 \
#     -ii1 0.1 -ii2 0.2 \
#     -iw1 0.05 -iw2 0.1 \
#     -w 0.25 -tstop 200

# # echo "### Test Case 15: Balanced Critical State"
# # echo "Explores a balanced state at the edge of criticality, potentially revealing emergent behavior."
# # python wilson_cowan_extended.py \
# #     -wee 10.0 -wei 12.0 -wie 10.0 -wii 10.0 \
# #     -wew 6.0 -wiw 6.0 -www 6.0 \
# #     -wiw 3.0 -wwi 3.0 \
# #     -ie1 0.15 -ie2 0.4 \
# #     -ii1 0.1 -ii2 0.3 \
# #     -iw1 0.08 -iw2 0.2 \
# #     -w 0.4 -tstop 200


# # echo "All test cases executed."
