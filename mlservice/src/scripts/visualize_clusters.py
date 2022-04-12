# https://www.askpython.com/python/examples/plot-k-means-clusters-python

#Importing required modules

# from sklearn.datasets import load_digits
from sklearn.decomposition import PCA
from sklearn.cluster import KMeans
import numpy as np
import pandas as pd

import matplotlib.pyplot as plt
from sklearn.preprocessing import StandardScaler

df = pd.read_pickle('./features_by_store.pkl')

ignore_columns = ['average_monthly_sales', 'average_monthly_profit']

X_columns = [i for i in df.columns.tolist() if i not in ignore_columns]
X = df[X_columns]

# Standardize the data to have a mean of ~0 and a variance of 1
X_std = StandardScaler().fit_transform(X)

# Create a PCA instance: pca
pca = PCA(n_components=2)
principalComponents = pca.fit_transform(X_std)

#Initialize the class object
kmeans = KMeans(n_clusters=3,
                init="k-means++",
                n_init=10,
                tol=1e-04,
                random_state=59)

#predict the labels of clusters.
label = kmeans.fit_predict(principalComponents)

#Getting unique labels
u_labels = np.unique(label)

print('label:', label)
print('u_labels:', u_labels)
print('X:', X)

# plotting the results:
for i in u_labels:
    plt.scatter(principalComponents[label == i, 0], principalComponents[label == i, 1], label=i)
plt.legend()

ax = plt.gca()
ax.set_ylim([-5, 20])

plt.savefig('04-clusters.png')
