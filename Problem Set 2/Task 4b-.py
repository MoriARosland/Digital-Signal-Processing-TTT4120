import numpy as np
import sounddevice as sd

frequency = 1000                       # Normalized frequency
samplingFrequency = [4000, 1500]       # Sampling rate (samples per second)
duration = 1                           # Duration of the sequence in seconds

# Playback signal at all sampling rates.
for samplingFrequency in samplingFrequency:
    numberOfSamples = samplingFrequency*duration

    # Generate time values using np.linspace()
    t = np.linspace(0, duration, int(numberOfSamples), endpoint=False)

    # Generate the discrete harmonic sequence
    x_n = np.cos(2 * np.pi * frequency * t)

    sd.play(x_n, samplerate=samplingFrequency)
    sd.wait()
