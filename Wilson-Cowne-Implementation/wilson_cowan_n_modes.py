import numpy as np
import math
import matplotlib.pyplot as plt
import argparse


def sigmoid_function(x):
    return 1 / (1 + math.exp(-x))


def calculate_firing_rates(
    modes, rho, ie, w, t, dt, tau, ze, noise=None, external_input=None
):
    """
    Calculate firing rates for n modes using vector-matrix approach

    Parameters:
    - modes: Current activation levels of each mode
    - rho: Connectivity matrix between modes
    - ie: Input current parameters
    - w: Phase parameter
    - t: Current time
    - dt: Time step
    - tau: Time constant
    - ze: Threshold parameters
    - noise: Optional noise vector
    - external_input: Optional external input vector

    Returns:
    - Updated mode activation levels
    """
    if external_input is None:
        external_input = np.zeros(modes.shape)

    if noise is None:
        noise = np.zeros(modes.shape)

    # Calculate input currents with sinusoidal modulation
    currents = ie[:, 0] + ie[:, 1] * math.sin(w * t)

    # Compute mode activations with noise
    dModes = (
        dt
        * (
            -modes
            + np.array(
                [
                    sigmoid_function(
                        np.dot(rho[j], modes) - ze[j] + currents[j] + noise[j]
                    )
                    for j in range(len(modes))
                ]
            )
        )
        / tau
    )

    return modes + dModes


def main():
    parser = argparse.ArgumentParser(description="N-Mode Wilson-Cowan Simulation")
    parser.add_argument("-n", type=int, default=3, help="Number of modes")
    parser.add_argument("-tstop", type=float, default=100, help="Simulation duration")
    parser.add_argument("-nogui", action="store_true", help="Disable plotting")

    # New arguments for custom inputs
    parser.add_argument(
        "--ie_base", type=float, nargs="+", help="Base input current for each mode"
    )
    parser.add_argument(
        "--ie_amp", type=float, nargs="+", help="Input current amplitude for each mode"
    )
    parser.add_argument(
        "--noise_level", type=float, nargs="+", help="Noise level for each mode"
    )
    parser.add_argument(
        "--ze_thresh", type=float, nargs="+", help="Threshold for each mode"
    )

    args = parser.parse_args()

    # Simulation parameters
    n_modes = args.n
    tau = 1.0
    dt = 0.005
    times = np.arange(0, args.tstop, dt)

    # Initialize connectivity matrix (asymmetric)
    np.random.seed(42)  # For reproducibility
    rho = np.random.uniform(0, 1, (n_modes, n_modes))
    np.fill_diagonal(rho, -1)  # Self-inhibition

    # Input current parameters
    ie = np.zeros((n_modes, 2))
    if args.ie_base:
        ie[:, 0] = np.array(args.ie_base[:n_modes])
    else:
        ie[:, 0] = np.random.uniform(0, 0.5, n_modes)

    if args.ie_amp:
        ie[:, 1] = np.array(args.ie_amp[:n_modes])
    else:
        ie[:, 1] = np.random.uniform(0, 0.5, n_modes)

    # Threshold parameters
    if args.ze_thresh:
        ze = np.array(args.ze_thresh[:n_modes])
    else:
        ze = np.random.uniform(0.1, 0.5, n_modes)

    # Noise parameters
    if args.noise_level:
        noise = np.array(args.noise_level[:n_modes])
    else:
        noise = np.zeros(n_modes)

    # Initial conditions
    modes = np.random.uniform(0.01, 0.1, n_modes)

    # Simulation parameters
    w = 0.25  # Phase parameter

    # Storage for results
    results = np.zeros((len(times), n_modes))

    # Run simulation
    for t_idx, t in enumerate(times):
        if t_idx == 0:
            results[t_idx] = modes
        else:
            modes = calculate_firing_rates(
                results[t_idx - 1], rho, ie, w, t, dt, tau, ze, noise=noise
            )
            results[t_idx] = modes

    # # Optional visualization
    # if not args.nogui:
    #     plt.figure(figsize=(10, 6))
    #     for i in range(n_modes):
    #         plt.plot(times, results[:, i], label=f"Mode {i+1}")
    #     plt.xlabel("Time")
    #     plt.ylabel("Firing Rate")
    #     plt.title(f"Firing Rates for {n_modes} Modes")
    #     plt.legend()
    #     plt.show()
    # 3D Phase Space and Trajectory Visualization
    if not args.nogui:
        plt.figure(figsize=(12, 8))

        # 2D Time Series Plot (Subplot 1)
        plt.subplot(2, 1, 1)
        for i in range(n_modes):
            plt.plot(times, results[:, i], label=f"Mode {i+1}")
        plt.xlabel("Time")
        plt.ylabel("Firing Rate")
        plt.title("Neural Modes Firing Rates")
        plt.legend()

        # 3D Phase Space Plot (Subplot 2)
        if n_modes >= 3:
            ax = plt.subplot(2, 1, 2, projection="3d")
            ax.plot3D(
                results[:, 0], results[:, 1], results[:, 2], color="purple", linewidth=2
            )
            ax.set_title("3D Phase Space Trajectory")
            ax.set_xlabel("Mode 1")
            ax.set_ylabel("Mode 2")
            ax.set_zlabel("Mode 3")

        plt.tight_layout()
        plt.show()

    return results


if __name__ == "__main__":
    main()
