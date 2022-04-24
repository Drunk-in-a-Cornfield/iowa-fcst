from functools import reduce
from sklearn import metrics
from sklearn import svm
from sklearn.svm import LinearSVR
from sklearn import tree
from sklearn.linear_model import BayesianRidge
from sklearn.linear_model import ElasticNet
from sklearn.linear_model import LinearRegression
from sklearn.ensemble import GradientBoostingRegressor
from sklearn.ensemble import RandomForestRegressor
from sklearn.model_selection import GridSearchCV
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import StandardScaler
import datetime
import matplotlib.pyplot as plt
import numpy as np
import os
import pandas as pd
import pickle
import psycopg2
import seaborn as sns

##################
### Predict Sales
##################
def transformation(df):
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
    #   df[['date__c']],
    #   pd.get_dummies(df.item_number__c, prefix='item_number')],
    #   1
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
    return df

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

def get_cluster_dict():
    path = '../custom_regressor/{county_number}_{county}.pkl'.format(
        county_number=county_number,
        county=county
    )
    if os.path.exists(path):
        with open(path, 'rb') as handle:
            result_dict = pickle.load(handle)
    else:
        factor_dict = {}
        test_result_dict = {}
        regressor_dict = {}
        df = df2.copy()
        for cluster in df['cluster__c'].drop_duplicates().tolist():
            try:
                df = df2.copy()
                df = df[df['cluster__c'] == cluster]
                df = transformation(df)
                X_columns = ['date_quarter__c', 'date_dow__c']
                X = df[X_columns]
                y_columns = [i for i in df.columns.tolist() if i not in X_columns]
                y = df[y_columns]
                train_size = 0.8
                X_train = X[:int(X.shape[0]*train_size)]
                X_test = X[int(X.shape[0]*train_size):]
                y_train = y[:int(X.shape[0]*train_size)]
                y_test = y[int(X.shape[0]*train_size):]
                if cluster == 2.0:
                    regressor = GradientBoostingRegressor()
                else:
                    regressor = RandomForestRegressor()
                regressor.fit(X_train, y_train['sale_dollars__c'])
                y_pred = regressor.predict(X_test)
                y_test_sales = y_test['sale_dollars__c'].tolist()
                test_result = pd.DataFrame({
                    'Actual': y_test_sales,
                    'Predicted': y_pred
                })
                factor = test_result['Actual'].sum()/test_result['Predicted'].sum()
                test_result['Predicted'] = test_result['Predicted'].apply(lambda x: x*factor)
                test_result.index = X_test.index
                y_pred = test_result['Predicted'].tolist()
                print('Root Mean Squared Error:', np.sqrt(metrics.mean_squared_error(y_test_sales, y_pred)))
                regressor_dict[cluster] = regressor
                factor_dict[cluster] = factor
                test_result_dict[cluster] = test_result
            except:
                pass
        result_dict = {
            'regressor_dict': regressor_dict,
            'factor_dict': factor_dict,
            'test_result_dict': test_result_dict
        }
        with open(path, 'wb') as handle:
            pickle.dump(result_dict, handle, protocol=pickle.HIGHEST_PROTOCOL)
    return result_dict

def get_prediction(df, cluster_dict, date='2017-10-15', n=40):
    regressor_dict = cluster_dict['regressor_dict']
    factor_dict = cluster_dict['factor_dict']
    results = []
    for cluster in [0.0, 1.0, 2.0]:
        try:
            regressor = regressor_dict[cluster]
            date__c = get_next_n_days(date, n)
            date_quarter__c = [float( get_quarter_dow(i)['date_quarter__c'] ) for i in date__c]
            date_dow__c = [float( get_quarter_dow(i)['date_dow__c'] )for i in date__c]
            test_data = pd.DataFrame({
                'date__c': date__c,
                'date_quarter__c': date_quarter__c,
                'date_dow__c': date_dow__c
            })
            y_pred = regressor.predict(test_data.set_index('date__c'))
            y_pred = [i*factor_dict[cluster] for i in y_pred]
            results.append(
                pd.DataFrame({
                    'date__c': test_data['date__c'],
                    'Predicted': y_pred
                })
            )
        except:
            pass
    result_df = reduce(lambda a, b: a.add(b, fill_value=0), results)
    result_df['date__c'] = results[0]['date__c'].tolist()
    result_df['date__c'] = result_df['date__c'].apply(lambda x:
        datetime.datetime(
            int(x.split('-')[0]),
            int(x.split('-')[1]),
            int(x.split('-')[2])
        ).date()
    )
    result_df = result_df.set_index('date__c')
    return result_df

def get_combined_result(pred_df):
    actual_df = df.groupby(by=['date__c']).sum()
    actual_df['Actual'] = actual_df['sale_dollars__c']
    actual = actual_df['Actual']
    combined_result = pred_df.merge(
        actual,
        how='outer',
        on=['date__c']
    ).sort_values('date__c')
    actual = combined_result.dropna()['Actual'].tolist()
    y_pred = combined_result.dropna()['Predicted'].tolist()
    print('Root Mean Squared Error:', np.sqrt(metrics.mean_squared_error(actual, y_pred)))
    return combined_result

def get_county_lookup():
    path = '../modules/county_lookup.pkl'
    if os.path.exists(path):
        df = pd.read_pickle(path)
    else:
        df = pd.read_sql(
            """
            SELECT
                DISTINCT county_number__c,
                county__c
            FROM public.salesdata2
            ORDER BY
                county_number__c
            """,
            db_connection
        )
        df.to_pickle(path)
    return df

def get_county_number(county):
    county_lookup_df = get_county_lookup()
    return int(county_lookup_df[county_lookup_df['county__c'] == county]['county_number__c'])


# Auto Generate Cluster Dict Pickle
def auto_cluster_dict_pickle():
    county_lookup_df = get_county_lookup()
    for county in county_lookup_df['county__c'].drop_duplicates().tolist():
        county_number = get_county_number(county)
        df = pd.read_pickle('../pickle/{county_number}_{county}.pkl'.format(
            county_number=county_number,
            county=county
        ))
        df2 = df.copy()
        cluster_dict = get_cluster_dict()
        pred_df = get_prediction(transformation(df), cluster_dict, date='2017-10-15', n=40)
        combined_result = get_combined_result(pred_df)


county = 'ALLAMAKEE'
county_number = get_county_number(county)
df = pd.read_pickle('../pickle/{county_number}_{county}.pkl'.format(
    county_number=county_number,
    county=county
))
df2 = df.copy()
cluster_dict = get_cluster_dict()
pred_df = get_prediction(transformation(df), cluster_dict, date='2017-10-15', n=40)
combined_result = get_combined_result(pred_df)

sns.lineplot(data=combined_result[-50:])
plt.show()
