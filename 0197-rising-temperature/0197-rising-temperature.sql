/* Write your PL/SQL query statement below */
SELECT ID
FROM (
    SELECT
        ID, 
        LAG(RECORDDATE, 1) OVER(ORDER BY RECORDDATE) AS PREV_DATE, -- 어제 날짜
        LAG(TEMPERATURE, 1) OVER(ORDER BY RECORDDATE) AS PREV_TEMPERATURE, -- 어제 temperature
        RECORDDATE, -- 오늘 날짜
        TEMPERATURE -- 오늘 temperature
    FROM WEATHER
)
WHERE PREV_TEMPERATURE < TEMPERATURE
AND RECORDDATE - PREV_DATE = 1
;