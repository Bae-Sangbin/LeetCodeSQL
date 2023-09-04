# Write your MySQL query statement below
SELECT ID, MOVIE, DESCRIPTION, RATING
FROM CINEMA
WHERE DESCRIPTION != 'boring'
AND ID % 2 = 1
ORDER BY RATING DESC
