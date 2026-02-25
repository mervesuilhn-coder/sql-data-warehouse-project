--Which categories contribute the most to overall sales
WITH category_sales AS (
SELECT category,SUM(sales_amount) total_sales
FROM dbo.fact_sales f
LEFT JOIN dbo.dim_products p ON p.product_key=f.product_key
GROUP BY category)

SELECT category,total_sales,
SUM(total_sales) OVER () overall_sales,
--The OVER () expression calculates the sum of all rows in the query result and writes this total value next to each row.
CONCAT(ROUND((CAST(total_sales AS FLOAT)/SUM(total_sales) OVER ())*100,2),'%') AS percentage_of_total
FROM category_sales
ORDER BY total_sales DESC
