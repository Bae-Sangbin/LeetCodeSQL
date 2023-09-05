/* Write your PL/SQL query statement below */
SELECT MACHINE_ID, ROUND(SUM(ADJ_TIMESTAMP)/COUNT(DISTINCT PROCESS_ID), 3) AS PROCESSING_TIME
FROM (
    SELECT MACHINE_ID, PROCESS_ID,
        CASE WHEN ACTIVITY_TYPE = 'start' THEN -timestamp
        ELSE TIMESTAMP END AS ADJ_TIMESTAMP
    FROM ACTIVITY
    )
GROUP BY MACHINE_ID