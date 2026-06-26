WITH cohorts AS (
    SELECT
        customer_id,
        DATE_FORMAT(MIN(invoicedate), '%Y-%m')  AS cohort_month
    FROM online_retail_clean
    GROUP BY customer_id
),
cohort_sizes AS (
    SELECT
        cohort_month,
        COUNT(customer_id)                      AS cohort_size
    FROM cohorts
    GROUP BY cohort_month
),
customer_activity AS (
    SELECT
        o.customer_id,
        c.cohort_month,
        DATE_FORMAT(o.invoicedate, '%Y-%m')     AS activity_month
    FROM online_retail_clean o
    JOIN cohorts c ON o.customer_id = c.customer_id
),
monthly_retention AS (
    SELECT
        cohort_month,
        activity_month,
        COUNT(DISTINCT customer_id)             AS active_customers
    FROM customer_activity
    GROUP BY cohort_month, activity_month
)
SELECT
    m.cohort_month,
    m.activity_month,
    m.active_customers,
    s.cohort_size,
    ROUND(m.active_customers / s.cohort_size * 100, 1) AS retention_rate
FROM monthly_retention m
JOIN cohort_sizes s ON m.cohort_month = s.cohort_month
ORDER BY m.cohort_month ASC, m.activity_month ASC
LIMIT 30;