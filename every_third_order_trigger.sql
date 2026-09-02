Growth team is planning to create a trigger that will target customers after their every third order
with a personalized communication and they have asked to create a query for this

with cte as (
select * ,
row_number() over (partition by customer_code order by placed_at) as order_number
from orders
)
select *
from cte
where order_number % 3=0 
AND cast(Placed_at as date) = CAST(GETDATE() AS DATE)
;
