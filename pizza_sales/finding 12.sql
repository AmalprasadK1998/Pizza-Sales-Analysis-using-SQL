-- Analyze the cumulative revenue generated over time.

select order_date,
round(sum(revenue) over (order by order_date),2) as cumulative_revenue
from
(SELECT 
orders.order_date,
ROUND(SUM((order_details.quantity * pizzas.price)),2)  AS revenue
FROM
(order_details
JOIN orders ON order_details.order_id = orders.order_id)
JOIN
pizzas ON order_details.pizza_id = pizzas.pizza_id
GROUP BY orders.order_date) as t1;