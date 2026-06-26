WITH monthly_revenue AS (
    SELECT
        DATE_FORMAT(invoicedate, '%Y-%m')   AS month,
        ROUND(SUM(revenue), 2)              AS total_revenue
    FROM online_retail_clean
    GROUP BY DATE_FORMAT(invoicedate, '%Y-%m')
),
mom_revenue AS (
    SELECT
        month,
        total_revenue,
        LAG(total_revenue) OVER
            (ORDER BY month)                AS prev_month_revenue
    FROM monthly_revenue
)
SELECT
    month,
    total_revenue,
    prev_month_revenue,
    ROUND(total_revenue - prev_month_revenue, 2)                        AS revenue_change,
    ROUND((total_revenue - prev_month_revenue)
        / prev_month_revenue * 100, 1)                                  AS pct_change
FROM mom_revenue
WHERE prev_month_revenue IS NOT NULL
ORDER BY month ASC;