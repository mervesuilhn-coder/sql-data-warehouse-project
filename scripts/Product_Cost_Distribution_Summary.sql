--Segment products into cost ranges and count how many products fall into each segment
USE DataWarehouseAnalytics;
GO
SELECT product_key,product_name,cost,
CASE 
     WHEN cost <100 THEN 'Below 100'
     WHEN cost BETWEEN 100 AND 500 THEN '100-500'
     WHEN cost BETWEEN 500 AND 1000 THEN '500-1000'
     ELSE 'Above 1000'
END AS cost_range --created a column name
FROM dbo.dim_products
--in this part, measures have been converted to dimensions and values have been segmented.
-------------------------------------------------------------------------
WITH product_segment AS (
SELECT product_key,product_name,cost,
CASE 
     WHEN cost <100 THEN 'Below 100'
     WHEN cost BETWEEN 100 AND 500 THEN '100-500'
     WHEN cost BETWEEN 500 AND 1000 THEN '500-1000'
     ELSE 'Above 1000'
END AS cost_range --created a column name
FROM dbo.dim_products)

SELECT cost_range,COUNT(product_key) AS total_product
FROM product_segment
GROUP BY cost_range
ORDER BY total_product DESC
--Deriving total product count by aggregating product keys and segmented cost ranges.
--------------------------------------------------------------------------------
