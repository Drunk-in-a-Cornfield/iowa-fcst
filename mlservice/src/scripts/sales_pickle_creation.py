import os
import pandas as pd
import psycopg2


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

####################
### Pickle Creation
####################
county_lookup_pkl_path = './src/modules/county_lookup.pkl'
k_means_pkl_path ='./src/modules/k_means.pkl'
pickle_path = './src/pickle/'

def get_county_lookup():
    if os.path.exists(county_lookup_pkl_path):
        df = pd.read_pickle(county_lookup_pkl_path)
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
        df.to_pickle(county_lookup_pkl_path)
    return df

def get_county_number(county):
    county_lookup_df = get_county_lookup()
    return int(county_lookup_df[county_lookup_df['county__c'] == county]['county_number__c'])

def store_number2cluster(store_number):
    cluster_df = pd.read_pickle(k_means_pkl_path)
    return cluster_df.loc[store_number].cluster

def get_sales_data(county):
    county_number = get_county_number(county)
    path = pickle_path + '{county_number}_{county}.pkl'.format(
        county=county,
        county_number=county_number
    )
    if not os.path.exists(path):
        df = pd.read_pickle(path)
    else:
        df = pd.read_sql(
            """
            SELECT
                date__c,
                date_year__c,
                date_month__c,
                date_day__c,
                date_quarter__c,
                date_dow__c,
                store_number__c,
                city__c,
                zip_code__c,
                county_number__c,
                category__c,
                vendor_number__c,
                item_number__c,
                pack__c,
                bottle_volume_ml__c,
                state_bottle_retail__c,
                sale_dollars__c
            FROM public.salesdata2
            WHERE county_number__c = {county_number}
            """.format(
                county_number=county_number
            ),
            db_connection
        )
        cluster_dict = {}
        for store_number in df['store_number__c'].drop_duplicates().tolist():
            cluster_dict[store_number] = store_number2cluster(store_number)
        df['cluster__c'] = df['store_number__c'].apply(lambda x: cluster_dict[x])
        df = df.sort_values('date__c')
        df.to_pickle(path)
    return df

def auto_sales_pickle():
    county_lookup_df = get_county_lookup()
    for county in county_lookup_df['county__c'].drop_duplicates().tolist():
        get_sales_data(county)

