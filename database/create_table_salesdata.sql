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

COPY salesdata FROM '/share/database/Iowa_Liquor_Sales.csv' CSV HEADER;