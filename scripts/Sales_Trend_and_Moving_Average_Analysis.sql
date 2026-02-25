SELECT order_date,total_sales,
SUM(total_sales) OVER (ORDER BY order_date) kumulatif_sales,
--over function: cumulatively sums up to the sales value of the previous date (Cumulative)
AVG (avg_price) OVER (ORDER BY order_date) moving_avarege_price
FROM
(
SELECT 
SUM(sales_amount) AS total_sales,
AVG (price) AS avg_price,
DATETRUNC(month ,order_date) AS order_date
FROM dbo.fact_sales
WHERE order_date IS NOT NULL
GROUP BY DATETRUNC(month ,order_date)
)
t
