--Segment products into cost ranges and count how many products fall into each segment
SELECT product_key,product_name,cost,
CASE 
     WHEN cost <100 THEN 'Below 100'
     WHEN cost BETWEEN 100 AND 500 THEN '100-500'
     WHEN cost BETWEEN 500 AND 1000 THEN '500-1000'
     ELSE 'Above 1000'
END AS cost_range --S�tun ad�n� verdik.
FROM dbo.dim_products
--in this part, measures have been converted to dimensions and values have been segmented.
-------------------------------------------------------------------------
SELECT product_key,product_name,cost,
CASE 
     WHEN cost <100 THEN 'Below 100'
     WHEN cost BETWEEN 100 AND 500 THEN '100-500'
     WHEN cost BETWEEN 500 AND 1000 THEN '500-1000'
     ELSE 'Above 1000'
END AS cost_range --S�tun ad�n� verdik.
FROM dbo.dim_products
