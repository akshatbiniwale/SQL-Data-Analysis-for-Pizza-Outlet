-- Determine the top 3 most ordered pizza types based on revenue for each pizza category.
WITH total_revenue AS (
    SELECT 
        PT.category, PT.name, SUM(P.price * OD.quantity) AS revenue
    FROM
        order_details OD
    INNER JOIN
        pizzas P ON OD.pizza_id = P.pizza_id
    INNER JOIN
        pizza_types PT ON P.pizza_type_id = PT.pizza_type_id
    GROUP BY PT.category, PT.name
),
ranked_revenue AS (
    SELECT 
        category, 
        name, 
        revenue, 
        RANK() OVER (PARTITION BY category ORDER BY revenue DESC) AS rnk
    FROM 
        total_revenue
)

SELECT 
    *
FROM 
    ranked_revenue
WHERE 
    rnk <= 3
ORDER BY 
    category, 
    rnk;