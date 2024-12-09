# only external input, no inhibition
python wilson_cowan_extended.py \
    -wee -8.0 -wei 1.6 -wie 8.0 -wii -3.0 \
    -wew 5.0 -www -3.0 \
    -wwi 2.2 \
    -ie1 0.1 -ie2 0.5 \
    -ii1 0.1 -ii2 0.3 \
    -iw1 0.05 -iw2 0.2 \
    -ze 0.2 -zi 0.2 -zw 0.1 \
    -uu0 1 -vv0 0.0 -ww0 0.0 \
    -tau 5 \
    -w 0.25 -tstop 5000

# python wilson_cowan_extended.py \
#     -wee -8.0 -wei 1.6 -wie 8.0 -wii -3.0 \
#     -wew 5.0 -wiw 4.0 -www -3.0 \
#     -ie1 0.1 -ie2 0.5 \
#     -ii1 0.1 -ii2 0.3 \
#     -iw1 0.05 -iw2 0.2 \
#     -ze 0.2 -zi 0.2 -zw 0.1 \
#     -uu0 1 -vv0 0.0 -ww0 0.0 \
#     -tau 5 \
#     -w 0.25 -tstop 200

# # tinnitus and external input, no inhibition
# python wilson_cowan_extended.py \
#     -wee -8.0 -wei 1.6 -wie 8.0 -wii -3.0 \
#     -wew 5.0 -www -3.0 \
#     -wiw 2.0 -wwi 2.2 \
#     -ie1 0.1 -ie2 0.5 \
#     -ii1 0.1 -ii2 0.3 \
#     -iw1 0.05 -iw2 0.2 \
#     -ze 0.2 -zi 0.2 -zw 0.1 \
#     -uu0 1 -vv0 0.0 -ww0 1.0 \
#     -tau 5 \
#     -w 0.25 -tstop 200

# # all same
# python wilson_cowan_extended.py \
#     -wee -8.0 -wei 1.6 -wie 8.0 -wii -3.0 \
#     -wew 5.0 -wiw 4.0 -www -3.0 \
#     -wiw 2.0 -wwi 2.2 \
#     -ie1 0.1 -ie2 0.5 \
#     -ii1 0.1 -ii2 0.3 \
#     -iw1 0.05 -iw2 0.2 \
#     -ze 0.2 -zi 0.2 -zw 0.1 \
#     -uu0 0.5 -vv0 0.5 -ww0 0.5 \
#     -tau 5 \
#     -w 0.25 -tstop 200

# python wilson_cowan_extended.py \
#     -wee -8.0 -wei 1.6 -wie 8.0 -wii -3.0 \
#     -wew 5.0 -wiw 4.0 -www -3.0 \
#     -wiw 2.0 -wwi 2.2 \
#     -ie1 0.1 -ie2 0.5 \
#     -ii1 0.1 -ii2 0.3 \
#     -iw1 0.05 -iw2 0.2 \
#     -ze 0.2 -zi 0.2 -zw 0.1 \
#     -uu0 0.5 -vv0 0.5 -ww0 0.1 \
#     -tau 5 \
#     -w 0.25 -tstop 200

# # hihg noise with inhibition

# python wilson_cowan_extended.py \
#     -wee -8.0 -wei 1.6 -wie 8.0 -wii -3.0 \
#     -wew 5.0 -wiw 4.0 -www -3.0 \
#     -wiw 2.0 -wwi 2.2 \
#     -ie1 0.1 -ie2 0.5 \
#     -ii1 0.1 -ii2 0.3 \
#     -iw1 0.05 -iw2 0.2 \
#     -ze 0.2 -zi 0.2 -zw 0.1 \
#     -uu0 1 -vv0 0.5 -ww0 0.0 \
#     -tau 5 \
#     -w 0.25 -tstop 200

# python wilson_cowan_extended.py \
#     -wee -8.0 -wei 1.6 -wie 8.0 -wii -3.0 \
#     -wew 5.0 -wiw 4.0 -www -3.0 \
#     -wiw 2.0 -wwi 2.2 \
#     -ie1 0.1 -ie2 0.5 \
#     -ii1 0.1 -ii2 0.3 \
#     -iw1 0.05 -iw2 0.2 \
#     -ze 0.2 -zi 0.2 -zw 0.1 \
#     -uu0 0.0 -vv0 0.0 -ww0 0.0 \
#     -tau 5 \
#     -w 0.25 -tstop 200

# python wilson_cowan_extended.py \
#     -wee -8.0 -wei 1.6 -wie 8.0 -wii -3.0 \
#     -wew 5.0 -wiw 4.0 -www -3.0 \
#     -wiw 2.0 -wwi 2.2 \
#     -ie1 0.1 -ie2 0.5 \
#     -ii1 0.1 -ii2 0.3 \
#     -iw1 0.05 -iw2 0.2 \
#     -ze 0.2 -zi 0.2 -zw 0.1 \
#     -uu0 0.4 -vv0 0.4 -ww0 0.4 \
#     -tau 10 \
#     -w 0.25 -tstop 200


# python wilson_cowan_extended.py \
#     -wee -8.0 -wei 1.6 -wie 8.0 -wii -3.0 \
#     -wew 5.0 -wiw 4.0 -www -3.0 \
#     -wiw 2.0 -wwi 2.2 \
#     -ie1 0.1 -ie2 0.5 \
#     -ii1 0.1 -ii2 0.3 \
#     -iw1 0.05 -iw2 0.2 \
#     -ze 0.2 -zi 0.2 -zw 0.1 \
#     -uu0 0.4 -vv0 1.0 -ww0 0.0 \
#     -tau 10 \
#     -w 0.25 -tstop 200

# python wilson_cowan_extended.py \
#     -wee -8.0 -wei 1.6 -wie 8.0 -wii -3.0 \
#     -wew 5.0 -wiw 4.0 -www -3.0 \
#     -wiw 2.0 -wwi 2.2 \
#     -ie1 0.1 -ie2 0.5 \
#     -ii1 0.1 -ii2 0.3 \
#     -iw1 0.05 -iw2 0.2 \
#     -ze 0.2 -zi 0.2 -zw 0.1 \
#     -uu0 0.4 -vv0 0.0 -ww0 1.0 \
#     -tau 10 \
#     -w 0.25 -tstop 200
