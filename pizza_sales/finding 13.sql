-- Determine the top 3 most ordered pizza types(name) based on revenue for each pizza category.

-- We can't use rank directly in where without creating a subquery!

select category,name,revenue from 
(select category,name,revenue,
rank() over (partition by category order by revenue desc ) as ranking 
from
(SELECT 
pizza_types.category,pizza_types.name,
ROUND(SUM((order_details.quantity * pizzas.price)),2) AS revenue
FROM
(pizza_types
JOIN pizzas ON pizzas.pizza_type_id = pizza_types.pizza_type_id)
JOIN
order_details ON order_details.pizza_id = pizzas.pizza_id
GROUP BY pizza_types.category,pizza_types.name) as t1) as t2
where ranking <= 3;