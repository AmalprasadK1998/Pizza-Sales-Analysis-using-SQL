
-- List the top 5 most ordered pizza types(names) along with their quantities

SELECT 
    name, SUM(quantity) AS total_quantity
FROM
    (SELECT 
        name, quantity
    FROM
        pizza_types
    JOIN (SELECT 
        quantity, pizza_type_id
    FROM
        pizzas
    JOIN order_details ON pizzas.pizza_id = order_details.pizza_id) AS t1 ON pizza_types.pizza_type_id = t1.pizza_type_id) AS t2
GROUP BY name
ORDER BY total_quantity DESC
LIMIT 5;

