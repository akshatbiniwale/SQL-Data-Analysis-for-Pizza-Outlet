-- Calculate the total revenue generated from pizza sales.
SELECT 
    ROUND(SUM(O.quantity * P.price), 2) AS 'total revenue'
FROM
    order_details O
        INNER JOIN
    pizzas P
WHERE
    O.pizza_id = P.pizza_id;