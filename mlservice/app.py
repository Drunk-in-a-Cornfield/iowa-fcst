from flask import Flask
import psycopg2

########################
### Database Connection
########################

hostname = 'postgres'
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

##########
### Flask
##########
app = Flask(__name__)

@app.route('/')
def hello_geek():
    return '<h1>Hello from Flask & Docker 5</h2>'

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
    app.run(host='0.0.0.0', debug=True)