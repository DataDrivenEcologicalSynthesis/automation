import matplotlib.pyplot as plt
import numpy as np
import pandas as pd
import seaborn as sns

occurrences = pd.read_csv("occurrences.csv") 
occurrences.head()

sns.relplot(x="longitude", y="latitude", hue="name", data=occurrences);

plt.savefig("map.png")
