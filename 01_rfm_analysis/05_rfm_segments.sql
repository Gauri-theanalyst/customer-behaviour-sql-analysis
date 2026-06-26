WITH rfm_base AS (
    SELECT
        customer_id,
        ROUND(SUM(revenue), 2)                    AS monetary,
        COUNT(DISTINCT invoice)                    AS frequency,
        DATEDIFF('2011-12-31', MAX(invoicedate))   AS recency_days
    FROM online_retail_clean
    GROUP BY customer_id
),
rfm_scores AS (
    SELECT *,
        NTILE(5) OVER (ORDER BY recency_days DESC)  AS r_score,
        NTILE(5) OVER (ORDER BY frequency ASC)      AS f_score,
        NTILE(5) OVER (ORDER BY monetary ASC)       AS m_score
    FROM rfm_base
),
rfm_segments AS (
    SELECT *,
        CASE
            WHEN r_score = 5 AND f_score = 5        THEN 'Champion'
            WHEN f_score >= 4                        THEN 'Loyal'
            WHEN r_score >= 4 AND f_score <= 2       THEN 'Potential Loyalist'
            WHEN r_score <= 2 AND f_score >= 4       THEN 'At Risk'
            WHEN r_score = 1 AND f_score = 1         THEN 'Lost'
            ELSE                                          'Needs Attention'
        END AS segment
    FROM rfm_scores
)
SELECT
    segment,
    COUNT(customer_id)          AS total_customers,
    ROUND(SUM(monetary), 2)     AS total_revenue,
    ROUND(AVG(monetary), 2)     AS avg_revenue
FROM rfm_segments
GROUP BY segment
ORDER BY total_revenue DESC;