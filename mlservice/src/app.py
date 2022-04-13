from flask import Flask
from os.path import exists
import psycopg2
import pandas as pd

from modules.features_by_store import create_feature_pickle
from modules.k_means import create_k_means_pickle
from modules.ui_data import get_pca_coords, reverse_one_hot

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

print('checking for features_by_store.pkl', flush=True)
if not exists('./src/modules/features_by_store.pkl'):
    print('did not detect ./src/modules/features_by_store.pkl; building now', flush=True)
    create_feature_pickle()
    print('done building ./src/modules/features_by_store.pkl', flush=True)
else:
    print('found existing feature_by_store.pkl', flush=True)

print('checking for existing k_means.pkl')        
if not exists('./src/modules/k_means.pkl'):
    print('did not detect ./src/modules/k_means.pkl; building now', flush=True)
    create_k_means_pickle()
    print('done building ./src/modules/k_means.pkl', flush=True)
else:
    print('found existing k_means.pkl', flush=True)

features_by_store_cached = pd.read_pickle('./src/modules/features_by_store.pkl')
k_means_cached = pd.read_pickle('./src/modules/k_means.pkl')

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