SELECT
    DAYNAME(invoicedate)                AS day_of_week,
    COUNT(DISTINCT invoice)             AS total_orders,
    COUNT(DISTINCT customer_id)         AS unique_customers,
    ROUND(SUM(revenue), 2)              AS total_revenue
FROM online_retail_clean
GROUP BY DAYNAME(invoicedate)
ORDER BY total_revenue DESC;