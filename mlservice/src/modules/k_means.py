from sklearn.cluster import KMeans
from sklearn.preprocessing import MinMaxScaler
import os
import pandas as pd
import matplotlib.pyplot as plt


def create_k_means_pickle():
    path = './src/modules/k_means.pkl'
    if os.path.exists(path):
        df = pd.read_pickle(path)
    else:
        ignore_columns = [
            'average_monthly_sales',
            'average_monthly_profit'
        ]
        X_columns = [i for i in df.columns.tolist() if i not in ignore_columns]
        X = df[X_columns]


        # Elbow Method to Find K
        scaler = MinMaxScaler()
        scaler.fit(X)
        X = scaler.transform(X)
        inertia = []
        n_clusters = range(1, 20)
        for i in n_clusters:
            kmeans = KMeans(
                n_clusters=i,
                init='k-means++',
                n_init=10,
                tol=1e-04,
                random_state=59
            )
            kmeans.fit(X)
            inertia.append(kmeans.inertia_)


        # plt.plot([i for i in n_clusters], inertia)
        # plt.xticks([i for i in n_clusters], n_clusters)
        # plt.show()

        # k = 3
        kmeans = KMeans(
                n_clusters=3,
                init="k-means++",
                n_init=10,
                tol=1e-04,
                random_state=59
            )
        kmeans.fit(X)

        df['cluster'] = kmeans.labels_
        print('Number of Stores (Cluster 0): ', len(df[df['cluster'] == 0]))
        print('Number of Stores (Cluster 1): ', len(df[df['cluster'] == 1]))
        print('Number of Stores (Cluster 2): ', len(df[df['cluster'] == 2]))
        df.to_pickle(path)
