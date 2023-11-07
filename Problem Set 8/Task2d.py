import numpy as np
import matplotlib.pyplot as plt
from scipy.linalg import solve

# Autocorrelation results from 2b
Yxx = np.array([1.16, -0.4, -0.4])

# Finding the coefficients of the AR model (first -> third order)
#  First order
r1 = -Yxx[1]
A1 = Yxx[0]
X1 = solve(A1, r1)

#  Second order
A2 = np.array([[Yxx[0], Yxx[1]], [Yxx[-1], Yxx[0]]])
r2 = np.array([[-Yxx[-1]], [0]])
X2 = solve(A2, r2)

#  Third order
A3 = np.array(
    [[Yxx[0], Yxx[1], 0], [Yxx[-1], Yxx[0], Yxx[1]], [0, Yxx[-1], Yxx[0]]])
r3 = np.array([[-Yxx[-1]], [0], [0]])
X3 = solve(A3, r3)

# Variance first order
variance1 = np.sum([X1+1]*Yxx[:2])

# Variance second order
variance2 = 1*Yxx[0]+X2[0]*Yxx[1]+X2[1]*0

# Variance third order
variance3 = 1*Yxx[0]+X3[0]*Yxx[1]+X3[1]*0+X3[2]*0

# Finding PDS for each order

# First order
f = np.linspace(0, 0.5, 100)
h1 = np.zeros(len(f))
for i in range(len(f)):
    sum = (X1) * np.e**(-1j*2*np.pi*f[i])
    h1[i] = np.abs((1+sum))**2
Rff1 = variance1 / h1

# Second order
h2 = np.zeros(len(f))
for i in range(len(f)):
    sum = (X2[0]) * np.e**(-1j*2*np.pi*f[i]) + \
        (X2[1]) * np.e**(-1j*2*np.pi*f[i]*2)
    h2[i] = np.abs((1+sum))**2
Rff2 = variance2 / h2

# Third order
h3 = np.zeros(len(f))
for i in range(len(f)):
    sum = (X3[0]) * np.e**(-1j*2*np.pi*f[i]) + (X3[1]) * \
        np.e**(-1j*2*np.pi*f[i]*2) + (X3[2]) * np.e**(-1j*2*np.pi*f[i]*3)
    h2[i] = np.abs((1+sum))**2
Rff3 = variance3 / h2


def plot_pds(Rff, order, ax):
    TrueRff = -0.8*np.cos(2*np.pi*f)+1.16
    ax.plot(f, Rff, label=f"{order} order")
    ax.plot(f, np.abs(TrueRff), color='red', label="True PSD")
    ax.set_xlabel("Frequency")
    ax.set_ylabel("PSD")
    ax.legend()


# Create a single figure with three subplots
fig, axes = plt.subplots(3, 1, figsize=(6, 12))

plot_pds(Rff1, 1, axes[0])
plot_pds(Rff2, 2, axes[1])
plot_pds(Rff3, 3, axes[2])

plt.tight_layout()  # Ensures subplots don't overlap
plt.show()
