-- Group the orders by date and calculate the average number of pizzas ordered per day.
WITH orders_each_day AS (SELECT 
    O.order_date, SUM(OD.quantity) as "quantity"
FROM
    order_details OD
        INNER JOIN
    orders O
WHERE
    O.order_id = OD.order_id
GROUP BY O.order_date)

SELECT 
    AVG(quantity) "avg orders each day"
FROM
    orders_each_day;