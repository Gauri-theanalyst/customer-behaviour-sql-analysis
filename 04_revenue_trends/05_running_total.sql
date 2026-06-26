WITH monthly_revenue AS (
    SELECT
        DATE_FORMAT(invoicedate, '%Y-%m')   AS month,
        ROUND(SUM(revenue), 2)              AS total_revenue
    FROM online_retail_clean
    GROUP BY DATE_FORMAT(invoicedate, '%Y-%m')
)
SELECT
    month,
    total_revenue,
    ROUND(SUM(total_revenue) OVER
        (ORDER BY month), 2)                AS running_total
FROM monthly_revenue
ORDER BY month ASC;