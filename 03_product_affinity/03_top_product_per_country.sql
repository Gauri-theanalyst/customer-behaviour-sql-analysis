WITH product_country AS (
    SELECT
        country,
        stockcode,
        description,
        COUNT(*)                    AS times_ordered,
        ROUND(SUM(revenue), 2)      AS total_revenue
    FROM online_retail_clean
    WHERE stockcode NOT IN ('POST', 'C2', 'M', 'BANK CHARGES', 'DOT')
    GROUP BY country, stockcode, description
),
ranked AS (
    SELECT *,
        ROW_NUMBER() OVER (
            PARTITION BY country
            ORDER BY times_ordered DESC
        )                           AS country_rank
    FROM product_country
)
SELECT
    country,
    stockcode,
    description,
    times_ordered,
    total_revenue
FROM ranked
WHERE country_rank = 1
ORDER BY times_ordered DESC
LIMIT 15;