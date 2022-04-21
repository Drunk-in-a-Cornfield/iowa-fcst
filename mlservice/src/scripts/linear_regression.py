from sklearn import metrics
from sklearn.linear_model import LinearRegression
from sklearn.model_selection import train_test_split
import matplotlib.pyplot as plt
import pandas as pd
import numpy as np

############
### Summary
############
### Predict Sales
# RMSE (Original): 23272.12673353224
# RMSE (Cluster: 0): 11025.296839283432
# RMSE (Cluster: 1): 5221.432212006931
# RMSE (Cluster: 2): 8454.05534826173
# RMSE (Cluster: Average): 8233.59479987

### Predict Profit
# RMSE (Original): 21682.345592407626
# RMSE (Cluster: 0): 3381.9545784247493
# RMSE (Cluster: 1): 2957.6527283345645
# RMSE (Cluster: 2): 8523.265087710313
# RMSE (Cluster: Average): 4954.29079817

##################
### Predict Sales
##################
# Original
df = pd.read_pickle('../modules/k_means.pkl')
ignore_columns = [
    'average_monthly_sales',
    'average_monthly_profit'
]
X_columns = [i for i in df.columns.tolist() if i not in ignore_columns]
X = df[X_columns]
y = df['average_monthly_sales']

X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=59)
regressor = LinearRegression()
regressor.fit(X_train, y_train)

pd.DataFrame(regressor.coef_, X.columns, columns=['Coefficient'])
y_pred = regressor.predict(X_test)
pd.DataFrame({'Actual': y_test, 'Predicted': y_pred})
print('Root Mean Squared Error:', np.sqrt(metrics.mean_squared_error(y_test, y_pred)))

# Cluster 0
df = pd.read_pickle('../modules/k_means.pkl')
df = df[df['cluster'] == 0]
ignore_columns = [
    'average_monthly_sales',
    'average_monthly_profit'
]
X_columns = [i for i in df.columns.tolist() if i not in ignore_columns]
X = df[X_columns]
y = df['average_monthly_sales']

X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=59)
regressor = LinearRegression()
regressor.fit(X_train, y_train)


pd.DataFrame(regressor.coef_, X.columns, columns=['Coefficient'])
y_pred = regressor.predict(X_test)
pd.DataFrame({'Actual': y_test, 'Predicted': y_pred})
print('Root Mean Squared Error:', np.sqrt(metrics.mean_squared_error(y_test, y_pred)))

# Cluster 1
df = pd.read_pickle('../modules/k_means.pkl')
df = df[df['cluster'] == 1]
ignore_columns = [
    'average_monthly_sales',
    'average_monthly_profit'
]
X_columns = [i for i in df.columns.tolist() if i not in ignore_columns]
X = df[X_columns]
y = df['average_monthly_sales']

X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=59)
regressor = LinearRegression()
regressor.fit(X_train, y_train)


pd.DataFrame(regressor.coef_, X.columns, columns=['Coefficient'])
y_pred = regressor.predict(X_test)
pd.DataFrame({'Actual': y_test, 'Predicted': y_pred})
print('Root Mean Squared Error:', np.sqrt(metrics.mean_squared_error(y_test, y_pred)))

# Cliuster 2
df = pd.read_pickle('../modules/k_means.pkl')
df = df[df['cluster'] == 2]
ignore_columns = [
    'average_monthly_sales',
    'average_monthly_profit'
]
X_columns = [i for i in df.columns.tolist() if i not in ignore_columns]
X = df[X_columns]
y = df['average_monthly_sales']

X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=59)
regressor = LinearRegression()
regressor.fit(X_train, y_train)


pd.DataFrame(regressor.coef_, X.columns, columns=['Coefficient'])
y_pred = regressor.predict(X_test)
pd.DataFrame({'Actual': y_test, 'Predicted': y_pred})
print('Root Mean Squared Error:', np.sqrt(metrics.mean_squared_error(y_test, y_pred)))

###################
### Predict Profit
###################
# Original
df = pd.read_pickle('../modules/k_means.pkl')
ignore_columns = [
    'average_monthly_sales',
    'average_monthly_profit'
]
X_columns = [i for i in df.columns.tolist() if i not in ignore_columns]
X = df[X_columns]
y = df['average_monthly_profit']

X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=59)
regressor = LinearRegression()
regressor.fit(X_train, y_train)

pd.DataFrame(regressor.coef_, X.columns, columns=['Coefficient'])
y_pred = regressor.predict(X_test)
pd.DataFrame({'Actual': y_test, 'Predicted': y_pred})
print('Root Mean Squared Error:', np.sqrt(metrics.mean_squared_error(y_test, y_pred)))

# Cluster 0
df = pd.read_pickle('../modules/k_means.pkl')
df = df[df['cluster'] == 0]
ignore_columns = [
    'average_monthly_sales',
    'average_monthly_profit'
]
X_columns = [i for i in df.columns.tolist() if i not in ignore_columns]
X = df[X_columns]
y = df['average_monthly_profit']

X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=59)
regressor = LinearRegression()
regressor.fit(X_train, y_train)


pd.DataFrame(regressor.coef_, X.columns, columns=['Coefficient'])
y_pred = regressor.predict(X_test)
pd.DataFrame({'Actual': y_test, 'Predicted': y_pred})
print('Root Mean Squared Error:', np.sqrt(metrics.mean_squared_error(y_test, y_pred)))

# Cluster 1
df = pd.read_pickle('../modules/k_means.pkl')
df = df[df['cluster'] == 1]
ignore_columns = [
    'average_monthly_sales',
    'average_monthly_profit'
]
X_columns = [i for i in df.columns.tolist() if i not in ignore_columns]
X = df[X_columns]
y = df['average_monthly_profit']

X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=59)
regressor = LinearRegression()
regressor.fit(X_train, y_train)


pd.DataFrame(regressor.coef_, X.columns, columns=['Coefficient'])
y_pred = regressor.predict(X_test)
pd.DataFrame({'Actual': y_test, 'Predicted': y_pred})
print('Root Mean Squared Error:', np.sqrt(metrics.mean_squared_error(y_test, y_pred)))

# Cluster 2
df = pd.read_pickle('../modules/k_means.pkl')
df = df[df['cluster'] == 2]
ignore_columns = [
    'average_monthly_sales',
    'average_monthly_profit'
]
X_columns = [i for i in df.columns.tolist() if i not in ignore_columns]
X = df[X_columns]
y = df['average_monthly_profit']

X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=59)
regressor = LinearRegression()
regressor.fit(X_train, y_train)


pd.DataFrame(regressor.coef_, X.columns, columns=['Coefficient'])
y_pred = regressor.predict(X_test)
pd.DataFrame({'Actual': y_test, 'Predicted': y_pred})
print('Root Mean Squared Error:', np.sqrt(metrics.mean_squared_error(y_test, y_pred)))
