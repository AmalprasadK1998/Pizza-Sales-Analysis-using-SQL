-- Calculate the percentage contribution of each pizza type(category) to total revenue.

SELECT 
pizza_types.category,

round(ROUND(SUM((order_details.quantity * pizzas.price)),2)/
(select sum(revenue) from
(SELECT 
ROUND(SUM((order_details.quantity * pizzas.price)),2) AS revenue
from 
pizzas join order_details 
on pizzas.pizza_id = order_details.pizza_id) as total)*100,2) as revenue_contribution


FROM
(pizza_types
JOIN pizzas ON pizzas.pizza_type_id = pizza_types.pizza_type_id)
JOIN
order_details ON order_details.pizza_id = pizzas.pizza_id
GROUP BY pizza_types.category
ORDER BY revenue_contribution DESC;

