/* CUSTOMER REPORT
Purpose:
-This report consolidates key customer metrics and behaviors
Highlights:
1.Gathers essential fiels such as names,ages and transaction details.
2.Segment customers into categories(VIP,regular,new) and age groups.
3.Aggregate customer-level metrics:
  -total orders
  -total sales
  -totalquantity purchased
  -total products
  -lifespan (in months)
4.Calculates valuable KPIs:
  -recency (months since last order)
  -avarage order value
  -avarage monthly spend
  */
  ------------------------------------------------------------------------------
 --1)Base Query: Retrieves core columns from tables
 SELECT f.order_number,
 f.product_key,
 f.order_date,
 f.sales_amount,
 f.quantity,
 CONCAT(c.first_name,' ',c.last_name) AS customer_name,
 DATEDIFF(year,c.birthdate,GETDATE()) age
 FROM fact_sales f LEFT JOIN dim_customers c ON c.customer_key=f.customer_key
 
 --WE have all the data that we need for report
 ------------------------------------------------------------------------
 CREATE VIEW report_customers AS
 --let's put everything in one CTE
 --F�RST CTE 
 WITH base_query AS(
	 SELECT 
	 f.order_number,
	 f.product_key,
	 f.order_date,
	 f.sales_amount,
	 f.quantity,
	 c.customer_key,
	 c.customer_number,
	 CONCAT(c.first_name,' ',c.last_name) AS customer_name,
	 DATEDIFF(year,c.birthdate,GETDATE()) age
	 FROM fact_sales f LEFT JOIN dim_customers c ON c.customer_key=f.customer_key
	 WHERE order_date IS NOT NULL
	 ),
-------SECOND CTE(when you use second CTE don't use With again just use comma(,) before
 customer_aggregation AS (
SELECT
	customer_key,
	customer_number,
	customer_name,
	age,
	COUNT(DISTINCT order_number) AS total_orders,
	SUM(sales_amount) AS total_sales,
	SUM(quantity) AS total_quantity,
	COUNT(DISTINCT product_key) AS total_product,
	MAX(order_date) AS last_order_date,
	DATEDIFF(month,MIN(order_date),MAX(order_date)) AS lifespan
FROM base_query
GROUP BY customer_key,customer_number,customer_name,age
)
 SELECT
	customer_key,
	customer_number,
	customer_name,
	age,
	CASE 
	     WHEN age < 20 THEN 'Under 20'
	     WHEN age BETWEEN 20 AND 29 THEN '20-29'
		 WHEN age BETWEEN 30 AND 39 THEN '30-39'
		 WHEN age BETWEEN 40 AND 49 THEN '40-49'
	     ELSE '50 and above'
	END AS age_group,
	CASE 
	    WHEN lifespan >= 12 AND total_sales > 5000 THEN 'VIP'
		WHEN lifespan >= 12 AND total_sales <=5000 THEN 'Regular'
		ELSE 'New'
	END AS customer_segment,
	total_orders,
	total_sales,
	total_quantity,
	total_product,
	last_order_date,
	DATEDIFF(month,last_order_date, GETDATE()) AS recency,--(how many passed time since last order)
	lifespan,
	--Compute avarage order value(AVO)
	CASE WHEN total_sales = 0 THEN 0
	     ELSE total_sales / total_orders 
	END AS avg_order_value,
	--Compute avarage monthly spend
	CASE WHEN lifespan = 0 THEN total_sales
	     ELSE total_sales / lifespan
	END AS avg_monthly_spend
	FROM customer_aggregation
