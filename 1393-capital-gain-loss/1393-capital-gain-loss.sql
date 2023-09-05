/* Write your PL/SQL query statement below */
SELECT STOCK_NAME, SUM(ADJ_PRICE) AS capital_gain_loss
FROM (
    SELECT stock_name, 
        CASE WHEN OPERATION = 'Buy' THEN -price
             ELSE price END AS ADJ_PRICE
    FROM STOCKS
    )
GROUP BY STOCK_NAME
