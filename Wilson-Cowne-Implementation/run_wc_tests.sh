# echo "Running Test Case 6: Suppressed self-feedback and excitatory non-self connections with population-specific noise."
# python wilson_cowan_extended.py \
#     -wee -3.0 -wei 5.0 -wie 6.0 -wii -2.5 \
#     -wew 2.0 -wiw -1.0 -www -0.5 \
#     -wiv 1.5 -wvi 2.0 \
#     -ie1 0.8 -ie2 0.9 \
#     -ii1 0.6 -ii2 0.7 \
#     -iw1 0.4 -iw2 0.5 \
#     -ze 0.2 -zi 0.4 -zw 0.3 \
#     -w 0.6 -tstop 300

# echo "Running Test Case 7: Balanced external coupling with suppressive self-feedback and varied noise levels."
# python wilson_cowan_extended.py \
#     -wee -2.0 -wei 4.0 -wie 4.5 -wii -1.5 \
#     -wew 1.0 -wiw -0.8 -www -1.2 \
#     -wiv 2.5 -wvi 2.5 \
#     -ie1 1.0 -ie2 1.2 \
#     -ii1 0.3 -ii2 0.4 \
#     -iw1 0.7 -iw2 0.8 \
#     -ze 0.3 -zi 0.2 -zw 0.4 \
#     -w 0.7 -tstop 200

# echo "Running Test Case 8: Strong external excitations with minimal self-suppression and moderate noise."
# python wilson_cowan_extended.py \
#     -wee -1.0 -wei 6.0 -wie 7.0 -wii -0.5 \
#     -wew 3.5 -wiw -0.5 -www -0.2 \
#     -wiv 3.0 -wvi 3.0 \
#     -ie1 1.5 -ie2 1.7 \
#     -ii1 0.5 -ii2 0.6 \
#     -iw1 0.9 -iw2 1.0 \
#     -ze 0.2 -zi 0.6 -zw 0.3 \
#     -w 0.8 -tstop 250

# echo "Running Test Case 9: Oscillatory dynamics with suppressed self-feedback and distinct noise levels."
# python wilson_cowan_extended.py \
#     -wee -2.0 -wei 5.5 -wie 6.5 -wii -1.2 \
#     -wew 2.2 -wiw -0.6 -www -0.3 \
#     -wiv 4.0 -wvi 4.0 \
#     -ie1 2.0 -ie2 2.5 \
#     -ii1 1.5 -ii2 1.7 \
#     -iw1 0.8 -iw2 0.9 \
#     -ze 0.4 -zi 0.5 -zw 0.6 \
#     -w 0.5 -tstop 400

# echo "Running Test Case 10: Long-term decay with suppressed self-feedback and sinusoidal inputs."
# python wilson_cowan_extended.py \
#     -wee -3.0 -wei 7.0 -wie 7.0 -wii -2.0 \
#     -wew 5.0 -wiw -1.0 -www -0.8 \
#     -wiv 3.0 -wvi 3.0 \
#     -ie1 1.8 -ie2 2.2 \
#     -ii1 0.4 -ii2 0.5 \
#     -iw1 0.6 -iw2 0.7 \
#     -ze 0.1 -zi 0.2 -zw 0.3 \
#     -w 0.9 -tstop 300

# echo "Running Test Case 11: Likely heteroclinic oscillations driven by noise and imbalanced weights."
# python wilson_cowan_extended.py \
#     -wee -1.0 -wei 8.0 -wie 6.5 -wii 0.5 \
#     -wew 4.0 -wiw -0.2 -www -1.0 \
#     -wiv 5.0 -wvi 5.5 \
#     -ie1 0.5 -ie2 2.0 \
#     -ii1 0.3 -ii2 1.0 \
#     -iw1 0.1 -iw2 0.7 \
#     -ze 1.0 -zi 1.5 -zw 0.8 \
#     -w 1.2 -tstop 20

# echo "Running Test Case 11: Likely heteroclinic oscillations driven by noise and imbalanced weights."
# python wilson_cowan_extended.py \
#     -wee -1.0 -wei 8.0 -wie 6.5 -wii 0.5 \
#     -wew 4.0 -wiw -0.2 -www -1.0 \
#     -wiv 5.0 -wvi 5.5 \
#     -ie1 0.5 -ie2 2.0 \
#     -ii1 0.3 -ii2 1.0 \
#     -iw1 0.1 -iw2 0.7 \
#     -ze 1.0 -zi 1.5 -zw 0.8 \
#     -w 1.2 -tstop 20

# echo "Running Test Case 12: Stable heteroclinic cycle with tuned weights and minimal noise."
# python wilson_cowan_extended.py \
#     -wee -1.0 -wei 7.0 -wie 7.0 -wii 1.0 \
#     -wew 3.5 -wiw -0.8 -www -0.5 \
#     -wiv 4.0 -wvi 4.0 \
#     -ie1 1.0 -ie2 1.5 \
#     -ii1 0.6 -ii2 0.7 \
#     -iw1 0.5 -iw2 0.6 \
#     -ze 0.1 -zi 0.2 -zw 0.15 \
#     -w 0.8 -tstop 600

# echo "Running Test Case 13: Unstable heteroclinic dynamics due to strong external oscillations."
# python wilson_cowan_extended.py \
#     -wee -0.8 -wei 9.0 -wie 6.0 -wii -0.3 \
#     -wew 5.0 -wiw -0.5 -www -0.2 \
#     -wiv 3.5 -wvi 3.5 \
#     -ie1 2.0 -ie2 2.5 \
#     -ii1 1.0 -ii2 1.2 \
#     -iw1 1.2 -iw2 1.5 \
#     -ze 0.3 -zi 0.4 -zw 0.5 \
#     -w 0.5 -tstop 400

# echo "Running Test Case 14: Stable heteroclinic transitions with dampened cross-coupling."
# python wilson_cowan_extended.py \
#     -wee -2.0 -wei 5.0 -wie 5.5 -wii -1.5 \
#     -wew 2.0 -wiw -0.8 -www -0.3 \
#     -wiv 3.0 -wvi 3.0 \
#     -ie1 0.8 -ie2 1.2 \
#     -ii1 0.5 -ii2 0.7 \
#     -iw1 0.4 -iw2 0.6 \
#     -ze 0.15 -zi 0.1 -zw 0.2 \
#     -w 0.6 -tstop 500

# echo "Running Test Case 15: Heteroclinic dynamics dominated by strong excitatory pathways."
# python wilson_cowan_extended.py \
#     -wee -0.5 -wei 10.0 -wie 8.0 -wii -0.2 \
#     -wew 6.0 -wiw -0.4 -www -0.1 \
#     -wiv 5.5 -wvi 5.5 \
#     -ie1 2.5 -ie2 3.0 \
#     -ii1 1.2 -ii2 1.5 \
#     -iw1 0.9 -iw2 1.1 \
#     -ze 0.5 -zi 0.7 -zw 0.6 \
#     -w 1.0 -tstop 300

echo "Running Test Case 16: Constant input, high noise, and balanced activity levels."
python wilson_cowan_extended.py \
    -wee -1.0 -wei 5.0 -wie 5.0 -wii 1.0 \
    -wew 2.5 -wiw -1.0 -www 0.5 \
    -wiv 3.0 -wvi 3.0 \
    -ie1 1.0 -ie2 0.0 \
    -ii1 1.0 -ii2 0.0 \
    -iw1 1.0 -iw2 0.0 \
    -ze 3.0 -zi 3.0 -zw 3.0 \
    -w 1.0 -tstop 50

echo "Running Test Case 17: Symmetric coupling with large noise for chaotic heteroclinic transitions."
python wilson_cowan_extended.py \
    -wee -0.8 -wei 6.0 -wie 6.0 -wii 0.8 \
    -wew 3.0 -wiw -1.2 -www 0.6 \
    -wiv 4.0 -wvi 4.0 \
    -ie1 2.0 -ie2 0.0 \
    -ii1 2.0 -ii2 0.0 \
    -iw1 2.0 -iw2 0.0 \
    -ze 4.0 -zi 4.0 -zw 4.0 \
    -w 0.5 -tstop 50

echo "Running Test Case 18: Balanced weights with differentiated noise for smoothing activity."
python wilson_cowan_extended.py \
    -wee -1.2 -wei 5.5 -wie 5.5 -wii 1.2 \
    -wew 2.8 -wiw -1.0 -www 0.4 \
    -wiv 3.5 -wvi 3.5 \
    -ie1 1.5 -ie2 0.0 \
    -ii1 1.5 -ii2 0.0 \
    -iw1 1.5 -iw2 0.0 \
    -ze 2.5 -zi 3.0 -zw 2.7 \
    -w 0.7 -tstop 50


echo "Running Test Case 19: Strong excitation and high noise for dynamic, balanced heteroclinic solutions."
python wilson_cowan_extended.py \
    -wee -0.5 -wei 7.0 -wie 7.0 -wii 0.5 \
    -wew 3.5 -wiw -1.0 -www 0.2 \
    -wiv 4.5 -wvi 4.5 \
    -ie1 2.5 -ie2 0.0 \
    -ii1 2.5 -ii2 0.0 \
    -iw1 2.5 -iw2 0.0 \
    -ze 5.0 -zi 5.0 -zw 5.0 \
    -w 0.9 -tstop 50

