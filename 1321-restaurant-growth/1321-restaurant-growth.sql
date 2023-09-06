/* Write your PL/SQL query statement below */
SELECT 
  TO_CHAR(VISITED_ON, 'YYYY-MM-DD') AS VISITED_ON,
  TOTAL_AMOUNT AS AMOUNT,
  ROUND(TOTAL_AMOUNT / 7, 2) AS AVERAGE_AMOUNT
FROM (
  SELECT VISITED_ON, TOTAL_AMOUNT
  FROM ( 
    SELECT
      VISITED_ON, MIN(VISITED_ON) OVER() AS FIRST_DATE,
      AMOUNT, SUM(AMOUNT) OVER(ORDER BY VISITED_ON
                              RANGE INTERVAL '6' DAY PRECEDING) AS TOTAL_AMOUNT
    FROM (
      SELECT VISITED_ON, SUM(AMOUNT) AS AMOUNT
        FROM CUSTOMER
      GROUP BY VISITED_ON
    )
  )
  WHERE VISITED_ON >= FIRST_DATE + 6
)
ORDER BY VISITED_ON ASC