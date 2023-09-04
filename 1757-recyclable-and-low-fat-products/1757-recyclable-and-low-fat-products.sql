/* Write your PL/SQL query statement below */
SELECT product_id
FROM PRODUCTS
WHERE LOW_FATS = 'Y'
  AND RECYCLABLE = 'Y'