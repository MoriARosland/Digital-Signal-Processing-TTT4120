import numpy as np
import matplotlib.pyplot as plt

numSamples = 10000
M = 10

x_values = np.linspace(-np.pi, np.pi, int(numSamples), endpoint=False)
y_values = []

def y(w):
    numerator = np.sin(w*(M+0.5))
    denominator = np.sin(w/2)
    value = numerator / denominator
    return value

for i in x_values:
    y_values.append(y(i))

plt.figure(figsize=(10, 4))
plt.plot(x_values, y_values)
plt.title("Task 1b")
plt.xlabel("$\omega$")
plt.ylabel("Y($\omega$)")
plt.show()