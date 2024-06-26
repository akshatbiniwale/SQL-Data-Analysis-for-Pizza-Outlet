-- Determine the distribution of orders by hour of the day.
SELECT 
    HOUR(order_time) AS 'hour', COUNT(order_id) AS 'quantity'
FROM
    orders
GROUP BY hour;