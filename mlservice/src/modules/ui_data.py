import numpy as np
import pandas as pd
from sklearn.decomposition import PCA
from sklearn.cluster import KMeans
from sklearn.preprocessing import StandardScaler


def get_pca_coords(df_features_by_store):
    # remove avg columns and create X (features)
    ignore_columns = ['average_monthly_sales', 'average_monthly_profit']
    X_columns = [
        i for i in df_features_by_store.columns.tolist()
        if i not in ignore_columns
    ]
    X = df_features_by_store[X_columns]

    # Standardize the data to have a mean of ~0 and a variance of 1
    X_std = StandardScaler().fit_transform(X)

    # Create a PCA instance: pca
    pca = PCA(n_components=2)
    principalComponents = pca.fit_transform(X_std)

    df_pca = pd.DataFrame(data={
        'pca_0': principalComponents[:, 0],
        'pca_1': principalComponents[:, 1]
    })

    return df_pca


def reverse_one_hot(df_k_means):
    df_cities = df_k_means.iloc[:, 0:415].idxmax(1)
    df_zip_codes = df_k_means.iloc[:, 415:863].idxmax(1)
    df_county_no = df_k_means.iloc[:, 863:962].idxmax(1)

    df = pd.DataFrame(data={
        'cities': df_cities,
        'zip_codes': df_zip_codes,
        'county_no': df_county_no
    })

    df_averages = df_k_means.iloc[:, 8722:8725]

    df = df.join(df_averages)

    return df
