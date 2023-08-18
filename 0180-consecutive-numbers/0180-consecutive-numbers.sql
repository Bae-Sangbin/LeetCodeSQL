/* Write your PL/SQL query statement below */
WITH abc AS (
  SELECT num,
  LEAD (num,1) OVER (ORDER BY id) num1,
  LEAD (num,2) OVER (ORDER BY id) num2
  FROM logs
)

SELECT DISTINCT num AS ConsecutiveNums FROM abc 
WHERE num = num1
AND num = num2