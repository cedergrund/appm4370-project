import numpy as np
import matplotlib.pyplot as plt

# Parameters
dt = 0.0000001
T = 50
nt = int(round(T / dt)) + 1

# Initialize arrays
r1 = np.zeros(nt)
r2 = np.zeros(nt)
r3 = np.zeros(nt)

# Initial conditions
r1[0] =  0.540537789125142
r2[0] = 0.4
r3[0] = 0.2

# Parameters for the system
a = 0.1
b = 1.5

# Time-stepping loop
for j in range(nt - 1):
    r1_val = r1[j] + dt * (r1[j] * (r1[j] - 1 + a * r2[j] + b * r3[j]))
    r2_val = r2[j] + dt * (r2[j] * (r2[j] - 1 + a * r3[j] + b * r1[j]))
    r3_val = r3[j] + dt * (r3[j] * (r3[j] - 1 + a * r1[j] + b * r2[j]))

    if r1_val > .99:
        r1[j + 1] = r1[j]
    else: 
        r1[j + 1] = r1_val

    if r2_val > .99:
        r2[j + 1] = r2[j]
    else: 
        r2[j + 1] = r2_val

    if r3_val > .99:
        r3[j + 1] = r3[j]
    else: 
        r3[j + 1] = r3_val

    # r1[j + 1] = r1[j] + dt * (r1[j] * (r1[j] - 1 + a * r2[j] + b * r3[j]))
    # r2[j + 1] = r2[j] + dt * (r2[j] * (r2[j] - 1 + a * r3[j] + b * r1[j]))
    # r3[j + 1] = r3[j] + dt * (r3[j] * (r3[j] - 1 + a * r1[j] + b * r2[j]))

# Time array
timey = np.linspace(0, T, nt)

# Plotting
plt.figure(figsize=(10, 6))
plt.plot(timey, r1, 'r', linewidth=2, label=r'$\rho_1$')
plt.plot(timey, r2, 'g', linewidth=2, label=r'$\rho_2$')
plt.plot(timey, r3, 'b', linewidth=2, label=r'$\rho_3$')

# Labels and formatting
plt.xlabel('Time', fontsize=16)
plt.ylabel(r'$\rho_i$', fontsize=16)
plt.legend(fontsize=14)
plt.grid(True)
plt.tight_layout()
plt.show()