

SELECT 
    TO_CHAR(SELL_DATE, 'YYYY-MM-DD') AS SELL_DATE,
    COUNT(PRODUCT) AS NUM_SOLD,
    LISTAGG(PRODUCT, ',') WITHIN GROUP(ORDER BY PRODUCT) AS PRODUCTS
FROM (SELECT DISTINCT *
      FROM ACTIVITIES) 
GROUP BY SELL_DATE
ORDER BY SELL_DATE
