Count all the users who were acquired in Jan 2025 and only place one order in Jan and
did not place any other order

select customer_code,count(*) as no_of_orders
from orders
where MONTH(placed_at)=1 and year(placed_at)=2025 
and customer_code not in (select distinct customer_code
from orders
where not MONTH(placed_at)=1 and year(placed_at)=2025)
group by customer_code
having count(*)=1
;

SELECT 
    customer_code,
    COUNT(*) AS no_of_orders
FROM orders
WHERE YEAR(placed_at) = 2025
GROUP BY customer_code
HAVING 
    COUNT(CASE WHEN MONTH(placed_at) = 1 THEN 1 END) = 1  
    AND 
    COUNT(CASE WHEN MONTH(placed_at) != 1 THEN 1 END) = 0; 
 
 SELECT customer_code
FROM orders
GROUP BY customer_code
HAVING COUNT(*) = 1  
   AND MAX(placed_at) >= '2025-01-01'  
   AND MAX(placed_at) < '2025-02-01';
 
