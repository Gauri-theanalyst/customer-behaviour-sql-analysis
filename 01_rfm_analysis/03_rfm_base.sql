with rfm_base AS (
   Select 
   customer_id,
   round(sum(revenue),2) as monetary,
   count(distinct invoice) as frequency,
   datediff('2011-12-31', max(invoicedate)) as recency_days
   from online_retail_clean
   group by customer_id
   ),
rfm_scores AS(
   Select *,
   NTILE(5) over( order by recency_days ASC) as r_score,
   NTILE(5) over( order by frequecy DESC) as f_score,
   NTILE(5) over(order by monetary DESC) as m_score
   from rfm_base)
select * 
from rfm_base
order by monetary desc
limit 20