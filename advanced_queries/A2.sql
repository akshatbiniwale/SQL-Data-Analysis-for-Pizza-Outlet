-- Analyze the cumulative revenue generated over time.
WITH total_revenue AS (SELECT 
    O.order_date,
    SUM(P.price * OD.quantity) AS 'revenue'
FROM
    order_details OD
        INNER JOIN
    pizzas P
        INNER JOIN
    orders O
WHERE
    OD.pizza_id = P.pizza_id
        AND O.order_id = OD.order_id
GROUP BY O.order_date
ORDER BY O.order_date)

SELECT 
    order_date,
    SUM(revenue) OVER(ORDER BY order_date) AS cumulative_sum
FROM
    total_revenue;