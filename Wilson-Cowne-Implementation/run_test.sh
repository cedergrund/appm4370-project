#!/bin/bash

# Function to run a test case and echo its label
run_test() {
    echo "Running test: $1"
    python wilson_cowan_3mode.py $2
    echo "Finished test: $1"
}

# Test cases

run_test "Stable Heteroclinic Channel with Transient Solutions (due to Noise)" \
    "-weights 10 15 0 0 10 6 5 0 10 -w 0.25 -ie1 0.5 -ii1 0.3 -iz1 0.2 -tstop 200"

# run_test "Oscillatory Solution (Limit Cycle)" \
#     "-weights 12 12 12 12 12 12 12 12 12 -w 0.5 -ie1 1 -ii1 1 -iz1 1 -tstop 200"

# # 1. Baseline case: Moderate weights and zero current
# run_test "Baseline Case: Moderate weights, zero current" \
#     "-weights 10 12 5 8 3 7 6 9 4 -w 0.25 -ie1 0 -ii1 0 -iz1 0 -tstop 100"

# # 2. High noise: Large oscillatory input currents
# run_test "High Noise: Large oscillatory currents" \
#     "-weights 10 12 5 8 3 7 6 9 4 -w 0.25 -ie1 5 -ii1 5 -iz1 5 -tstop 100"

# # 3. Low noise: Small oscillatory input currents
# run_test "Low Noise: Small oscillatory currents" \
#     "-weights 10 12 5 8 3 7 6 9 4 -w 0.25 -ie1 0.1 -ii1 0.1 -iz1 0.1 -tstop 100"

# # 4. High uniform weights: Strong connections in all directions
# run_test "High Uniform Weights" \
#     "-weights 20 20 20 20 20 20 20 20 20 -w 0.25 -ie1 1 -ii1 1 -iz1 1 -tstop 100"

# # 5. Low uniform weights: Weak connections in all directions
# run_test "Low Uniform Weights" \
#     "-weights 1 1 1 1 1 1 1 1 1 -w 0.25 -ie1 1 -ii1 1 -iz1 1 -tstop 100"

# # 6. One-sided weight matrix: Connections mostly from excitatory to inhibitory
# run_test "One-Sided Weights: E to I dominant" \
#     "-weights 15 0 0 10 5 0 0 0 1 -w 0.25 -ie1 1 -ii1 1 -iz1 1 -tstop 100"

# # 7. Very high currents: Test system saturation
# run_test "Very High Currents" \
#     "-weights 10 12 5 8 3 7 6 9 4 -w 0.25 -ie1 10 -ii1 10 -iz1 10 -tstop 100"

# # 8. Very low currents: Near-zero inputs
# run_test "Very Low Currents" \
#     "-weights 10 12 5 8 3 7 6 9 4 -w 0.25 -ie1 0.01 -ii1 0.01 -iz1 0.01 -tstop 100"

# # 9. High phase frequency: Rapid oscillatory inputs
# run_test "High Phase Frequency" \
#     "-weights 10 12 5 8 3 7 6 9 4 -w 5.0 -ie1 1 -ii1 1 -iz1 1 -tstop 100"

# # 10. Low phase frequency: Slow oscillatory inputs
# run_test "Low Phase Frequency" \
#     "-weights 10 12 5 8 3 7 6 9 4 -w 0.01 -ie1 1 -ii1 1 -iz1 1 -tstop 100"

# # 11. Mixed extreme weights: Excitatory dominance
# run_test "Extreme Weights: Excitatory Dominance" \
#     "-weights 50 0 0 0 1 0 0 0 0.1 -w 0.25 -ie1 1 -ii1 1 -iz1 1 -tstop 100"

# # 12. Mixed extreme weights: Inhibitory dominance
# run_test "Extreme Weights: Inhibitory Dominance" \
#     "-weights 0.1 0 0 0 50 0 0 0 10 -w 0.25 -ie1 1 -ii1 1 -iz1 1 -tstop 100"

# # 13. Large simulation time: Observe long-term behavior
# run_test "Long-Term Simulation" \
#     "-weights 10 12 5 8 3 7 6 9 4 -w 0.25 -ie1 1 -ii1 1 -iz1 1 -tstop 1000"

# # 14. Small simulation time: Short-term dynamics
# run_test "Short-Term Simulation" \
#     "-weights 10 12 5 8 3 7 6 9 4 -w 0.25 -ie1 1 -ii1 1 -iz1 1 -tstop 10"
    

echo "All tests completed."
