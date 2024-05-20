-- Calculate the total revenue generated from pizza sales.



SELECT 
    ROUND(SUM(quantity * price), 2) AS total_revenue
FROM
    order_details
        INNER JOIN
    pizzas ON order_details.pizza_id = pizzas.pizza_id;


