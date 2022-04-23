import pandas as pd
import numpy as np
import datetime as dt
import random

import matplotlib.pyplot as plt
from sklearn.linear_model import LinearRegression
from sklearn.preprocessing import LabelBinarizer

from keras.models import Sequential
from keras.layers import SimpleRNN, Dense

counties = ['ADAIR', 'ADAMS', 'ALLAMAKEE', 'APPANOOSE', 'AUDUBON', 'BENTON', 'BLACK HAWK', 'BOONE', 'BREMER', 'BUCHANAN', 'BUENA VIST', 'BUENA VISTA', 'BUTLER', 'CALHOUN', 'CARROLL', 'CASS', 'CEDAR', 'CERRO GORD', 'CERRO GORDO', 'CHEROKEE', 'CHICKASAW', 'CLARKE', 'CLAY', 'CLAYTON', 'CLINTON', 'CRAWFORD', 'DALLAS', 'DAVIS', 'DECATUR', 'DELAWARE', 'DES MOINES', 'DICKINSON', 'DUBUQUE', 'EMMET', 'FAYETTE', 'FLOYD', 'FRANKLIN', 'FREMONT', 'GREENE', 'GRUNDY', 'GUTHRIE', 'HAMILTON', 'HANCOCK', 'HARDIN', 'HARRISON', 'HENRY', 'HOWARD', 'HUMBOLDT', 'IDA', 'IOWA', 'JACKSON', 'JASPER', 'JEFFERSON', 'JOHNSON', 'JONES', 'KEOKUK', 'KOSSUTH', 'LEE', 'LINN', 'LOUISA', 'LUCAS', 'LYON', 'MADISON', 'MAHASKA', 'MARION', 'MARSHALL', 'MILLS', 'MITCHELL', 'MONONA', 'MONROE', 'MONTGOMERY', 'MUSCATINE', "O'BRIEN", 'OBRIEN', 'OSCEOLA', 'PAGE', 'PALO ALTO', 'PLYMOUTH', 'POCAHONTAS', 'POLK', 'POTTAWATTA', 'POTTAWATTAMIE', 'POWESHIEK', 'RINGGOLD', 'SAC', 'SCOTT', 'SHELBY', 'SIOUX', 'STORY', 'TAMA', 'TAYLOR', 'UNION', 'VAN BUREN', 'WAPELLO', 'WARREN', 'WASHINGTON', 'WAYNE', 'WEBSTER', 'WINNEBAGO', 'WINNESHIEK', 'WOODBURY', 'WORTH', 'WRIGHT']
counties_encoding = {county: num for num, county in enumerate(counties) }
"""
Do some value conversions
"""
def transform_columns(df):
	df["State Bottle Cost"] = df["State Bottle Cost"].str.replace("$", "").astype(float)
	df["State Bottle Retail"] = df["State Bottle Retail"].str.replace("$", "").astype(float)
	df["tx_amt"] = df["Sale (Dollars)"].str.replace("$", "").astype(float)
	df["County"] = df["County"].str.upper()

	return df
"""
Use a linear regression model to predict sales per day (the result is super sad but this code block is good for copy/ pasting for other models)
"""
def predict_polk_county_sales_per_week_linear(df):
	# Polk county is the most populous, keeping it simple for now
	polk_data = df[df["County"] == "POLK"]

	# Arbitrary date cutoff
	polk_daily_sales_train_raw = polk_data[(polk_data['Date'] <= '2017-05-01')]
	polk_daily_sales_test_raw = polk_data[(polk_data['Date'] > '2017-05-01')]

	polk_daily_sales_train['Date'] = polk_daily_sales_train_raw['Date'].map(dt.datetime.toordinal)
	polk_daily_sales_test['Date'] = polk_daily_sales_test_raw['Date'].map(dt.datetime.toordinal)

	polk_daily_sale_train_count = polk_daily_sales_train.groupby(polk_daily_sales_train.Date)
	polk_daily_sales_train_series = polk_daily_sale_train_count["Date"].count()

	polk_daily_sale_test_count = polk_daily_sales_test.groupby(polk_daily_sales_test.Date)
	polk_daily_sales_test_series = polk_daily_sale_test_count["Date"].count()

	# Use each day as X input, feed values of series as target values
	train_ordinal_dates = polk_daily_sales_train_series.index.to_numpy().reshape(-1, 1)
	lr = LinearRegression().fit(train_ordinal_dates, polk_daily_sales_train_series.to_numpy())

	test_ordinal_dates = polk_daily_sales_test_series.index.to_numpy().reshape(-1, 1)
	predictions = lr.predict(test_ordinal_dates)

	train_y_values = polk_daily_sales_train_series.to_numpy()
	test_y_values = predictions

	train_x_values = polk_daily_sales_train_raw.groupby(["Date"]).count().index
	test_x_values = polk_daily_sales_test_raw.groupby(["Date"]).count().index

	plt.plot(train_x_values, train_y_values, 'b')
	plt.plot(test_x_values, test_y_values, 'r')
	plt.show()

"""
Just an exploratory plot to visualize sales. (They're kinda flat, might need to explore other counties)
"""
def plot_polk_county_sales_per_week(df):
	# Polk county is the most populous, keeping it simple for now
	polk_data = df[df["County"] == "POLK"]
	
	polk_sale_number_by_day = polk_data.groupby(polk_data.Date.dt.to_period("W")).count()["Date"]
	polk_sale_number_by_day.index = polk_sale_number_by_day.index.to_timestamp()

	plt.plot(polk_sale_number_by_day, marker='o')
	plt.show()

"""
Just an exploratory plot to visualize sales statewide
"""
def plot_state_sales_per_week(df):
	state_sales_by_month = data.groupby(data.Date.dt.to_period("W")).count()["Date"]
	state_sales_by_month.index = state_sales_by_month.index.to_timestamp()

	plt.plot(state_sales_by_month, marker='o')
	plt.show()


def deep_learning_regression_by_county(df):
	time_steps = 6
	weekly_sales_by_county = df.groupby([df.Date, df.County])['tx_amt'].sum()

	samples = []
	# Create a ton of samples of n step series, we'll shuffle them later so no harm in some overlap between the series'
	for c in counties:
		county_level_stats = weekly_sales_by_county[weekly_sales_by_county.index.isin([c], level=1)]
		for i in range(len(county_level_stats) - time_steps):
			samples.append(county_level_stats[range(i, i + time_steps)])
	random.shuffle(samples)

	y_samples = []
	x_samples = []
	for sample in samples:
		y_samples.append(sample[-1])
		sample_x_features = []
		for i in range(len(sample)):
			feature_vec = np.zeros((len(counties) + 2))
			feature_vec[0] = sample.index[i][0].toordinal()
			feature_vec[1] = sample.index[i][0].weekday()
			feature_vec[2 + counties_encoding[sample.index[i][1]]] = 1
			sample_x_features.append(feature_vec)
		x_samples.append(sample_x_features)

	y_samples = np.array(y_samples)
	x_samples = np.array(x_samples)


	model = Sequential()
	model.add(SimpleRNN(1, input_shape=(6,105), activation ='linear'))
	model.compile(loss='mean_squared_error', optimizer='adam')
	model.fit(x_samples, y_samples, batch_size=1024, epochs=1000)

	print(model.predict(np.array([x_samples[103]])))

if __name__ == "__main__":
	print("hi")
	pd.set_option('display.max_colwidth', None)
	pd.set_option("display.max_columns", None)

	data = pd.read_csv("../../data/Iowa_Liquor_Sales.csv", parse_dates=[1])
	data = data.sort_values(by=['Date'])
	data = transform_columns(data)

	#plot_state_sales_per_day(data)
	#plot_polk_county_sales(data)
	deep_learning_regression_by_county(data)

