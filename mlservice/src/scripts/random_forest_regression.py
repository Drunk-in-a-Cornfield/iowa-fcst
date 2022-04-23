from sklearn import metrics
from sklearn import svm
from sklearn.svm import LinearSVR
from sklearn import tree
from sklearn.linear_model import BayesianRidge
from sklearn.linear_model import ElasticNet
from sklearn.linear_model import LinearRegression
from sklearn.ensemble import RandomForestRegressor
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import StandardScaler
import datetime
import matplotlib.pyplot as plt
import numpy as np
import os
import pandas as pd
import psycopg2
import seaborn as sns

##################
### Predict Sales
##################
# Original
df = pd.read_pickle('../pickle/77_POLK.pkl')

# Date
date_df = df.groupby(by=['date__c'], dropna=False).mean()
date_df = date_df[['date_quarter__c', 'date_dow__c']]

# Store Number
store_number_df = pd.concat([
	df[['date__c']],
	pd.get_dummies(df.store_number__c, prefix='store_number')],
	1
).groupby(by=['date__c'], dropna=False).mean()

# City
city_df = pd.concat([
	df[['date__c']],
	pd.get_dummies(df.city__c, prefix='city')],
	1
).groupby(by=['date__c'], dropna=False).mean()

# Zip Code
zip_code_df = pd.concat([
	df[['date__c']],
	pd.get_dummies(df.zip_code__c, prefix='zip_code')],
	1
).groupby(by=['date__c'], dropna=False).mean()

# Category
category_df = pd.concat([
	df[['date__c']],
	pd.get_dummies(df.category__c, prefix='category')],
	1
).groupby(by=['date__c'], dropna=False).mean()

# Vendor Number
vendor_number_df = pd.concat([
	df[['date__c']],
	pd.get_dummies(df.vendor_number__c, prefix='vendor_number')],
	1
).groupby(by=['date__c'], dropna=False).mean()

# # Item Number
# item_number_df = pd.concat([
# 	df[['date__c']],
# 	pd.get_dummies(df.item_number__c, prefix='item_number')],
# 	1
# ).groupby(by=['date__c'], dropna=False).mean()

# Cluster
cluster_df = pd.concat([
	df[['date__c']],
	pd.get_dummies(df.cluster__c, prefix='cluster')],
	1
).groupby(by=['date__c'], dropna=False).mean()

# Pack
pack_df = df.groupby(by=['date__c'], dropna=False).sum()
pack_df = pack_df[['pack__c']]

# State Bottle Retail
state_bottle_retail_df = df.groupby(by=['date__c'], dropna=False).mean()
state_bottle_retail_df = state_bottle_retail_df[['state_bottle_retail__c']]

# Sales
sales_df = df.groupby(by=['date__c'], dropna=False).sum()
sales_df = sales_df[['sale_dollars__c']]

df = pd.concat(
        [
        	date_df,
        	store_number_df,
            city_df,
            zip_code_df,
            category_df,
            vendor_number_df,
            # item_number_df,
            cluster_df,
            pack_df,
            state_bottle_retail_df,
            sales_df
        ],
        axis=1
    )
ignore_columns = [
    'pack__c',
    'sale_dollars__c'
]
# X_columns = ['date_quarter__c', 'date_dow__c']
X_columns = [i for i in df.columns.tolist() if i not in ignore_columns]
X = df[X_columns]
y_columns = [i for i in df.columns.tolist() if i not in X_columns]
y = df[y_columns]

# ignore_columns = [
# 	'sale_dollars__c'
# ]
# X_columns = [i for i in df.columns.tolist() if i not in ignore_columns]

train_size = 0.8
X_train = X[:int(X.shape[0]*train_size)]
X_test = X[int(X.shape[0]*train_size):]
y_train = y[:int(X.shape[0]*train_size)]
y_test = y[int(X.shape[0]*train_size):]

# # Linear Regression
# regressor = LinearRegression()
# regressor.fit(X_train, y_train)
# pd.DataFrame(regressor.coef_, X.columns, columns=['Coefficient'])
# y_pred = regressor.predict(X_test)
# y_test_sales = y_test['sale_dollars__c'].tolist()
# y_pred_sales = [i[-1] for i in y_pred]
# pd.DataFrame({'Actual': y_test_sales, 'Predicted': y_pred_sales})
# print('Root Mean Squared Error:', np.sqrt(metrics.mean_squared_error(y_test_sales, y_pred_sales)))

# # BayesianRidge
# regressor = BayesianRidge()
# regressor.fit(X_train, y_train)
# pd.DataFrame(regressor.coef_, X.columns, columns=['Coefficient'])
# y_pred = regressor.predict(X_test)
# y_test_sales = y_test['sale_dollars__c'].tolist()
# y_pred_sales = [i[-1] for i in y_pred]
# pd.DataFrame({'Actual': y_test_sales, 'Predicted': y_pred_sales})
# print('Root Mean Squared Error:', np.sqrt(metrics.mean_squared_error(y_test_sales, y_pred_sales)))

# # Elastic Net
# regressor = ElasticNet()
# regressor.fit(X_train, y_train)
# pd.DataFrame(regressor.coef_, X.columns, columns=['Coefficient'])
# y_pred = regressor.predict(X_test)
# y_test_sales = y_test['sale_dollars__c'].tolist()
# y_pred_sales = [i[-1] for i in y_pred]
# pd.DataFrame({'Actual': y_test_sales, 'Predicted': y_pred_sales})
# print('Root Mean Squared Error:', np.sqrt(metrics.mean_squared_error(y_test_sales, y_pred_sales)))

# RandomForest Regressor
regressor = RandomForestRegressor(random_state=21)
regressor.fit(X_train, y_train)
y_pred = regressor.predict(X_test)
y_test_sales = y_test['sale_dollars__c'].tolist()
y_pred_sales = [i[-1] for i in y_pred]
test_result = pd.DataFrame({
	'Actual': y_test_sales,
	'Predicted': y_pred_sales
})
test_result.index = X_test.index
print('Root Mean Squared Error:', np.sqrt(metrics.mean_squared_error(y_test_sales, y_pred_sales)))

# # RandomForest Regressor
# regressor = RandomForestRegressor()
# regressor.fit(X_train, y_train)
# y_pred = regressor.predict(X_test)
# y_test_sales = y_test['pack__c'].tolist()
# y_pred_sales = [i[-3] for i in y_pred]
# pd.DataFrame({'Actual': y_test_sales, 'Predicted': y_pred_sales})
# print('Root Mean Squared Error:', np.sqrt(metrics.mean_squared_error(y_test_sales, y_pred_sales)))

# # RandomForest Regressor
# regressor = RandomForestRegressor()
# regressor.fit(X_train, y_train)
# y_pred = regressor.predict(X_test)
# y_test_sales = y_test['state_bottle_retail__c'].tolist()
# y_pred_sales = [i[-2] for i in y_pred]
# pd.DataFrame({'Actual': y_test_sales, 'Predicted': y_pred_sales})
# print('Root Mean Squared Error:', np.sqrt(metrics.mean_squared_error(y_test_sales, y_pred_sales)))

def get_quarter_dow(date='2017-11-01'):
	year, month, day = date.split('-')
	d = datetime.datetime(int(year), int(month), int(day))
	if int(month) <= 3:
		date_quarter__c = 1
	elif int(month) <= 6:
		date_quarter__c = 2
	elif int(month) <= 9:
		date_quarter__c = 3
	else:
		date_quarter__c = 4
	date_dow__c = d.weekday()
	return {
		'date_quarter__c': date_quarter__c,
		'date_dow__c': date_dow__c
	}

def get_next_n_days(date='2017-11-01', n=10):
	year, month, day = date.split('-')
	d = datetime.datetime(int(year), int(month), int(day))
	results = [d + datetime.timedelta(days=i) for i in range(n)]
	return [str(i.date()) for i in results]

def get_test_data(df, date='2017-11-01', n=10):
	date__c = get_next_n_days(date, n)
	date_quarter__c = [float( get_quarter_dow(i)['date_quarter__c'] ) for i in date__c]
	date_dow__c = [float( get_quarter_dow(i)['date_dow__c'] )for i in date__c]
	test_data = pd.DataFrame({
		'date__c': date__c,
		'date_quarter__c': date_quarter__c,
		'date_dow__c': date_dow__c
	})
	test_data = test_data.merge(
		df.groupby(by=['date_quarter__c', 'date_dow__c'], dropna=False).mean(),
		how='inner',
		on=['date_quarter__c', 'date_dow__c']
	).sort_values('date__c')
	ignores = [
		'pack__c',
		'sale_dollars__c'
	]
	columns = ['date__c']
	columns += [i for i in df.columns if i not in ignores]
	result_df = test_data[columns]
	result_df.set_index('date__c')
	return result_df

def get_test_result(df, date='2017-11-01', n=10):
	test_data_df = get_test_data(df, date='2017-11-01', n=10)
	y_pred = regressor.predict(test_data_df.drop(columns=['date__c']))
	predict_result = pd.DataFrame({
		'Actual': [np.nan for i in y_pred],
		'Predicted': [i[-1] for i in y_pred]
	})
	predict_result.index = test_data_df['date__c']
	result = pd.concat([
		test_result[-20:],
		predict_result
	])
	return result


result = get_test_result(df, date='2017-11-01', n=10)
sns.lineplot(data=result)
plt.show()
