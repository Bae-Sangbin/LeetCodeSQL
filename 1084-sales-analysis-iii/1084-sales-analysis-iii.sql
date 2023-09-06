/* Write your PL/SQL query statement below */
SELECT DISTINCT P.PRODUCT_ID, P.PRODUCT_NAME
FROM PRODUCT P, SALES S
WHERE P.PRODUCT_ID = S.PRODUCT_ID
AND P.PRODUCT_ID NOT IN (SELECT PRODUCT_ID
                      FROM SALES
                      WHERE TO_CHAR(SALE_DATE, 'YYYY-MM-DD') < '2019-01-01' 
                         OR TO_CHAR(SALE_DATE, 'YYYY-MM-DD') > '2019-03-31')