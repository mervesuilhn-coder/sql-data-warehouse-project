SELECT order_date,total_sales,
SUM(total_sales) OVER ( ORDER BY order_date) kumulatif_sales
FROM
(
SELECT 
SUM(sales_amount) AS total_sales,
DATETRUNC(month ,order_date) AS order_date
FROM dbo.fact_sales
WHERE order_date IS NOT NULL
GROUP BY DATETRUNC(month ,order_date)
)
t
