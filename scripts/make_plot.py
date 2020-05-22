import matplotlib.pyplot as plt
import numpy as np

x, y = np.loadtxt('occurrences.csv', delimiter=',', unpack=True)
plt.scatter(x,y, label='Amphiprion ocellaris')

plt.xlabel('Longitude')
plt.ylabel('Latitude')
plt.legend()
plt.savefig("map.png")
