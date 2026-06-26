SELECT
    DATE_FORMAT(invoicedate, '%Y-%m')   AS month,
    COUNT(DISTINCT invoice)             AS total_orders,
    COUNT(DISTINCT customer_id)         AS unique_customers,
    ROUND(SUM(revenue), 2)              AS total_revenue,
    ROUND(AVG(revenue), 2)              AS avg_order_revenue
FROM online_retail_clean
GROUP BY DATE_FORMAT(invoicedate, '%Y-%m')
ORDER BY month ASC;