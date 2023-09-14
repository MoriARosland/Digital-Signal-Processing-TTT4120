import numpy as np
import matplotlib.pyplot as plt
import scipy

# ---------------- H1 ---------------- #
numerator = [1, 2, 1]
denominator = [1]

w, H1 = scipy.signal.freqz(numerator, denominator)
H1_magnitude = np.abs(H1)
H1_phase = np.angle(H1)

fig, axs = plt.subplots(1, 2, figsize=(12, 5))

axs[0].plot(w, H1_magnitude)
axs[0].set_title('|H1($\omega$)|')
axs[0].set(xlabel='$\omega$', ylabel='|H1($\omega$)|')

axs[1].plot(w, H1_phase)
axs[1].set_title('Phase_H1($\omega$)')
axs[1].set(xlabel='$\omega$', ylabel='Phase H1($\omega$)')

plt.show()
# ------------------------------------ #


# ---------------- H2 ---------------- #
numerator = [1]
denominator = [1, 0.9]

w, H2 = scipy.signal.freqz(numerator, denominator)
H2_magnitude = np.abs(H2)
H2_phase = np.angle(H2)

fig, axs = plt.subplots(1, 2, figsize=(12, 5))

axs[0].plot(w, H2_magnitude)
axs[0].set_title('|H2($\omega$)|')
axs[0].set(xlabel='$\omega$', ylabel='|H2($\omega$)|')

axs[1].plot(w, H2_phase)
axs[1].set_title('Phase_H2($\omega$)')
axs[1].set(xlabel='$\omega$', ylabel='Phase H2($\omega$)')

plt.show()
# ------------------------------------ #
