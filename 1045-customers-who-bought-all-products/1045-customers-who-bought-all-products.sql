/* Write your PL/SQL query statement below */
SELECT CUSTOMER_ID
FROM CUSTOMER
GROUP BY CUSTOMER_ID
HAVING COUNT(DISTINCT PRODUCT_KEY) = (SELECT COUNT(*)
                                     FROM PRODUCT)