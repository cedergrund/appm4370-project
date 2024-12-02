import math
import numpy as np
import matplotlib.pylab as plt
import argparse


def sigmoid_function(x):
    return 1 / (1 + np.exp(-x))


def calculate_firing_rate(inputs, weights, states, external_inputs, tau, dt):
    # Calculate new states for each population using vectorized dynamics.
    drive = weights @ states - external_inputs + inputs
    d_states = dt * (-states + sigmoid_function(drive)) / tau
    return states + d_states


parser = argparse.ArgumentParser(
    description="Parameters for the Wilson and Cowan Simulation"
)

parser.add_argument(
    "-w", type=float, dest="w", default=0.25, help="Phase for oscillatory inputs"
)
parser.add_argument("-ie1", type=float, dest="ie1", default=0, help="Current to E")
parser.add_argument("-ii1", type=float, dest="ii1", default=0, help="Current to I")
parser.add_argument("-iz1", type=float, dest="iz1", default=0, help="Current to Z")
parser.add_argument(
    "-weights",
    type=float,
    nargs=9,
    required=True,
    help="Flattened 3x3 weight matrix (row-major order)",
)
parser.add_argument(
    "-tstop", type=float, dest="tstop", default=100, help="Simulation duration"
)
parser.add_argument("-nogui", action="store_true", default=False, help="Disable GUI")

args = parser.parse_args()

# Simulation parameters
tau = 1.0
dt = 0.005
times = np.arange(0, args.tstop, dt)

# Reshape weights into a 3x3 matrix
weights = np.array(args.weights).reshape((3, 3))

# External input offsets (ze, zi, zz)
external_inputs = np.array([4.5, 4.5, 4.5])

# Oscillatory input amplitudes
osc_amplitudes = np.array([args.ie1, args.ii1, args.iz1])

# Initialize state variables for E, I, Z
states = np.array([0.1, 0.05, 0.02])  # Initial values for [E, I, Z]
populations = np.zeros((len(times), 3))

# Main simulation loop
for t_idx, t in enumerate(times):
    oscillatory_input = osc_amplitudes * np.sin(args.w * t)
    states = calculate_firing_rate(
        oscillatory_input, weights, states, external_inputs, tau, dt
    )
    populations[t_idx] = states

# Save results to file
savefile = "simulation_results_3_modes.dat"
np.savetxt(savefile, np.column_stack((times, populations)), header="Time\tE\tI\tZ")
print(f"Simulation completed. Results saved to {savefile}")

# Visualization
if not args.nogui:
    plt.figure()
    plt.plot(times, populations[:, 0], label="E", color="red")
    plt.plot(times, populations[:, 1], label="I", color="blue")
    plt.plot(times, populations[:, 2], label="Z", color="green")
    plt.xlabel("Time")
    plt.ylabel("Firing Rates")
    plt.legend()
    plt.title("Wilson-Cowan Dynamics with 3 Modes")

    # 3D Trajectory Plot
    fig = plt.figure()
    ax = fig.add_subplot(111, projection="3d")
    ax.plot(
        populations[:, 0],
        populations[:, 1],
        populations[:, 2],
        label="E-I-Z Trajectory",
        color="purple",
        linewidth=1.2,
    )
    ax.set_xlabel("E (Excitatory)")
    ax.set_ylabel("I (Inhibitory)")
    ax.set_zlabel("Z (Mode 3)")
    ax.set_title("3D Trajectory of Wilson-Cowan Dynamics")
    ax.legend()

    plt.show()
