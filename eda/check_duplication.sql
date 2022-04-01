SELECT
	b."Invoice/Item Number",
	*
FROM
(
	SELECT
	--  "Invoice/Item Number",
	  "Date",
	  "Store Number",
	  "Store Name",
	  "Address",
	  "City",
	  "Zip Code",
      "Store Location",
	  "County Number",
	  "County",
	  "Category",
	  "Category Name",
	  "Vendor Number",
	  "Vendor Name",
      "Item Number",
	  "Item Description",
	  "Pack",
	  "Bottle Volume (ml)",
	  "State Bottle Cost",
	  "State Bottle Retail",
	  "Bottles Sold",
	  "Sale (Dollars)",
	  "Volume Sold (Liters)",
      "Volume Sold (Gallons)",
	  COUNT(*)
	FROM public.salesdata
	GROUP BY
	--  "Invoice/Item Number",
	  "Date",
      "Store Number",
	  "Store Name",
	  "Address",
	  "City",
	  "Zip Code",
      "Store Location",
      "County Number",
	  "County",
      "Category",
	  "Category Name",
      "Vendor Number",
	  "Vendor Name",
      "Item Number",
	  "Item Description",
	  "Pack",
	  "Bottle Volume (ml)",
	  "State Bottle Cost",
	  "State Bottle Retail",
	  "Bottles Sold",
	  "Sale (Dollars)",
	  "Volume Sold (Liters)",
      "Volume Sold (Gallons)"
	HAVING COUNT(*) > 1
) a
LEFT OUTER JOIN public.salesdata b
ON
	--  "Invoice/Item Number",
	  a."Date" = b."Date" AND
      a."Store Number" = b."Store Number" AND
	  a."Store Name" = b."Store Name" AND
	  a."Address" = b."Address" AND
	  a."City" = b."City" AND
	  a."Zip Code" = b."Zip Code" AND
	  a."Store Location" = b."Store Location" AND
	  a."County Number" = b."County Number" AND
	  a."County" = b."County" AND
	  a."Category" = b."Category" AND
	  a."Category Name" = b."Category Name" AND
	  a."Vendor Number" = b."Vendor Number" AND
	  a."Vendor Name" = b."Vendor Name" AND
	  a."Item Number" = b."Item Number" AND
	  a."Item Description" = b."Item Description" AND
	  a."Pack" = b."Pack" AND
	  a."Bottle Volume (ml)" = b."Bottle Volume (ml)" AND
	  a."State Bottle Cost" = b."State Bottle Cost" AND
	  a."State Bottle Retail" = b."State Bottle Retail" AND
	  a."Bottles Sold" = b."Bottles Sold" AND
	  a."Sale (Dollars)" = b."Sale (Dollars)" AND
	  a."Volume Sold (Liters)" = b."Volume Sold (Liters)"