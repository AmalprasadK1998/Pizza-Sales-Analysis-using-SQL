-- Identify the most common pizza size ordered

SELECT 
    size, COUNT(order_details_id) AS total_orders
FROM
    (SELECT 
        size, order_details_id
    FROM
        pizzas
    JOIN order_details ON pizzas.pizza_id = order_details.pizza_id) AS t1
GROUP BY size
ORDER BY total_orders DESC
LIMIT 1;





