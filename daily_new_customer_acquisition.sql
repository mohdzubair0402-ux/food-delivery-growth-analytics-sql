2.Find the daily new customer count from the launch date( everyday how many new customers are acquiring)
with cte as (
select Customer_code, cast(min(Placed_at) as date) as first_order_date
from orders
group by Customer_code
)
select first_order_date,count(*) as new_customer
from cte
group by first_order_date
;
