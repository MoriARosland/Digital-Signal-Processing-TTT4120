import numpy as np
import sounddevice as sd

# Parameters
F_s = 8000                  # Sampling rate (samples per second)
F_1 = [1000, 3000, 6000]    # Physical Frequency
duration = 4.0              # Duration of the sequence in seconds

numberOfSamples = F_s*duration

# Playback signal at all sampling rates.
for F_1 in F_1:

    # Generate time values using np.linspace()
    t = np.linspace(0, duration, int(numberOfSamples), endpoint=False)

    # Generate the discrete harmonic sequence
    x_n = np.cos(2 * np.pi * F_1 * t)

    f_1 = F_1/F_s

    print("Normalized freq at {}Hz: {}".format(F_1, f_1))

    sd.play(x_n, samplerate=F_s)
    sd.wait()


# Comment:
# We can hear pitch increasing from F_1=1kHz to F_1=3kHz, but decrease from F_1=3kHz to F_1=6kHz. This is due to aliasing.
# At 1kHz and 3kHz, normalized frequency is below 0.5 (Nyquist rate) and the signal is correctly reconstructed.
# At 6kHz, f_1 > 0.5 (above Nyquist rate), and the signal is incorrectly reconstructed (aliased as a signal with lower frequency).
