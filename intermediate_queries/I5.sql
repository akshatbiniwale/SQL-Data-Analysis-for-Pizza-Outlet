-- Determine the top 3 most ordered pizza types based on revenue.
SELECT 
    PT.name, SUM(P.price * OD.quantity) AS 'revenue'
FROM
    order_details OD
        INNER JOIN
    pizzas P
        INNER JOIN
    pizza_types PT
WHERE
    OD.pizza_id = P.pizza_id
        AND P.pizza_type_id = PT.pizza_type_id
GROUP BY PT.name
ORDER BY revenue DESC
LIMIT 3;