/* Write your PL/SQL query statement below */
SELECT U.UNIQUE_ID, E.NAME
FROM EMPLOYEES E, EMPLOYEEUNI U
WHERE E.ID = U.ID(+)
