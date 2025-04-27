WITH distLoc AS (
    SELECT lat, lon
    FROM Insurance
    GROUP BY lat, lon
    HAVING COUNT(*) = 1
),
sameTiv AS (
    SELECT tiv_2015
    FROM Insurance
    GROUP BY tiv_2015
    HAVING COUNT(*) > 1
)
SELECT ROUND(SUM(i.tiv_2016), 2) AS tiv_2016
FROM Insurance i
JOIN distLoc d ON i.lat = d.lat AND i.lon = d.lon
JOIN sameTiv s ON i.tiv_2015 = s.tiv_2015;