import numpy as np
import matplotlib.pyplot as plt


class LotkaVolterraNeural:
    def __init__(self, alpha, beta, a, b, c):
        """
        Initialize the Lotka-Volterra Neural Ensemble model with Euler method

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

    def dirac_delta(self, x):
        """
        Approximation of Dirac delta function
        """
        return 1.0 if abs(x) < 1e-10 else 0.0

    def neural_ensemble_dynamics(self, rho1, rho2, rho3):
        """
        Compute derivatives for the neural ensemble
        """
        drho1_dt = rho1 * (
            rho1 - 1 + self.alpha * rho2 + self.beta * rho3
        ) + self.a * self.dirac_delta(rho1)

        drho2_dt = rho2 * (
            rho2 - 1 + self.alpha * rho3 + self.beta * rho1
        ) + self.b * self.dirac_delta(rho2)

        drho3_dt = rho3 * (
            rho3 - 1 + self.alpha * rho1 + self.beta * rho2
        ) + self.c * self.dirac_delta(rho3)

        return drho1_dt, drho2_dt, drho3_dt

    def simulate_euler(self, initial_state, t_end, num_steps):
        """
        Simulate using Euler's method

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

        # Euler method simulation
        for i in range(1, num_steps):
            # Compute derivatives
            drho1_dt, drho2_dt, drho3_dt = self.neural_ensemble_dynamics(
                solution[i - 1, 0], solution[i - 1, 1], solution[i - 1, 2]
            )

            # Update state using Euler method
            solution[i, 0] = solution[i - 1, 0] + drho1_dt * dt
            solution[i, 1] = solution[i - 1, 1] + drho2_dt * dt
            solution[i, 2] = solution[i - 1, 2] + drho3_dt * dt

            print(i, solution[i, :], drho1_dt, drho2_dt, drho3_dt)

            # Ensure values stay within [0, 1]
            solution[i] = np.clip(solution[i], 0, 1)

        return t, solution

    def plot_dynamics(self, t, solution):
        """
        Plot the dynamics of the neural ensemble
        """
        plt.figure(figsize=(12, 6))
        plt.plot(t, solution[:, 0], label="Neuron 1 (ρ1)")
        plt.plot(t, solution[:, 1], label="Neuron 2 (ρ2)")
        plt.plot(t, solution[:, 2], label="Neuron 3 (ρ3)")
        plt.title("Lotka-Volterra Neural Ensemble Dynamics (Euler Method)")
        plt.xlabel("Time")
        plt.ylabel("Neuronal Activity (ρ)")
        plt.legend()
        plt.grid(True)
        plt.tight_layout()
        plt.show()


def main():
    # Parameters
    alpha = 0.1  # Coupling parameter
    beta = 1.5  # Coupling parameter
    a = 0.67  # External stimulus amplitude for neuron 1
    b = 0.4  # External stimulus amplitude for neuron 2
    c = 0.01  # External stimulus amplitude for neuron 3

    # Create model
    model = LotkaVolterraNeural(alpha, beta, a, b, c)

    # Simulation parameters
    initial_state = [0.7, 0.4, 0.0]  # All neurons start inactive
    t_end = 50  # Simulation end time
    num_steps = 10000  # High granularity

    # Simulate
    t, solution = model.simulate_euler(initial_state, t_end, num_steps)

    # Plot
    model.plot_dynamics(t, solution)


if __name__ == "__main__":
    main()
