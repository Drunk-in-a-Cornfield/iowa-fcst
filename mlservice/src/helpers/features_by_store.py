from sqlalchemy import create_engine
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
    cursor = db_connection.cursor()
    cursor.execute(query)
    return cursor.fetchall()

# # Store Name by Store Number
# def create_feature_store_name_by_store_number():
#     df = pd.read_sql(
#         """
#         SELECT
#             DISTINCT store_number__c AS store_number,
#             MAX(store_name__c) AS store_name
#         FROM public.salesdata2
#         GROUP BY store_number__c
#         ORDER BY store_number__c
#         """,
#         db_connection
#     )
#     return df

# # Address by Store Number
# def create_feature_address_by_store_number():
#     df = pd.read_sql(
#         """
#         SELECT
#             DISTINCT store_number__c AS store_number,
#             MAX(address__c) AS address
#         FROM public.salesdata2
#         GROUP BY store_number__c
#         ORDER BY store_number__c
#         """,
#         db_connection
#     )
#     return df

# City by Store Number
def create_feature_city_by_store_number():
    df = pd.read_sql(
        """
        SELECT
            DISTINCT store_number__c AS store_number,
            MAX(city__c) AS city
        FROM public.salesdata2
        GROUP BY store_number__c
        ORDER BY store_number__c
        """,
        db_connection
    )
    df.index = df['store_number']
    df = pd.get_dummies(df.city, prefix='city')
    return df

# Zip Code by Store Number
def create_feature_zip_code_by_store_number():
    df = pd.read_sql(
        """
        SELECT
            DISTINCT store_number__c AS store_number,
            MAX(zip_code__c) AS zip_code
        FROM public.salesdata2
        GROUP BY store_number__c
        ORDER BY store_number__c
        """,
        db_connection
    )
    df.index = df['store_number']
    df = pd.get_dummies(df.zip_code, prefix='zip_code')
    return df

# # Store Location by Store Number
# def create_feature_store_location_by_store_number():
#     df = pd.read_sql(
#         """
#         SELECT
#             DISTINCT store_number__c AS store_number,
#             MAX(store_location__c) AS store_location
#         FROM public.salesdata2
#         GROUP BY store_number__c
#         ORDER BY store_number__c
#         """,
#         db_connection
#     )
#     return df

# County Number by Store Number
def create_feature_county_number_by_store_number():
    df = pd.read_sql(
        """
        SELECT
            DISTINCT store_number__c AS store_number,
            MAX(county_number__c) AS county_number
        FROM public.salesdata2
        GROUP BY store_number__c
        ORDER BY store_number__c
        """,
        db_connection
    )
    df.index = df['store_number']
    df = pd.get_dummies(df.county_number, prefix='county_number')
    return df
    
# # County by Store Number
# def create_feature_county_by_store_number():
#     df = pd.read_sql(
#         """
#         SELECT
#             DISTINCT store_number__c AS store_number,
#             MAX(county__c) AS county
#         FROM public.salesdata2
#         GROUP BY store_number__c
#         ORDER BY store_number__c
#         """,
#         db_connection
#     )
#     return df

# Category by Store Number Pivot
def create_feature_category_by_store_number_pivot():
    df = pd.read_sql(
        """
        SELECT
            DISTINCT store_number__c AS store_number,
            CONCAT(
                'category',
                '_',
                category__c
            ) AS category,
            COUNT(*) AS c
        FROM public.salesdata2
        GROUP BY
            store_number__c,
            category__c
        """,
        db_connection
    )
    df = df.pivot(index='store_number', columns='category', values='c')
    df = df.fillna(0)
    df = df.apply(pd.to_numeric)
    return df

# Vendor Number by Store Number Pivot
def create_feature_vendor_number_by_store_number_pivot():
    df = pd.read_sql(
        """
        SELECT
            DISTINCT store_number__c AS store_number,
            CONCAT(
                'vendor_number',
                '_',
                vendor_number__c
            ) AS vendor_number,
            COUNT(*) AS c
        FROM public.salesdata2
        GROUP BY
            store_number__c,
            vendor_number__c
        """,
        db_connection
    )
    df = df.pivot(index='store_number', columns='vendor_number', values='c')
    df = df.fillna(0)
    df = df.apply(pd.to_numeric)
    return df

# Item Number by Store Number Pivot
def create_feature_item_number_by_store_number_pivot():
    df = pd.read_sql(
        """
        SELECT
            DISTINCT store_number__c AS store_number,
            CONCAT(
                'item_number',
                '_',
                item_number__c
            ) AS item_number,
            COUNT(*) AS c
        FROM public.salesdata2
        GROUP BY
            store_number__c,
            item_number__c
        """,
        db_connection
    )
    df = df.pivot(index='store_number', columns='item_number', values='c')
    df = df.fillna(0)
    df = df.apply(pd.to_numeric)
    return df

# Average Monthly Pack by Store Number Pivot
def create_feature_average_monthly_pack_by_store_number_pivot():
    df = pd.read_sql(
        """
        SELECT
            store_number,
            pack,
            ROUND(SUM(c) / COUNT(*), 2) AS average_monthly_pack
        FROM (
            SELECT
                DISTINCT store_number__c AS store_number,
                date_year_month__c AS year_month,
                CONCAT(
                    'pack',
                    '_',
                    pack__c
                ) AS pack,
                COUNT(*) AS c
            FROM public.salesdata2
            GROUP BY
                store_number__c,
                date_year_month__c,
                pack__c
        ) a
        GROUP BY
            store_number,
            pack
        """,
        db_connection
    )
    df = df.pivot(index='store_number', columns='pack', values='average_monthly_pack')
    df = df.fillna(0)
    df = df.apply(pd.to_numeric)
    return df

# Average Monthly Bottle Volume ML by Store Number Pivot
def create_feature_average_monthly_bottle_volume_ml_by_store_number_pivot():
    df = pd.read_sql(
        """
        SELECT
            store_number,
            bottle_volume_ml,
            ROUND(SUM(c) / COUNT(*), 2) AS average_monthly_bottle_volume_ml
        FROM (
            SELECT
                DISTINCT store_number__c AS store_number,
                date_year_month__c AS year_month,
                CONCAT(
                    'bottle_volume_ml',
                    '_',
                    bottle_volume_ml__c
                ) AS bottle_volume_ml,
                COUNT(*) AS c
            FROM public.salesdata2
            GROUP BY
                store_number__c,
                date_year_month__c,
                bottle_volume_ml__c
        ) a
        GROUP BY
            store_number,
            bottle_volume_ml
        """,
        db_connection
    )
    df = df.pivot(index='store_number', columns='bottle_volume_ml', values='average_monthly_bottle_volume_ml')
    df = df.fillna(0)
    df = df.apply(pd.to_numeric)
    return df

# Average Monthly Bottles Sold by Store Number
def create_feature_average_monthly_bottles_sold_by_store_number():
    df = pd.read_sql(
        """
        SELECT
            store_number,
            ROUND(SUM(total_bottles_sold) / COUNT(*), 2) AS average_monthly_bottles_sold
        FROM (
            SELECT
                store_number__c AS store_number,
                date_year_month__c AS year_month,
                SUM(bottles_sold__c) AS total_bottles_sold
            FROM public.salesdata2
            GROUP BY
                store_number__c,
                date_year_month__c
        ) a
        GROUP BY store_number
        """,
        db_connection
    )
    df.index = df['store_number']
    df = df.apply(pd.to_numeric)
    return df

# Average Monthly Sales by Store Number
def create_feature_average_monthly_sales_by_store_number():
    df = pd.read_sql(
        """
        SELECT
            store_number,
            ROUND(SUM(total_sales) / COUNT(*), 2) AS average_monthly_sales
        FROM (
            SELECT
                store_number__c AS store_number,
                date_year_month__c AS year_month,
                SUM(sale_dollars__c) AS total_sales
            FROM public.salesdata2
            GROUP BY
                store_number__c,
                date_year_month__c
        ) a
        GROUP BY store_number
        """,
        db_connection
    )
    df.index = df['store_number']
    df = df.apply(pd.to_numeric)
    return df

# Average Monthly Profit by Store Number
def create_feature_average_monthly_profit_by_store_number():
    df = pd.read_sql(
        """
        SELECT
            store_number,
            ROUND(SUM(total_profit) / COUNT(*), 2) AS average_monthly_profit
        FROM (
            SELECT
                store_number__c AS store_number,
                date_year_month__c AS year_month,
                SUM(profit_dollars__c) AS total_profit
            FROM public.salesdata2
            GROUP BY
                store_number__c,
                date_year_month__c
        ) a
        GROUP BY store_number
        """,
        db_connection
    )
    df.index = df['store_number']
    df = df.apply(pd.to_numeric)
    return df

def create_feature_pickle():
    # feature_store_name_by_store_number_df = create_feature_store_name_by_store_number()
    # feature_address_by_store_number_df = create_feature_address_by_store_number()
    feature_city_by_store_number_df = create_feature_city_by_store_number()
    feature_zip_code_by_store_number_df = create_feature_zip_code_by_store_number()
    # feature_store_location_by_store_number_df = create_feature_store_location_by_store_number()
    feature_county_number_by_store_number_df = create_feature_county_number_by_store_number()
    # feature_county_by_store_number_df = create_feature_county_by_store_number()
    feature_category_by_store_number_pivot_df = create_feature_category_by_store_number_pivot()
    feature_vendor_number_by_store_number_pivot_df = create_feature_vendor_number_by_store_number_pivot()
    feature_item_number_by_store_number_pivot_df = create_feature_item_number_by_store_number_pivot()
    feature_average_monthly_pack_by_store_number_pivot_df = create_feature_average_monthly_pack_by_store_number_pivot()
    feature_average_monthly_bottle_volume_ml_by_store_number_pivot_df = create_feature_average_monthly_bottle_volume_ml_by_store_number_pivot()
    feature_average_monthly_bottles_sold_by_store_number_df = create_feature_average_monthly_bottles_sold_by_store_number()
    feature_average_monthly_sales_by_store_number_df = create_feature_average_monthly_sales_by_store_number()
    feature_average_monthly_profit_by_store_number_df = create_feature_average_monthly_profit_by_store_number()

    df = pd.concat(
        [
            feature_city_by_store_number_df,
            feature_zip_code_by_store_number_df,
            feature_county_number_by_store_number_df,
            feature_category_by_store_number_pivot_df,
            feature_vendor_number_by_store_number_pivot_df,
            feature_item_number_by_store_number_pivot_df,
            feature_average_monthly_pack_by_store_number_pivot_df,
            feature_average_monthly_bottle_volume_ml_by_store_number_pivot_df,
            feature_average_monthly_bottles_sold_by_store_number_df,
            feature_average_monthly_sales_by_store_number_df,
            feature_average_monthly_profit_by_store_number_df
        ],
        axis=1
    )

    columns = [i for i in df.columns.tolist() if i != 'store_number']
    df = df[columns]
    df.to_pickle('./src/helpers/features_by_store.pkl')