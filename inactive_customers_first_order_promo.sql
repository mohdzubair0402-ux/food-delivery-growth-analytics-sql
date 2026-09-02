4. List all the customers with no order in the last 7 days but were acquired one month ago with their 
first order on promo

WITH BasicDates AS (
    SELECT 
        customer_code,
        MIN(placed_at) AS first_order,
        MAX(placed_at) AS last_order
    FROM orders
    GROUP BY customer_code
)
SELECT 
    bd.*, 
    o.Promo_code_Name AS first_promo
FROM BasicDates bd
JOIN orders o ON bd.customer_code = o.customer_code 
             AND bd.first_order = o.placed_at
WHERE 
bd.last_order <= DATEADD(day, -7, GETDATE())
AND bd.first_order < DATEADD(month, -1, GETDATE())
AND o.Promo_code_Name IS NOT NULL;
 



