-- List the top 5 most ordered pizza types along with their quantities.
SELECT 
    PT.name, SUM(O.quantity) AS 'quantity'
FROM
    order_details O
        INNER JOIN
    pizzas P
        INNER JOIN
    pizza_types PT
WHERE
    O.pizza_id = P.pizza_id
        AND P.pizza_type_id = PT.pizza_type_id
GROUP BY PT.name
ORDER BY quantity DESC
LIMIT 5;