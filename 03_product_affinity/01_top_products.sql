USE retail_analysis;
select 
    stockcode,
    description,
    count(*) as times_ordered,
    sum(quantity) as times_units_sold,
    round(sum(revenue), 2) as total_revenue
from online_retail_clean
group by stockcode, description
order by times_ordered desc
limit 10;