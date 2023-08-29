import numpy as np
import matplotlib.pyplot as plt
import sounddevice as sd

# Parameters
A = 1.0              # Amplitude
f_1 = 0.3            # Normalized frequency
F_s = [1000, 3000, 12000]       # Sampling rate (samples per second)
duration = 4.0       # Duration of the sequence in seconds

# Playback signal at all sampling rates.
for F_s in F_s:
    numberOfSamples = F_s*duration
    F_1 = f_1 * F_s

    # Generate time values using np.linspace()
    t = np.linspace(0, duration, int(numberOfSamples), endpoint=False)

    # Generate the discrete harmonic sequence
    x_n = A * np.cos(2 * np.pi * F_1 * t)

    sd.play(x_n, samplerate=F_s)
    sd.wait()


# Comment:
# Pitch increases as F_s increases.
