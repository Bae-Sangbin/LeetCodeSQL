SELECT PRODUCT_ID, 'store1' AS STORE, STORE1 AS PRICE
FROM PRODUCTS 
WHERE STORE1 IS NOT NULL
UNION
SELECT PRODUCT_ID, 'store2' AS STORE, STORE2 AS PRICE
FROM PRODUCTS 
WHERE STORE2 IS NOT NULL
UNION
SELECT PRODUCT_ID, 'store3' AS STORE, STORE3 AS PRICE
FROM PRODUCTS 
WHERE STORE3 IS NOT NULL
;
