#!/bin/bash
set -ex

# No Drive

echo "No-drive case"
python wilson_cowan_extended.py -wee 10. -wei 12. -wie 8. -wii 3. -ze 0.2 -zi 4. -wew 5. -wiw 4. -ie1 0 -ii1 0 -ie2 0 -ii2 0

echo "Exploring coupling"
python wilson_cowan_extended.py -wee 20. -wei 21. -wie 16. -wii 6 -wew 10. -wiw 8. -ze 1.6 -zi 7. -zw 3. -ie1 0.5 -ii1 0.3 -ie2 0.2 -ii2 0.1

echo "Increasing coupling"
python wilson_cowan_extended.py -wee 15. -wei 18. -wie 12. -wii 5. -wew 7. -wiw 6. -ze 2. -zi 5. -zw 2.5 -ie1 1. -ii1 0.8 -ie2 0.6 -ii2 0.4

