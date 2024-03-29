


SELECT ROUND(SUM(TIV_2016), 2) AS TIV_2016
FROM (
  SELECT A.PID, A.TIV_2015, A.TIV_2016, A.LAT, A.LON, A.CNT1, B.CNT2
  FROM (
    SELECT PID, TIV_2015, TIV_2016, LAT, LON, COUNT(*) OVER(PARTITION BY TIV_2015) AS CNT1
    FROM INSURANCE
  ) A, (
    SELECT PID, TIV_2015, TIV_2016, LAT, LON, COUNT(*) OVER(PARTITION BY LAT, LON) AS CNT2
    FROM INSURANCE
  ) B
  WHERE A.PID = B.PID
  AND CNT1 != 1 AND CNT2 = 1
)

