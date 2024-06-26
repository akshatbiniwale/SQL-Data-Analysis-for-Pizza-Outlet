-- Calculate the percentage contribution of each pizza type to total revenue.
WITH total_revenue AS (SELECT 
    PT.category, SUM(P.price * OD.quantity) AS 'revenue'
FROM
    order_details OD
        INNER JOIN
    pizzas P
        INNER JOIN
    pizza_types PT
WHERE
    OD.pizza_id = P.pizza_id
        AND P.pizza_type_id = PT.pizza_type_id
GROUP BY PT.category
ORDER BY revenue DESC)

SELECT 
    category,
    ROUND(revenue * 100 / (SELECT 
                    SUM(revenue)
                FROM
                    total_revenue),
            2) AS 'precentage_revenue'
FROM
    total_revenue;