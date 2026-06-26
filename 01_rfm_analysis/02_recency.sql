SELECT
   customer_id,
   MAX(invoicedate) as last_purchase_date,
   DATEDIFF('2011-12-31', MAX(invoicedate)) as recency_days
FROM online_retail_clean
   group by customer_id
   order by recency_days ASC
   Limit 20
   