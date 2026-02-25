# Advanced SQL Portfolio: Data-Driven Business Intelligence & Customer Analytics

This repository showcases a series of advanced SQL scripts developed to transform raw data into actionable business insights. From tracking daily sales momentum to building a complete **Customer 360 View**, these analyses focus on revenue growth, product performance, and customer behavior.
# sql-data-warehouse-project
---
Building a modern datawarehouse with SQL Server,including ETL Processes,data modelling and analytics.

This project demonstrates a comprehensive data warehousing and analytics solution,from building a data warehouse to generating actionable insights.Designed as portfolio project highlights industry best paractices in data engineering analytics.
---
##Project Requirements 
###Building the Data Warehouse(Data Engineering)

####Objectice 
Develop a modern data warehouse using SQL Server to consolidate sales data,enabling analytical reporting and informed decision-making.

#### Specifications
-Data Sources:Import data from two source systems(ERP and CRM) provided as CSV files.
-Data Quality:Cleanse and resolve data quality issues prior to analysis.
Integration:Combine both sources into a single, user-friendy data model designed for analytical queries.
-Scope:Focus on the latest datasets only;historization of is not required.
-Documentation:Provide clear documentation of the data model to support both business stakeholders teams.

About Me:
-As a recent industrial engineering graduate, I am performing data analysis using the SQL Server program, which I learned and had the opportunity to practice during my internship and I am writing T-SQL queries on sample databases during my job search.

------------------------------------------------------------------------
^ANALYSİS ROADMAP^
Script Path:
scripts/SQLqueryDatetrunc
Techniques & Functions:
DATETRUNC, FORMAT, Aggregations, Grouping    
Descriptions:
Analyzes annual/monthly sales trends and unique customer counts.
----------------------------------------------------------------------
Script Path:
scripts/Product_Performance_Benchmarking.sql
Techniques & Functions:
windows functions(avg,over,lag),CTEs,aggregations 
Descriptions:
Analyze yearly performance of products by comparing both the avarage sales of                                                                                                                                        products and the previous years sales.
-----------------------------------------------------------------------------
Script Path:
scripts/Category_Sales_Contribution_Analysis.sql
Techniques & Functions:
CTEs,WindowsFunctions(sum,over),Cast(As Float),(CONCAT,ROUND) 
Descriptions:
Analysis identifies which product categories are the primary revenue                                                                                                                                                 drivers. By calculating the percentage of total sales for each category,it                                                                                                                                           stakeholders understand market share within the company and prioritize                                                                                                                                               high-performing categories. 
--------------------------------------------------------------------------
Script Path:
scripts/Sales_Trend_and_Moving_Average_Analysis.sql
Techniques & Functions:
WindowsFunctions(sum,over,avg),Date Truncation (datetrunc)
Descriptions:
Analysis aims to visualize the long-term sales trend by smoothing out                                                                                                                                                short-term fluctuations using a Moving Average. It also tracks the company's                                                                                                                                         total revenue growth over time through a Cumulative (Running) Total, providing                                                                                                                                       a clear picture of financial momentum
----------------------------------------------------------------------------------------------
Script Path:
scripts/Monthly_Cumulative_Sales_Analysis.sql
Techniques & Functions:
Subqueries,Windows function(sum,over),Date Truncation (datetrunc)
Descriptions:
It calculates the monthly running total (cumulative sum) of sales. It helps                                                                                                                                          stakeholders visualize the total revenue growth trajectory throughout the                                                                                                                                            year rather than just looking at isolated monthly figures.
-------------------------------------------------------------------------------------
Script Path:
scripts/Product_Cost_Segmentation_Analysis.sql
Techniques & Functions:
Conditional Logic(Case When),Data Transformation
Descriptions:
Categorizes products into cost tiers to analyze inventory distribution and pricing strategy
---------------------------------------------------------------------------------------------
Script Path:
scripts/Product_Cost_Distribution_Summary.sql
Techniques & Functions:
Conditional Logic(Case When),WindowsFunctions(sum,over,avg)CTEs
Descriptions:
Firstly,Segment products into cost ranges and count how many products fall into each                                                                                                                                 segment second part measures have been converted to dimensions and values have been                                                                                                                                  segmented.Finally deriving total product count by aggregating product keys and segmented cost ranges.
------------------------------------------------------------------------------------------------
Script Path:
scripts/Customer_360_KPI_and_Segmentation.sql
Techniques & Functions:
Multi-CTEs, CASE WHEN, DATEDIFF, Create VIEW  
Descriptions:
This is a comprehensive Customer 360 report that consolidates behavioral data and                                                                                                                                    financial metrics. It provides a 360-degree view of the customer base by calculating                                                                                                                                 critical business KPIs such as Recency, Average Order Value (AOV), and Lifespan                                                                                                                           







                                                                                                                                
                                                                                                                                



   


















