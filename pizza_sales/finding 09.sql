-- Group the orders by date and calculate the average number of pizzas ordered per day.

SELECT 
    ROUND(AVG(total_quantity)) AS Avg_pizzas_ordered_per_day
FROM
    (SELECT 
        order_date, SUM(quantity) AS total_quantity
    FROM
        (SELECT 
        order_date, quantity
    FROM
        orders
    JOIN order_details ON orders.order_id = order_details.order_id) AS t1
    GROUP BY order_date) AS t2;






