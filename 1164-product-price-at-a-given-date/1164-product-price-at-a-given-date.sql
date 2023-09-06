/* Write your PL/SQL query statement below */
SELECT PRODUCT_ID, NVL(NEW_PRICE, 10) AS PRICE
FROM (
    SELECT P1.PRODUCT_ID, P2.NEW_PRICE,
        ROW_NUMBER() OVER(PARTITION BY P1.PRODUCT_ID ORDER BY P2.CHANGE_DATE DESC) AS RN
    FROM PRODUCTS P1, (SELECT * FROM PRODUCTS WHERE CHANGE_DATE <= '2019-08-16') P2
    WHERE P1.PRODUCT_ID = P2.PRODUCT_ID(+)
    )
WHERE RN = 1