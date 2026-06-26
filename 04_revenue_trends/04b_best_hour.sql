SELECT
    HOUR(invoicedate)                   AS hour_of_day,
    COUNT(DISTINCT invoice)             AS total_orders,
    ROUND(SUM(revenue), 2)              AS total_revenue
FROM online_retail_clean
GROUP BY HOUR(invoicedate)
ORDER BY total_revenue DESC;