/* Write your PL/SQL query statement below */
SELECT DEPARTMENT, EMPLOYEE, SALARY
FROM (
    SELECT
        D.NAME AS DEPARTMENT, E.NAME AS EMPLOYEE, SALARY,
        RANK() OVER(PARTITION BY D.ID ORDER BY E.SALARY DESC) AS RNK
    FROM EMPLOYEE E, DEPARTMENT D
    WHERE E.DEPARTMENTID = D.ID
    )
WHERE RNK = 1

