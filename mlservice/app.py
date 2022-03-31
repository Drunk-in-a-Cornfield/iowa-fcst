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

if __name__ == "__main__":
    app.run(debug=True)