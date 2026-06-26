With cohorts AS(
   select
   customer_id,
   date_format(MIN(invoicedate), '%Y-%m') as cohort_month
   from online_retail_clean
   group by customer_id
)
Select
   cohort_month,
   count(customer_id) as total_customers
   from cohorts
   group by cohort_month
   order by cohort_month ASC;