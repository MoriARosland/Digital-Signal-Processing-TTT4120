import numpy as np
import matplotlib.pyplot as plt

f_1 = 5.0            # Normalized frequency
F_s = 6000.0         # Sampling rate (samples per second)
duration = 4.0       # Duration of the sequence in seconds
samples = F_s*duration

# Generate time values using np.linspace()
n = np.linspace(0, duration, int(samples), endpoint=False)

# Generate the discrete harmonic sequence
x_n = np.cos(2 * np.pi * f_1 * n)

# Plot the sequence
plt.figure(figsize=(10, 4))
plt.plot(n, x_n)
plt.title("Discrete Harmonic Sequence")
plt.xlabel("Time (seconds)")
plt.ylabel("Amplitude")
plt.show()
