import math
import sys
import numpy as np
import matplotlib.pylab as plt
import argparse


def sigmoid_function(x):
    return 1 / (1 + math.exp(-x))


def calculate_firing_rate(
    ie0,
    ie1,
    ii0,
    ii1,
    w,
    t,
    dt,
    uu,
    vv,
    ww,
    wee,
    wei,
    wie,
    wii,
    wew,
    wiw,
    ze,
    zi,
    zw,
    ie2,
    ii2,
):
    i_e = ie0 + ie1 * math.sin(w * t)
    i_i = ii0 + ii1 * math.sin(w * t)
    i_w = ie2 + ii2 * math.sin(w * t)

    dE = (
        dt
        * (-uu + sigmoid_function((wee * uu) - (wie * vv) - (wew * ww) - ze + i_e))
        / tau
    )
    dI = dt * (-vv + sigmoid_function((wei * uu) - (wii * vv) - zi + i_i)) / tau
    dW = dt * (-ww + sigmoid_function((wew * uu) - (wiw * ww) - zw + i_w)) / tau

    uu_p = uu + dE
    vv_p = vv + dI
    ww_p = ww + dW

    return uu_p, vv_p, ww_p


parser = argparse.ArgumentParser(
    description="Extended Parameters for Wilson and Cowan Simulation"
)

# Original arguments
parser.add_argument(
    "-wee", type=float, dest="wee", default=10.0, help="Weight between E-E layers"
)
parser.add_argument(
    "-wei", type=float, dest="wei", default=12.0, help="Weight between E-I layers"
)
parser.add_argument(
    "-wie", type=float, dest="wie", default=8.0, help="Weight between I-E layers"
)
parser.add_argument(
    "-wii", type=float, dest="wii", default=3.0, help="Weight between I-I layers"
)

# New arguments for additional modes
parser.add_argument(
    "-wew", type=float, dest="wew", default=5.0, help="Weight between E-W layers"
)
parser.add_argument(
    "-wiw", type=float, dest="wiw", default=4.0, help="Weight between W-W layers"
)

parser.add_argument("-ze", type=float, dest="ze", default=0.2, help="E threshold")
parser.add_argument("-zi", type=float, dest="zi", default=4.0, help="I threshold")
parser.add_argument("-zw", type=float, dest="zw", default=2.0, help="W threshold")

parser.add_argument("-ie1", type=float, dest="ie1", default=0, help="E Current")
parser.add_argument("-ii1", type=float, dest="ii1", default=0, help="I Current")
parser.add_argument("-ie2", type=float, dest="ie2", default=0, help="W Current")
parser.add_argument("-ii2", type=float, dest="ii2", default=0, help="W Current")

parser.add_argument("-w", type=float, dest="w", default=0.25, help="Phase")
parser.add_argument("-tstop", type=float, dest="tstop", default=100, help="Duration")
parser.add_argument("-nogui", action="store_true", default=False, help="No GUI")

args = parser.parse_args()

# settings
tau = 1.0
ie0 = 0
ii0 = 0

dt = 0.005

times = np.arange(0, args.tstop, dt)
uu_p = np.zeros((len(times), 1))
vv_p = np.zeros((len(times), 1))
ww_p = np.zeros((len(times), 1))

# initial conditions
uu0 = 0.4
vv0 = 0.4
ww0 = 0.4

savefile = "ExtendedNetwork.dat"
data_file = open(savefile, "w")

for t_idx in range(len(times)):
    t = t_idx * dt
    if t_idx == 0:
        uu_p[t_idx], vv_p[t_idx], ww_p[t_idx] = calculate_firing_rate(
            ie0,
            args.ie1,
            ii0,
            args.ii1,
            args.w,
            t,
            dt,
            uu0,
            vv0,
            ww0,
            args.wee,
            args.wei,
            args.wie,
            args.wii,
            args.wew,
            args.wiw,
            args.ze,
            args.zi,
            args.zw,
            args.ie2,
            args.ii2,
        )
    else:
        uu_p[t_idx], vv_p[t_idx], ww_p[t_idx] = calculate_firing_rate(
            ie0,
            args.ie1,
            ii0,
            args.ii1,
            args.w,
            t,
            dt,
            uu_p[t_idx - 1],
            vv_p[t_idx - 1],
            ww_p[t_idx - 1],
            args.wee,
            args.wei,
            args.wie,
            args.wii,
            args.wew,
            args.wiw,
            args.ze,
            args.zi,
            args.zw,
            args.ie2,
            args.ii2,
        )
    data_file.write(
        "%s\t%s\t%s\t%s\n"
        % (t / 1000.0, uu_p[t_idx][0], vv_p[t_idx][0], ww_p[t_idx][0])
    )

data_file.close()

print(
    "Finished running extended simulation of %sms, saved data to %s"
    % (args.tstop, savefile)
)

if not args.nogui:
    plt.figure()
    plt.plot(times, uu_p, label="E", color="red")
    plt.plot(times, vv_p, label="I", color="blue")
    plt.plot(times, ww_p, label="W", color="green")
    plt.xlabel("Time")
    plt.ylabel("Firing Rate")
    plt.legend()

    pop_step = 0.02
    pop_stop = 1
    population = np.arange(pop_step, pop_stop, pop_step)

    # 3D nullclines (planes where derivatives are zero)
    I = np.zeros((len(population), len(population)))
    E = np.zeros((len(population), len(population)))
    W = np.zeros((len(population), len(population)))

    for e_idx, e in enumerate(population):
        for w_idx, w in enumerate(population):
            # dI/dt = 0 equation
            I[e_idx, w_idx] = (
                1
                / args.wie
                * (math.log(1 / e - 1) - args.ze + args.wee * e - args.wew * w)
            )

    for i_idx, i in enumerate(population):
        for w_idx, w in enumerate(population):
            # dE/dt = 0 equation
            E[i_idx, w_idx] = (
                -1
                / args.wei
                * (math.log(1 / i - 1) - args.zi - args.wii * i - args.wew * w)
            )

    fig = plt.figure(figsize=(10, 8))
    ax = fig.add_subplot(111, projection="3d")
    ax.plot3D(vv_p, uu_p, ww_p, label="EIW trajectory", color="b", linewidth=0.8)
    ax.plot_surface(
        np.meshgrid(population, population)[1],
        np.meshgrid(population, population)[0],
        I,
        alpha=0.5,
        color="blue",
    )
    ax.plot_surface(
        np.meshgrid(population, population)[1],
        np.meshgrid(population, population)[0],
        E,
        alpha=0.5,
        color="red",
    )

    # Create grid of initial conditions
    num_points = 20
    E = np.linspace(0, 1, num_points)
    I = np.linspace(0, 1, num_points)
    W = np.linspace(0, 1, num_points)

    # Prepare 3D plot

    # Iterate through initial conditions
    for e in E[::4]:
        for i in I[::4]:
            for w in W[::4]:
                trajectory = []
                current_e, current_i, current_w = e, i, w

                # Simulate for a few steps
                for t in range(20):
                    trajectory.append((current_e, current_i, current_w))
                    current_e, current_i, current_w = calculate_firing_rate(
                        ie0,
                        args.ie1,
                        ii0,
                        args.ii1,
                        args.w,
                        t,
                        dt,
                        current_e,
                        current_i,
                        current_w,
                        args.wee,
                        args.wei,
                        args.wie,
                        args.wii,
                        args.wew,
                        args.wiw,
                        args.ze,
                        args.zi,
                        args.zw,
                        args.ie2,
                        args.ii2,
                    )

                # Unpack trajectory
                traj_i, traj_e, traj_w = zip(*trajectory)

                # Plot full trajectory
                ax.plot3D(
                    traj_i, traj_e, traj_w, color="blue", alpha=0.5, linewidth=0.5
                )
                # Plot initial point
                ax.scatter3D(traj_i[0], traj_e[0], traj_w[0], color="red", s=10)

    ax.set_xlabel("I (Inhibitory)")
    ax.set_ylabel("E (Excitatory)")
    ax.set_zlabel("W (Additional Mode)")
    ax.set_title("3D Phase Space Trajectories")

    plt.tight_layout()
    plt.show()
