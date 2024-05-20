-- Determine the top 3 most ordered pizza types based on revenue.

-- First method/my method...only 1 join

 
SELECT 
    pizza_type_id, ROUND(SUM(price * quantity), 2) AS revenue
FROM
    pizzas
        JOIN
    order_details ON pizzas.pizza_id = order_details.pizza_id
GROUP BY pizza_type_id
ORDER BY revenue DESC
LIMIT 3;

-- other method/2nd method

-- Double join (1st pizza_types and pizzas) , 
-- next join them with order_details based on common columns.

SELECT 
    pizza_types.name,
    ROUND(SUM((order_details.quantity * pizzas.price)),
            2) AS revenue
FROM
    (pizza_types
    JOIN pizzas ON pizzas.pizza_type_id = pizza_types.pizza_type_id)
        JOIN
    order_details ON order_details.pizza_id = pizzas.pizza_id
GROUP BY pizza_types.name
ORDER BY revenue DESC
LIMIT 3;
