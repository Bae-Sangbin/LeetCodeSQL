/* Write your PL/SQL query statement below */

SELECT
      REQUEST_AT AS DAY,
      ROUND(COUNT(P)/COUNT(ID),2) AS "Cancellation Rate"
FROM (
      SELECT 
            ID, REQUEST_AT, 
            CASE WHEN STATUS LIKE 'cancelled%' THEN 1
            ELSE NULL END AS P
      FROM TRIPS
      WHERE REQUEST_AT BETWEEN '2013-10-01' AND '2013-10-03'
      AND CLIENT_ID IN (
            SELECT USERS_ID
            FROM USERS
            WHERE BANNED <> 'Yes'
      )
      AND DRIVER_ID IN (
            SELECT USERS_ID
            FROM USERS
            WHERE BANNED <> 'Yes'
      )
)
GROUP BY REQUEST_AT
