-- Join the necessary tables to find the total quantity of each pizza category ordered.


SELECT 
    category, SUM(quantity) AS total_quantity
FROM
    (SELECT 
        category, quantity
    FROM
        (SELECT 
        category, pizza_id
    FROM
        pizza_types
    JOIN pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id) AS t1
    JOIN order_details ON t1.pizza_id = order_details.pizza_id) AS t2
GROUP BY category
ORDER BY total_quantity DESC;


