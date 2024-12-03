import numpy as np
import matplotlib.pyplot as plt


class LotkaVolterraNeural:
    def __init__(self, alpha, beta, a, b, c):
        """
        Initialize the Lotka-Volterra Neural Ensemble model

        Parameters:
        -----------
        alpha, beta : float
            Coupling parameters
        a, b, c : float
            External stimulus amplitudes
        """
        self.alpha = alpha
        self.beta = beta
        self.a = a
        self.b = b
        self.c = c

        # Threshold for neuron activation
        self.activation_threshold = 0.5

    def neuron_dynamics(self, rho, external_stim):
        """
        Compute the derivative for a single neuron

        Parameters:
        -----------
        rho : float
            Current neuronal activity
        external_stim : float
            External stimulus amplitude

        Returns:
        --------
        float
            Derivative of neuronal activity
        """
        # Key equation from the paper
        return rho * (rho - 1 + self.alpha * rho + self.beta * rho) + external_stim

    def simulate_runge_kutta(self, initial_state, t_end, num_steps):
        """
        Simulate using 4th order Runge-Kutta method

        Parameters:
        -----------
        initial_state : list
            Initial [ρ1, ρ2, ρ3]
        t_end : float
            End time of simulation
        num_steps : int
            Number of simulation steps

        Returns:
        --------
        tuple: time array, solution array
        """
        # Prepare time and state arrays
        dt = t_end / num_steps
        t = np.linspace(0, t_end, num_steps)

        # Initialize solution array
        solution = np.zeros((num_steps, 3))
        solution[0] = initial_state

        # Runge-Kutta 4th order method
        for i in range(1, num_steps):
            # External stimuli based on initial conditions
            external_stims = [
                self.a if solution[i - 1, 0] < self.activation_threshold else 0,
                self.b if solution[i - 1, 1] < self.activation_threshold else 0,
                self.c if solution[i - 1, 2] < self.activation_threshold else 0,
            ]

            # Compute RK4 coefficients for each neuron
            k1 = np.zeros(3)
            k2 = np.zeros(3)
            k3 = np.zeros(3)
            k4 = np.zeros(3)

            for j in range(3):
                # RK4 method for interdependent neurons
                k1[j] = self.neuron_dynamics(solution[i - 1, j], external_stims[j])

                k2[j] = self.neuron_dynamics(
                    solution[i - 1, j] + 0.5 * dt * k1[j], external_stims[j]
                )

                k3[j] = self.neuron_dynamics(
                    solution[i - 1, j] + 0.5 * dt * k2[j], external_stims[j]
                )

                k4[j] = self.neuron_dynamics(
                    solution[i - 1, j] + dt * k3[j], external_stims[j]
                )

            # Update solution
            solution[i] = solution[i - 1] + (dt / 6) * (k1 + 2 * k2 + 2 * k3 + k4)

            # Constrain values
            solution[i] = np.clip(solution[i], 0, 1)

        return t, solution

    def plot_dynamics(self, t, solution):
        """
        Plot the dynamics of the neural ensemble
        """
        plt.figure(figsize=(12, 6))
        plt.plot(t, solution[:, 0], "r", label="Neuron 1 (ρ1)")
        plt.plot(t, solution[:, 1], "g", label="Neuron 2 (ρ2)")
        plt.plot(t, solution[:, 2], "b", label="Neuron 3 (ρ3)")
        plt.title("Lotka-Volterra Neural Ensemble Dynamics")
        plt.xlabel("Time")
        plt.ylabel("Neuronal Activity (ρ)")
        plt.legend()
        plt.grid(True)
        plt.tight_layout()
        plt.show()


def main():
    # Specific parameters from Figure 4 in the paper
    alpha = 0.1  # Coupling parameter
    beta = 1.5  # Coupling parameter
    a = 0.6917  # External stimulus for neuron 1
    b = 0.4  # External stimulus for neuron 2
    c = 0.01  # External stimulus for neuron 3

    # Create model
    model = LotkaVolterraNeural(alpha, beta, a, b, c)

    # Simulation parameters
    initial_state = [0.7, 0.4, 0.0]  # All neurons start inactive
    t_end = 100  # Simulation end time
    num_steps = 10000  # High granularity

    # Simulate
    t, solution = model.simulate_runge_kutta(initial_state, t_end, num_steps)

    # Plot
    model.plot_dynamics(t, solution)


if __name__ == "__main__":
    main()
