WITH cohorts AS (
    SELECT
        customer_id,
        DATE_FORMAT(MIN(invoicedate), '%Y-%m') AS cohort_month
    FROM online_retail_clean
    GROUP BY customer_id
),
customer_activity AS (
    SELECT
        o.customer_id,
        c.cohort_month,
        DATE_FORMAT(o.invoicedate, '%Y-%m') AS activity_month
    FROM online_retail_clean o
    JOIN cohorts c ON o.customer_id = c.customer_id
)
SELECT
    cohort_month,
    activity_month,
    COUNT(DISTINCT customer_id) AS active_customers
FROM customer_activity
GROUP BY cohort_month, activity_month
ORDER BY cohort_month ASC, activity_month ASC