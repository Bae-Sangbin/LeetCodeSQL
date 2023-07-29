SELECT STOCK_NAME, SUM(PRICES) AS CAPITAL_GAIN_LOSS
FROM (
SELECT 
    STOCK_NAME,
    OPERATION,
    CASE WHEN OPERATION = 'Buy' THEN -PRICE
    ELSE PRICE END AS PRICES
FROM STOCKS
    )
GROUP BY STOCK_NAME