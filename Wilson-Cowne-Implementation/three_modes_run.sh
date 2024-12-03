# #!/bin/bash
# set -ex

# # No Drive

# echo "No-drive case"
# python wilson_cowan_extended.py -wee 10. -wei 12. -wie 8. -wii 3. -ze 0.2 -zi 4. -wew 5. -wiw 4. -ie1 0 -ii1 0 -ie2 0 -ii2 0

# echo "Exploring coupling"
# python wilson_cowan_extended.py -wee 20. -wei 21. -wie 16. -wii 6 -wew 10. -wiw 8. -ze 1.6 -zi 7. -zw 3. -ie1 0.5 -ii1 0.3 -ie2 0.2 -ii2 0.1

# echo "Increasing coupling"
# python wilson_cowan_extended.py -wee 15. -wei 18. -wie 12. -wii 5. -wew 7. -wiw 6. -ze 2. -zi 5. -zw 2.5 -ie1 1. -ii1 0.8 -ie2 0.6 -ii2 0.4


#!/bin/bash

# Ensure the Python script is executable
# chmod +x wilson_cowan_extended.py

# Test Case 1: Limit Cycle Dynamics
echo "Test Case 1: Limit Cycle Dynamics"
python wilson_cowan_extended.py \
    -asymmetry 0 \
    -ie1 0.5 \
    -ii1 0.4 \
    -wee 12 \
    -wei 10 \
    -wie 8 \
    -wii 3 \
    -w 0.5 \
    -tstop 200 \
    -ze 0.2 \
    -zi 0.3 \
    -zw 0.1
    
# # Visualize the results
# python -c "
# import numpy as np
# import matplotlib.pyplot as plt

# data = np.loadtxt('InterdependentNetwork.dat')
# plt.figure(figsize=(15,5))

# plt.subplot(131)
# plt.title('Limit Cycle: E Mode')
# plt.plot(data[:,0], data[:,1])
# plt.xlabel('Time')
# plt.ylabel('Firing Rate')

# plt.subplot(132)
# plt.title('Limit Cycle: I Mode')
# plt.plot(data[:,0], data[:,2])
# plt.xlabel('Time')
# plt.ylabel('Firing Rate')

# plt.subplot(133)
# plt.title('Phase Space')
# plt.plot(data[:,1], data[:,2])
# plt.xlabel('E Mode')
# plt.ylabel('I Mode')

# plt.tight_layout()
# plt.savefig('limit_cycle.png')
# "

# # Test Case 2: Saddle Point Convergence
# echo "Test Case 2: Saddle Point Convergence"
# python wilson_cowan_extended.py \
#     -asymmetry 0 \
#     -ie1 0.1 \
#     -ii1 0.1 \
#     -wee 5 \
#     -wei 4 \
#     -wie 3 \
#     -wii 2 \
#     -w 0.1 \
#     -tstop 100 \
#     -ze 0.5 \
#     -zi 0.4 \
#     -zw 0.3

python wilson_cowan_extended.py -asymmetry 0 -ie1 0.1 -ii1 0.1 -wee 5 -wei 4 -wie 3 -wii 2 -w 0.1 -tstop 100 -ze 0.5 -zi 0.4 -zw 0.3

# # Visualize saddle point convergence
# python -c "
# import numpy as np
# import matplotlib.pyplot as plt

# data = np.loadtxt('InterdependentNetwork.dat')
# plt.figure(figsize=(15,5))

# plt.subplot(131)
# plt.title('Saddle Point: E Mode')
# plt.plot(data[:,0], data[:,1])
# plt.xlabel('Time')
# plt.ylabel('Firing Rate')

# plt.subplot(132)
# plt.title('Saddle Point: I Mode')
# plt.plot(data[:,0], data[:,2])
# plt.xlabel('Time')
# plt.ylabel('Firing Rate')

# plt.subplot(133)
# plt.title('Phase Space Convergence')
# plt.plot(data[:,1], data[:,2])
# plt.xlabel('E Mode')
# plt.ylabel('I Mode')

# plt.tight_layout()
# plt.savefig('saddle_point.png')
# "

# Test Case 3: Stable Heteroclinic Channel
echo "Test Case 3: Stable Heteroclinic Channel"
python wilson_cowan_extended.py \
    -asymmetry 0 \
    -ie1 0.3 \
    -ii1 0.2 \
    -wee 8 \
    -wei 7 \
    -wie 6 \
    -wii 4 \
    -w 0.3 \
    -tstop 300 \
    -ze 0.3 \
    -zi 0.2 \
    -zw 0.1

# # Visualize heteroclinic channel
# python -c "
# import numpy as np
# import matplotlib.pyplot as plt

# data = np.loadtxt('InterdependentNetwork.dat')
# plt.figure(figsize=(15,5))

# plt.subplot(131)
# plt.title('Heteroclinic Channel: E Mode')
# plt.plot(data[:,0], data[:,1])
# plt.xlabel('Time')
# plt.ylabel('Firing Rate')

# plt.subplot(132)
# plt.title('Heteroclinic Channel: I Mode')
# plt.plot(data[:,0], data[:,2])
# plt.xlabel('Time')
# plt.ylabel('Firing Rate')

# plt.subplot(133)
# plt.title('Phase Space Trajectory')
# plt.plot(data[:,1], data[:,2])
# plt.xlabel('E Mode')
# plt.ylabel('I Mode')

# plt.tight_layout()
# plt.savefig('heteroclinic_channel.png')
# "

echo "Test cases completed. Check limit_cycle.png, saddle_point.png, and heteroclinic_channel.png for visualizations."
