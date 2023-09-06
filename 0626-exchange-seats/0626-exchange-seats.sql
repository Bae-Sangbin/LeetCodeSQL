/* Write your PL/SQL query statement below */
SELECT ID,
    CASE WHEN MOD(ID, 2) = 0 THEN LAG(STUDENT, 1) OVER(ORDER BY ID)
         ELSE LEAD(STUDENT, 1, STUDENT) OVER(ORDER BY ID) END AS STUDENT
FROM SEAT
