-- Join the necessary tables to find the total quantity of each pizza category ordered.
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
GROUP BY PT.name;