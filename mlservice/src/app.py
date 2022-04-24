from flask import Flask, request, render_template, send_file
from os.path import exists
import datetime
import json
import os
import pandas as pd
import psycopg2

from modules.features_by_store import create_feature_pickle
from modules.k_means import create_k_means_pickle
from modules.ui_data import get_pca_coords, reverse_one_hot
from modules.serve_rnn_model import serve_model, load_model
from scripts.custom_regressor import serve_custom_regression_model, get_cluster_dict

########################
### Database Connection
########################
hostname = 'database'
username = 'root'
password = 'root'
database = 'liquor_sales'

db_connection = psycopg2.connect(
    host=hostname,
    user=username,
    password=password,
    dbname=database
)

def query(connection, query) :
    cursor = connection.cursor()
    cursor.execute(query)
    return cursor.fetchall()

##############################
### Create / load pickle files
##############################
features_by_store_pkl_path = './src/modules/features_by_store.pkl'
k_means_pkl_path = './src/modules/k_means.pkl'

print('checking for {path}'.format(path=features_by_store_pkl_path), flush=True)
if not exists(features_by_store_pkl_path):
    print('did not detect {path}; building now'.format(path=features_by_store_pkl_path), flush=True)
    create_feature_pickle()
    print('done building {path}'.format(path=features_by_store_pkl_path), flush=True)
else:
    print('found existing {path}'.format(path=features_by_store_pkl_path), flush=True)

print('checking for existing {path}'.format(path=k_means_pkl_path))        
if not exists(k_means_pkl_path):
    print('did not detect {path}; building now'.format(path=k_means_pkl_path), flush=True)
    create_k_means_pickle()
    print('done building {path}'.format(path=k_means_pkl_path), flush=True)
else:
    print('found existing {path}'.format(path=k_means_pkl_path), flush=True)

features_by_store_cached = pd.read_pickle(features_by_store_pkl_path)
k_means_cached = pd.read_pickle(k_means_pkl_path)

##########
### Flask
##########
app = Flask(__name__)

@app.route('/')
def hello_geek():
    return '<h1>Hello from Flask & Docker 5</h2>'

@app.route('/cluster-data')
def cluster_data():
    # reverse one hot encoding, preserving row order
    df_k_means = reverse_one_hot(k_means_cached)
    
    # get pca-0 and pca-1 coordinates, preserving row order
    df_pca_coords = get_pca_coords(features_by_store_cached)
    
    # join the two dataframes
    df_pca_coords.index = df_k_means.index
    df_all = df_k_means.join(df_pca_coords)
    
    return df_all.to_json()

# @app.route('/forecast')
# def forecast():
#     county_string = request.args.get('county_string')
#     date_zero = request.args.get('date_zero')

#     deep_learning_result = serve_model(county_string, datetime.datetime.strptime(date_zero, "%a, %d %b %Y %H:%M:%S %Z"), 10, load_model())

#     return json.dumps({
#         'deep_learning_fcst':[f.astype(float) for f in deep_learning_result]
#     })

@app.route('/forecast')
def forecast2():
    county_string = request.args.get('county_string')
    date_zero = request.args.get('date_zero')
    # county_string = 'POLK'
    # date_zero = '2017-10-15'
    get_cluster_dict(county=county_string)
    pred_df = serve_custom_regression_model(
        county=county_string,
        date_zero=str(datetime.datetime.strptime(date_zero, "%a, %d %b %Y %H:%M:%S %Z").date()),
        n=10
    )
    return json.dumps({
        'deep_learning_fcst': [float(f) for f in pred_df['Predicted'].tolist()]
    })

@app.route('/sales_by_year')
def sales_by_year():
    results = query(
        db_connection,
        """
            SELECT * FROM public.salesdata
            LIMIT 10
        """
    )
    return str(results)

@app.route('/eda/sales_by_year')
def test():
    from flask import Flask, request, render_template, send_file
    from matplotlib import pyplot as plt
    from matplotlib.backends.backend_agg import FigureCanvasAgg as FigureCanvas
    import base64
    import io
    import pandas as pd
    import seaborn as sns
    
    result_df = pd.read_sql(
        """
        SELECT
            EXTRACT(year FROM "Date") AS sales_year,
            -- EXTRACT(month FROM "Date") AS sales_month,
            -- EXTRACT(day FROM "Date") AS sales_day,
            SUM( CAST( REPLACE("Sale (Dollars)", '$', '') AS DECIMAL(18, 2) ) ) AS total_sales
        FROM public.salesdata
        GROUP BY
            EXTRACT(year FROM "Date")
        """,
        db_connection
    )

    sns.set_style('dark')

    x = result_df['sales_year'].tolist()
    y = result_df['total_sales'].tolist()

    fig,ax = plt.subplots(figsize=(6,6))
    ax = sns.set(style='darkgrid')
    sns.lineplot(
        data=result_df,
        x='sales_year',
        y='total_sales',
        marker='o'
    )
    canvas = FigureCanvas(fig)
    img = io.BytesIO()
    fig.savefig(img)
    img.seek(0)
    return send_file(img, mimetype='img/png')

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=4000, debug=True)