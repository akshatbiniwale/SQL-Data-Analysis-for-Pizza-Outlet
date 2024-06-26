-- Retrieve the total number of orders placed 

SELECT 
    COUNT(order_id) AS 'count'
FROM
    orders;