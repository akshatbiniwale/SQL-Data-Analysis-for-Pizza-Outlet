-- Identify the most common pizza size ordered.
SELECT 
    P.size, SUM(O.quantity) AS 'order_count'
FROM
    order_details O
        INNER JOIN
    pizzas P
WHERE
    O.pizza_id = P.pizza_id
GROUP BY P.size
ORDER BY P.size ASC;