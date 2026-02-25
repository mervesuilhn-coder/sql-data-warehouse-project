--ANALYZE THE YEARLY PERFORMANCE OF PRODUCTS BY COMPARING
--TO BOTH THE AVERAGE SALES PERFORMANCE OF THE PRODUCT AND THE PREVIOUS YEAR'S SALES

WITH yearly_product_sales AS
(
SELECT
YEAR(f.order_date) AS order_year,p.product_name,SUM(f.sales_amount) AS current_sales
FROM fact_sales f
LEFT JOIN dim_products p ON f.product_key= p.product_key
WHERE order_date IS NOT NULL
GROUP BY YEAR(f.order_date),p.product_name
)
SELECT order_year,product_name,current_sales,
AVG(current_sales) OVER(PARTITION BY product_name) avg_sales
FROM yearly_product_sales
ORDER BY product_name,order_year
--Thus, we compared the current year's sales amount with the 3-year average on a product-by-product basis.
----------------------------------------------------------------------------------------------------
WITH yearly_product_sales AS
(
SELECT
YEAR(f.order_date) AS order_year,p.product_name,SUM(f.sales_amount) AS current_sales
FROM fact_sales f
LEFT JOIN dim_products p ON f.product_key= p.product_key
WHERE order_date IS NOT NULL
GROUP BY YEAR(f.order_date),P.product_name
)
SELECT order_year,product_name,current_sales,
AVG(current_sales) OVER(PARTITION BY product_name) avg_sales,
current_sales - AVG(current_sales) OVER(PARTITION BY product_name) AS diff_avg
FROM yearly_product_sales
ORDER BY product_name,order_year
--secondly,we found the difference in value by subtracting
----------------------------------------------------------------------------------------------------------------------
WITH yearly_product_sales AS
(
SELECT
YEAR(f.order_date) AS order_year,p.product_name,SUM(f.sales_amount) AS current_sales
FROM fact_sales f
LEFT JOIN dim_products p ON f.product_key= p.product_key
WHERE order_date IS NOT NULL
GROUP BY YEAR(f.order_date),P.product_name
)
SELECT order_year,product_name,current_sales,
AVG(current_sales) OVER(PARTITION BY product_name) avg_sales,
current_sales - AVG(current_sales) OVER(PARTITION BY product_name) AS diff_avg,
CASE WHEN current_sales - AVG(current_sales) OVER(PARTITION BY product_name)>0 THEN 'Above Avg'
     WHEN current_sales - AVG(current_sales) OVER(PARTITION BY product_name)<0 THEN 'Below Avg'
     ELSE 'Equal_Avg'
END avg_change
FROM yearly_product_sales
ORDER BY product_name,order_year
--finally,To provide a more detailed and easy observation of our comparison, we looked at whether the differences were above or below the average.
-----------------------------------------------------------------------------------------------------------------
WITH yearly_product_sales AS
(
SELECT
YEAR(f.order_date) AS order_year,p.product_name,SUM(f.sales_amount) AS current_sales
FROM fact_sales f
LEFT JOIN dim_products p ON f.product_key= p.product_key
WHERE order_date IS NOT NULL
GROUP BY YEAR(f.order_date),P.product_name
)
SELECT order_year,product_name,current_sales,
AVG(current_sales) OVER(PARTITION BY product_name) avg_sales,
current_sales - AVG(current_sales) OVER(PARTITION BY product_name) AS diff_avg,
CASE WHEN current_sales - AVG(current_sales) OVER(PARTITION BY product_name)>0 THEN 'Above Avg'
     WHEN current_sales - AVG(current_sales) OVER(PARTITION BY product_name)<0 THEN 'Below Avg'
     ELSE 'Equal_Avg'
END avg_change,
LAG (current_sales) OVER (PARTITION BY product_name ORDER BY order_year) previos_year_sales
FROM yearly_product_sales
ORDER BY product_name,order_year
--Here, we would compare the sales amount of the same product from the previous year with the LAG function.
------------------------------------------------------------------------------------------
WITH yearly_product_sales AS
(
SELECT
YEAR(f.order_date) AS order_year,p.product_name,SUM(f.sales_amount) AS current_sales
FROM fact_sales f
LEFT JOIN dim_products p ON f.product_key = p.product_key
WHERE order_date IS NOT NULL
GROUP BY YEAR(f.order_date),P.product_name
)
SELECT order_year,product_name,current_sales,
AVG(current_sales) OVER(PARTITION BY product_name) avg_sales,
current_sales - AVG(current_sales) OVER(PARTITION BY product_name) AS diff_avg,
CASE WHEN current_sales - AVG(current_sales) OVER(PARTITION BY product_name)>0 THEN 'Above Avg'
     WHEN current_sales - AVG(current_sales) OVER(PARTITION BY product_name)<0 THEN 'Below Avg'
     ELSE 'Equal_Avg'
END avg_change,
LAG (current_sales) OVER (PARTITION BY product_name ORDER BY order_year) previos_year_sales,
current_sales - LAG (current_sales) OVER (PARTITION BY product_name ORDER BY order_year) AS diffrent_previos_sales
FROM yearly_product_sales
ORDER BY product_name,order_year
--Here we found the sales difference based on the previous year's sales.
-----------------------------------------------------------------------------------------------
WITH yearly_product_sales AS
(
SELECT
YEAR(f.order_date) AS order_year,p.product_name,SUM(f.sales_amount) AS current_sales
FROM fact_sales f
LEFT JOIN dim_products p ON f.product_key= p.product_key
WHERE order_date IS NOT NULL
GROUP BY YEAR(f.order_date),P.product_name
)
SELECT order_year,product_name,current_sales,
AVG(current_sales) OVER(PARTITION BY product_name) avg_sales,
current_sales - AVG(current_sales) OVER(PARTITION BY product_name) AS diff_avg,
CASE WHEN current_sales - AVG(current_sales) OVER(PARTITION BY product_name)>0 THEN 'Above Avg'
     WHEN current_sales - AVG(current_sales) OVER(PARTITION BY product_name)<0 THEN 'Below Avg'
     ELSE 'Equal_Avg'
END avg_change,
LAG (current_sales) OVER (PARTITION BY product_name ORDER BY order_year) previos_year_sales,
current_sales - LAG (current_sales) OVER (PARTITION BY product_name ORDER BY order_year) AS diffrent_previos_sales,
CASE WHEN current_sales - LAG (current_sales) OVER (PARTITION BY product_name ORDER BY order_year)>0 THEN 'increase'
     WHEN current_sales - LAG (current_sales) OVER (PARTITION BY product_name ORDER BY order_year)<0 THEN 'decrease'
     ELSE 'No Change'
     END previous_year_change
FROM yearly_product_sales
ORDER BY product_name,order_year
--We compared the difference between the current year's sales amounts and the previous year's sales amounts.

