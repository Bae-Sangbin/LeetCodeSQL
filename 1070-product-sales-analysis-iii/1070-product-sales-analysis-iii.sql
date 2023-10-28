/* Write your PL/SQL query statement below */
SELECT 
    PRODUCT_ID, 
    YEAR AS FIRST_YEAR, 
    QUANTITY, 
    PRICE
FROM (
    SELECT
        PRODUCT_ID, 
        YEAR, 
        QUANTITY, 
        PRICE,
        RANK() OVER(PARTITION BY PRODUCT_ID
                    ORDER BY YEAR ASC) AS RNK
    FROM SALES
) 
WHERE RNK = 1
;