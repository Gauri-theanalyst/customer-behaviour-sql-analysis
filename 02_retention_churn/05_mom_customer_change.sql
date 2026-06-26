use retail_analysis;
WITH monthly_customers AS (
    SELECT
        DATE_FORMAT(invoicedate, '%Y-%m')       AS month,
        COUNT(DISTINCT customer_id)             AS active_customers
    FROM online_retail_clean
    GROUP BY DATE_FORMAT(invoicedate, '%Y-%m')
),
mom_change AS (
    SELECT
        month,
        active_customers,
        LAG(active_customers) OVER 
            (ORDER BY month)                    AS prev_month_customers
    FROM monthly_customers
)
SELECT
    month,
    active_customers,
    prev_month_customers,
    active_customers - prev_month_customers     AS customer_change,
    ROUND((active_customers - prev_month_customers) 
        / prev_month_customers * 100, 1)        AS pct_change
FROM mom_change
WHERE prev_month_customers IS NOT NULL
ORDER BY month ASC;