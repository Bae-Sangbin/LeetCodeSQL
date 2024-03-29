/* Write your PL/SQL query statement below */
SELECT NAME AS person_name
FROM (
    SELECT 
        TURN, ID, NAME, WEIGHT, TOTAL_WEIGHT,
        ROW_NUMBER() OVER(ORDER BY TOTAL_WEIGHT DESC) AS RK
    FROM (
        SELECT
            TURN, PERSON_ID AS ID, PERSON_NAME AS NAME, WEIGHT, 
            SUM(WEIGHT) OVER(ORDER BY TURN
                            ROWS UNBOUNDED PRECEDING) AS TOTAL_WEIGHT
        FROM QUEUE
    )
    WHERE TOTAL_WEIGHT <= 1000
)
WHERE RK = 1 