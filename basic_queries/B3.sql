-- Identify the highest-priced pizza.
SELECT 
    PT.name, P.price
FROM
    pizza_types PT
        JOIN
    pizzas P
WHERE
    P.pizza_type_id = PT.pizza_type_id
ORDER BY P.price DESC;