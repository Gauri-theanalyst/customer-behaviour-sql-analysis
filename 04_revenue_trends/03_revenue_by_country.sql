SELECT
    country,
    COUNT(DISTINCT invoice)             AS total_orders,
    COUNT(DISTINCT customer_id)         AS unique_customers,
    ROUND(SUM(revenue), 2)              AS total_revenue,
    ROUND(AVG(revenue), 2)              AS avg_transaction_value
FROM online_retail_clean
WHERE country != 'Unspecified'
GROUP BY country
ORDER BY total_revenue DESC
LIMIT 10;