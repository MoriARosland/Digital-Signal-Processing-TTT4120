import numpy as np
import matplotlib.pyplot as plt

x_n = [1, 2, 3]
h_1 = [1, 1, 1]
h_2 = []

for i in range(11):
    h_2.append(0.9**i)


y_1 = np.convolve(x_n, h_1)
y_2 = np.convolve(y_1, h_2)
print(y_1)
print(y_2)

# Stem plot of y_1 and y_2:
index_y_1 = np.linspace(0, len(y_1), len(y_1))
index_y_2 = np.linspace(0, len(y_2), len(y_2))

fig, axs = plt.subplots(1, 2, figsize=(10, 5))

axs[0].stem(index_y_1, y_1, basefmt='--', markerfmt='bo', linefmt='b-')
axs[0].set_title('System 1 Out: y_1[n]')
axs[1].stem(index_y_2, y_2, basefmt='r--', markerfmt='ro', linefmt='r-')
axs[1].set_title('System 2 Out: y_2[n]')

axs[0].set(xlabel='Index [n]', ylabel='y_1[n]')
axs[1].set(xlabel='Index [n]', ylabel='y_2-[n]')

plt.show()
