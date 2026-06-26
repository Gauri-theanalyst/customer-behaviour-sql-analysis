#CREATE DATABASE retail_analysis;
-- USE retail_analysis;

SELECT
   customer_id,
   ROUND(SUM(revenue),2) AS total_revenue,
   COUNT(DISTINCT invoice) AS total_orders,
   ROUND(SUM(revenue) / COUNT( DISTINCT invoice),2) AS avg_order_value
   from online_retail_clean
   group by customer_id
   order by total_revenue DESC
   LIMIT 20
   
   