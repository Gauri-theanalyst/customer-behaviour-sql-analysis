WITH sample AS (
    SELECT *
    FROM online_retail_clean
    WHERE country = 'United Kingdom'
    LIMIT 10000
)
SELECT
    a.stockcode                 AS product_a,
    a.description               AS product_a_name,
    b.stockcode                 AS product_b,
    b.description               AS product_b_name,
    COUNT(*)                    AS times_bought_together
FROM sample a
JOIN sample b
    ON a.invoice = b.invoice
    AND a.stockcode < b.stockcode
GROUP BY a.stockcode, a.description, b.stockcode, b.description
ORDER BY times_bought_together DESC
LIMIT 20;