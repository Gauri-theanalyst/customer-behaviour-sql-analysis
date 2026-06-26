USE retail_analysis;
select
    customer_id,
    date_format(MIN(invoicedate), '%Y-%m') as cohort_month
    from online_retail_clean
    group by customer_id
    order by cohort_month ASC
    LIMIT 20;
    