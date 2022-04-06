-- this script is copied into the PG container and runs at build-time

-- create salesdata table
CREATE TABLE IF NOT EXISTS salesdata (
  "Invoice/Item Number" TEXT UNIQUE NOT NULL,
  "Date" DATE,
  "Store Number" INTEGER,
  "Store Name" TEXT,
  "Address" TEXT,
  "City" TEXT,
  "Zip Code" TEXT,
  "Store Location" TEXT,
  "County Number" INTEGER,
  "County" TEXT,
  "Category" INTEGER,
  "Category Name" TEXT,
  "Vendor Number" INTEGER,
  "Vendor Name" TEXT,
  "Item Number" INTEGER,
  "Item Description" TEXT,
  "Pack" INTEGER,
  "Bottle Volume (ml)" INTEGER,
  "State Bottle Cost" TEXT,
  "State Bottle Retail" TEXT,
  "Bottles Sold" INTEGER,
  "Sale (Dollars)" TEXT,
  "Volume Sold (Liters)" DOUBLE PRECISION,
  "Volume Sold (Gallons)" DOUBLE PRECISION
);

COPY salesdata FROM '/share/Iowa_Liquor_Sales.csv' CSV HEADER;

-- create salesdata2 from Ken's etl.sql

CREATE TABLE IF NOT EXISTS public.salesdata2 AS 
SELECT 
	*,
	"Invoice/Item Number" AS invoice_item_number__c,
	"Date" AS date__c,  
	CAST( EXTRACT(year FROM "Date") AS INTEGER ) AS date_year__c,
	CAST( EXTRACT(month FROM "Date") AS INTEGER ) AS date_month__c,
	CONCAT(
		CAST( EXTRACT(year FROM "Date") AS VARCHAR),
		'-',
		LPAD( CAST( EXTRACT(month FROM "Date") AS VARCHAR), 2, '0' )
	) AS date_year_month__c,
	CAST( EXTRACT(quarter FROM "Date") AS INTEGER ) AS date_quarter__c,
	CAST( EXTRACT(day FROM "Date") AS INTEGER ) AS date_day__c,
	CAST( EXTRACT(dow FROM "Date") AS INTEGER ) AS date_dow__c,
	"Store Number" AS store_number__c,
	UPPER("Store Name") AS store_name__c,
	UPPER("Address") AS address__c,
	UPPER("City") AS city__c,
	CASE
		WHEN "Zip Code" = '712-2' THEN '51529'
		ELSE "Zip Code"
	END AS zip_code__c,
	UPPER("Store Location") AS store_location__c,
	"County Number" AS county_number__c,
	UPPER("County") AS county__c,
	"Category" AS category__c,
	UPPER("Category Name") AS category_name__c,
	"Vendor Number" AS vendor_number__c,
	UPPER("Vendor Name") AS vendor_name__c,
	"Item Number" AS item_number__c,
	UPPER("Item Description") AS item_description__c,
	"Pack" AS pack__c,
	"Bottle Volume (ml)" AS bottle_volume_ml__c,
	CAST( REPLACE("State Bottle Cost", '$', '') AS DECIMAL(38, 2) ) AS state_bottle_cost__c,
	CAST( REPLACE("State Bottle Retail", '$', '') AS DECIMAL(38, 2) ) AS state_bottle_retail__c,
	"Bottles Sold" AS bottles_sold__c,
	CAST( REPLACE("Sale (Dollars)", '$', '') AS DECIMAL(38, 2) ) AS sale_dollars__c,
	"Volume Sold (Liters)" AS volume_sold_liters__c,
	"Volume Sold (Gallons)" AS volume_sold_gallons__c,
	CAST( REPLACE("State Bottle Cost", '$', '') AS DECIMAL(38, 2) ) * "Bottles Sold" AS cost_dollars__c,
	CAST( REPLACE("Sale (Dollars)", '$', '') AS DECIMAL(38, 2) ) - (CAST( REPLACE("State Bottle Cost", '$', '') AS DECIMAL(38, 2) ) * "Bottles Sold") AS profit_dollars__c
FROM public.salesdata;

-- remove nulls

DELETE FROM public.salesdata2
WHERE
	invoice_item_number__c IS NULL
	OR date__c IS NULL
	OR store_number__c IS NULL
	OR zip_code__c IS NULL
	OR county_number__c IS NULL
	OR category__c IS NULL
	OR vendor_number__c IS NULL
	OR item_number__c IS NULL
	OR pack__c IS NULL
	OR bottle_volume_ml__c IS NULL
	OR bottle_volume_ml__c = 0
	OR state_bottle_cost__c IS NULL
	OR state_bottle_cost__c = 0
	OR state_bottle_retail__c IS NULL
	OR state_bottle_retail__c = 0
	OR bottles_sold__c IS NULL
	OR bottles_sold__c = 0
	OR sale_dollars__c IS NULL
	OR sale_dollars__c = 0
	OR volume_sold_liters__c IS NULL
	OR volume_sold_liters__c = 0
	OR volume_sold_gallons__c IS NULL
	OR volume_sold_gallons__c = 0;