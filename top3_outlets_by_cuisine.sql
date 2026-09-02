Find Top 3 outlets by cuisine type without using limit and top function
WITH cte AS (
    SELECT 
        Restaurant_id, Cuisine, COUNT(*) AS total_orders,
        ROW_NUMBER() OVER (PARTITION BY Cuisine ORDER BY COUNT(*) DESC) AS rn
    FROM orders
    GROUP BY Restaurant_id, Cuisine
)
SELECT * FROM cte 
WHERE rn <= 3;
