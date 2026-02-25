--Sales agarage over years
SELECT YEAR (order_date),SUM(sales_amount) AS [total sales]
FROM fact_sales
WHERE order_date IS NOT NULL
GROUP BY YEAR(order_date)
ORDER BY YEAR(order_date)
------------------------------------------------------------------
SELECT DATETRUNC(YEAR ,order_date) YearbyYear ,SUM(sales_amount) AS [total sales],COUNT(DISTINCT(customer_key)) sales
FROM fact_sales
WHERE order_date IS NOT NULL
GROUP BY DATETRUNC(YEAR,order_date)
ORDER BY DATETRUNC(YEAR,order_date)
--DATETRUNC(month, date): Truncates the date to the first day of its respective month
--DATETRUNC(year date):Truncates the date to the first day of the year.
---------------------------------------------------------------------------
SELECT FORMAT(order_date,'yyyy-MMMM')YeaybyYear,SUM(sales_amount) AS [total sales],COUNT(DISTINCT(customer_key)) sales
FROM fact_sales
WHERE order_date IS NOT NULL
GROUP BY FORMAT(order_date,'yyyy-MMMM')
ORDER BY FORMAT(order_date,'yyyy-MMMM')
--Format function:for choosing which date format is using
