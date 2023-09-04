/* Write your PL/SQL query statement below */
SELECT ACTOR_ID, DIRECTOR_ID
FROM ACTORDIRECTOR
GROUP BY ACTOR_ID, DIRECTOR_ID
HAVING COUNT(*) >= 3