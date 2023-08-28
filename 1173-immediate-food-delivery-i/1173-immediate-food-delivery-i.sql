/* Write your PL/SQL query statement below */
SELECT ROUND(100 * AVG(type), 2) AS immediate_percentage 
FROM (
        SELECT
            CASE
                WHEN ORDER_DATE = customer_pref_delivery_date THEN 1
                ELSE 0 END AS type
        FROM DELIVERY
    )



