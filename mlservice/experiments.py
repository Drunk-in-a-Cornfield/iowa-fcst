import pandas as pd
import numpy as np
import datetime as dt

import matplotlib.pyplot as plt
from sklearn.linear_model import LinearRegression

"""
Do some value conversions
"""
def transform_columns(df):
	df["State Bottle Cost"] = df["State Bottle Cost"].str.replace("$", "").astype(float)
	df["State Bottle Retail"] = df["State Bottle Retail"].str.replace("$", "").astype(float)
	df["Sale (Dollars)"] = df["Sale (Dollars)"].str.replace("$", "").astype(float)

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


if __name__ == "__main__":
	print("hi")
	pd.set_option('display.max_colwidth', None)
	pd.set_option("display.max_columns", None)

	data = pd.read_csv("data/Iowa_Liquor_Sales.csv", parse_dates=[1])
	data = data.sort_values(by=['Date'])
	data = transform_columns(data)

	#plot_state_sales_per_day(data)
	#plot_polk_county_sales(data)
	predict_polk_county_sales_per_week_linear(data)

