/* Write your PL/SQL query statement below */
SELECT ID, VISIT_DATE, PEOPLE
FROM (
    SELECT ID, TO_CHAR(VISIT_DATE, 'YYYY-MM-DD') AS VISIT_DATE,
        LAG(PEOPLE, 2) OVER(ORDER BY VISIT_DATE) AS PREV_PEOPLE2,
        LAG(PEOPLE, 1) OVER(ORDER BY VISIT_DATE) AS PREV_PEOPLE,
        PEOPLE,
        LEAD(PEOPLE, 1) OVER(ORDER BY VISIT_DATE) AS NEXT_PEOPLE,
        LEAD(PEOPLE, 2) OVER(ORDER BY VISIT_DATE) AS NEXT_PEOPLE2
    FROM STADIUM
)
WHERE (PREV_PEOPLE2 >= 100 AND PREV_PEOPLE >= 100 AND PEOPLE >= 100)
OR (PREV_PEOPLE >= 100 AND PEOPLE >= 100 AND NEXT_PEOPLE >= 100)
OR (PEOPLE >= 100 AND NEXT_PEOPLE >= 100 AND NEXT_PEOPLE2 >= 100)


