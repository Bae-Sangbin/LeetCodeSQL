# Write your MySQL query statement below
SELECT P.PRODUCT_NAME, SUM(UNIT) AS UNIT
FROM PRODUCTS P, ORDERS O
WHERE P.PRODUCT_ID = O.PRODUCT_ID
AND EXTRACT(YEAR FROM ORDER_DATE) = 2020
AND EXTRACT(MONTH FROM ORDER_DATE) = 2
GROUP BY P.PRODUCT_NAME
HAVING SUM(UNIT) >= 100