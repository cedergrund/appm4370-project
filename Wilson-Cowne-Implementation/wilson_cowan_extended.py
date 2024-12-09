import math
import sys
import numpy as np
import matplotlib.pylab as plt
import argparse


def sigmoid_function(x):
    return 1 / (1 + math.exp(-x))


def calculate_firing_rate(
    ie1,  # Initial input to excitatory population
    ie2,  # Amplitude of sinusoidal input to excitatory population
    ii1,  # Initial input to inhibitory population
    ii2,  # Amplitude of sinusoidal input to inhibitory population
    iw1,  # Initial input to Wilson-Cowan population
    iw2,  # Amplitude of sinusoidal input to Wilson-Cowan population
    w,  # Frequency of sinusoidal input
    t,  # Current time
    dt,  # Time step
    uu,  # Excitatory population firing rate
    vv,  # Inhibitory population firing rate
    ww,  # Wilson-Cowan population firing rate
    wee,  # Excitatory to excitatory connection weight
    wei,  # Excitatory to inhibitory connection weight
    wew,  # Excitatory to Wilson-Cowan connection weight
    wii,  # Inhibitory to inhibitory connection weight
    wie,  # Inhibitory to excitatory connection weight
    wiw,  # Inhibitory to Wilson-Cowan connection weight
    www,  # Wilson-Cowan to Wilson-Cowan connection weight
    wwe,  # Wilson-Cowan to excitatory interaction weight
    wwi,  # Wilson-Cowan to inhibitory interaction weight
    ze,  # Threshold for excitatory population
    zi,  # Threshold for inhibitory population
    zw,  # Threshold for Wilson-Cowan population
    tau=1.0,  # Time constant (default value)
):
    np_random = np.random.default_rng()
    noise_prob = 0.0005

    if np_random.random() < noise_prob:
        temp = ze
    else:
        temp = 0

    i_e = ie1 + ie2 * math.sin(w * t)
    i_i = ii1 + ii2 * math.sin(w * t)
    i_w = iw1 + iw2 * math.sin(w * t)

    dE = dt * (-uu + sigmoid_function(-(wee * uu) - (wie * vv) + i_e)) / tau

    dI = (
        dt
        * (-vv + sigmoid_function(-(wei * uu) - (wii * vv) - (wwi * ww) + zi + i_i))
        / tau
    )

    dW = (
        dt
        * (-ww + sigmoid_function(-(wew * uu) - (wiw * vv) - (www * ww) + zw + i_w))
        / tau
    )
    # Update population firing rates
    uu_p = uu + dE
    vv_p = vv + dI
    if ww + dW + temp > 1:
        ww_p = 1
    else:
        ww_p = ww + dW + temp

    return uu_p, vv_p, ww_p


# Argument Parser
parser = argparse.ArgumentParser(
    description="Extended Parameters for Wilson and Cowan Simulation"
)

# Connection Weights
parser.add_argument("-wee", type=float, default=10.0, help="Weight")
parser.add_argument("-wie", type=float, default=12.0, help="Weight")
parser.add_argument("-wwe", type=float, default=5.0, help="Weight")
parser.add_argument("-wii", type=float, default=8.0, help="Weight")
parser.add_argument("-wei", type=float, default=3.0, help="Weight")
parser.add_argument("-wwi", type=float, default=4.0, help="Weight")
parser.add_argument("-www", type=float, default=3.0, help="Weight")
parser.add_argument("-wew", type=float, default=2.0, help="Weight")
parser.add_argument("-wiw", type=float, default=2.0, help="Weight")

# Noise
parser.add_argument("-ze", type=float, default=0.2, help="E noise")
parser.add_argument("-zi", type=float, default=4.0, help="I noise")
parser.add_argument("-zw", type=float, default=2.0, help="W noise")

# Initial Condition
parser.add_argument("-uu0", type=float, default=0.4, help="E init")
parser.add_argument("-vv0", type=float, default=0.4, help="I init")
parser.add_argument("-ww0", type=float, default=0.4, help="W init")

# Input Currents
parser.add_argument("-ie1", type=float, default=0, help="E Initial Current")
parser.add_argument("-ie2", type=float, default=0.5, help="E Current Amplitude")
parser.add_argument("-ii1", type=float, default=0, help="I Initial Current")
parser.add_argument("-ii2", type=float, default=0.3, help="I Current Amplitude")
parser.add_argument("-iw1", type=float, default=0, help="W Initial Current")
parser.add_argument("-iw2", type=float, default=0.2, help="W Current Amplitude")

# Simulation Parameters
parser.add_argument("-w", type=float, default=0.25, help="Phase/Frequency")
parser.add_argument("-tstop", type=float, default=100, help="Simulation Duration")
parser.add_argument("-dt", type=float, default=0.005, help="Time Step")
parser.add_argument("-tau", type=float, default=1.0, help="Time Constant")

args = parser.parse_args()

# Simulation Setup
times = np.arange(0, args.tstop, args.dt)
uu_p = np.zeros((len(times), 1))
vv_p = np.zeros((len(times), 1))
ww_p = np.zeros((len(times), 1))

# Initial Conditions
uu0 = args.uu0
vv0 = args.vv0
ww0 = args.ww0

# Open output file
with open("wilson_cowan_simulation.dat", "w") as data_file:
    for t_idx, t in enumerate(times):
        if t_idx == 0:
            uu_p[t_idx], vv_p[t_idx], ww_p[t_idx] = calculate_firing_rate(
                args.ie1,
                args.ie2,
                args.ii1,
                args.ii2,
                args.iw1,
                args.iw2,
                args.w,
                t,
                args.dt,
                uu0,
                vv0,
                ww0,
                args.wee,
                args.wei,
                args.wew,
                args.wii,
                args.wie,
                args.wiw,
                args.www,
                args.wwe,
                args.wwi,
                args.ze,
                args.zi,
                args.zw,
                args.tau,
            )
        else:
            uu_p[t_idx], vv_p[t_idx], ww_p[t_idx] = calculate_firing_rate(
                args.ie1,
                args.ie2,
                args.ii1,
                args.ii2,
                args.iw1,
                args.iw2,
                args.w,
                t,
                args.dt,
                uu_p[t_idx - 1],
                vv_p[t_idx - 1],
                ww_p[t_idx - 1],
                args.wee,
                args.wei,
                args.wew,
                args.wii,
                args.wie,
                args.wiw,
                args.www,
                args.wwe,
                args.wwi,
                args.ze,
                args.zi,
                args.zw,
                args.tau,
            )

        # Write to file
        data_file.write(f"{t}\t{uu_p[t_idx][0]}\t{vv_p[t_idx][0]}\t{ww_p[t_idx][0]}\n")

data_file.close()

print(
    "Finished running extended simulation of %sms, saved data to %s"
    % (args.tstop, data_file)
)

plt.figure(figsize=(12, 5))
plt.plot(times, uu_p, label="External Input", color="red", linewidth=1)
plt.plot(times, vv_p, label="Inhibition", color="blue", linewidth=1)
plt.plot(times, ww_p, label="Tinnitus", color="green", linewidth=1)
plt.xlabel("Time")
plt.ylabel("Activity Level")
plt.legend()

# pop_step = 0.02
# pop_stop = 1
# population = np.arange(pop_step, pop_stop, pop_step)

# # 3D nullclines (planes where derivatives are zero)
# I = np.zeros((len(population), len(population)))
# E = np.zeros((len(population), len(population)))
# W = np.zeros((len(population), len(population)))

# for e_idx, e in enumerate(population):
#     for w_idx, w in enumerate(population):
#         # dI/dt = 0 equation
#         I[e_idx, w_idx] = (
#             1 / args.wie * (math.log(1 / e - 1) - args.ze + args.wee * e - args.wew * w)
#         )

# for i_idx, i in enumerate(population):
#     for w_idx, w in enumerate(population):
#         # dE/dt = 0 equation
#         E[i_idx, w_idx] = (
#             -1
#             / args.wei
#             * (math.log(1 / i - 1) - args.zi - args.wii * i - args.wew * w)
#         )

# fig = plt.figure(figsize=(8, 7))
# ax = fig.add_subplot(111, projection="3d")
# ax.plot3D(vv_p, uu_p, ww_p, label="Activity trajectory", color="b", linewidth=0.8)
# ax.plot_surface(
#     np.meshgrid(population, population)[1],
#     np.meshgrid(population, population)[0],
#     I,
#     alpha=0.5,
#     color="blue",
# )
# ax.plot_surface(
#     np.meshgrid(population, population)[1],
#     np.meshgrid(population, population)[0],
#     E,
#     alpha=0.5,
#     color="red",
# )

# # Create grid of initial conditions
# num_points = 20
# E = np.linspace(0, 1, num_points)
# I = np.linspace(0, 1, num_points)
# W = np.linspace(0, 1, num_points)

# # Prepare 3D plot

# # Iterate through initial conditions
# for e in E[::4]:
#     for i in I[::4]:
#         for w in W[::4]:
#             trajectory = []
#             current_e, current_i, current_w = e, i, w

#             # Simulate for a few steps
#             for t in range(20):
#                 trajectory.append((current_e, current_i, current_w))
#                 current_e, current_i, current_w = calculate_firing_rate(
#                     args.ie1,
#                     args.ie2,
#                     args.ii1,
#                     args.ii2,
#                     args.iw1,
#                     args.iw2,
#                     args.w,
#                     t,
#                     args.dt,
#                     current_e,
#                     current_i,
#                     current_w,
#                     args.wee,
#                     args.wei,
#                     args.wie,
#                     args.wii,
#                     args.wew,
#                     args.wiw,
#                     args.www,
#                     args.wiv,
#                     args.wvi,
#                     args.ze,
#                     args.zi,
#                     args.zw,
#                     args.tau,
#                 )

#             # Unpack trajectory
#             traj_i, traj_e, traj_w = zip(*trajectory)

#             # Plot full trajectory
#             ax.plot3D(traj_i, traj_e, traj_w, color="blue", alpha=0.5, linewidth=0.5)
#             # Plot initial point
#             ax.scatter3D(traj_e[0], traj_i[0], traj_w[0], color="red", s=10)

# ax.set_xlabel("$A_1$")
# ax.set_ylabel("$A_2$")
# ax.set_zlabel("$A_3$")
# ax.set_title("3D Phase Space Trajectories")

# plt.tight_layout()
plt.show()
