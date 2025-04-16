-- Write a solution to find all dates' id with higher temperatures compared to its previous dates (yesterday).
SELECT
  today.id
FROM
  Weather yesterday
  JOIN Weather today ON DATEDIFF (DAY, yesterday.recordDate, today.recordDate) = 1
WHERE
  today.temperature > yesterday.temperature;

-- SELECT
--   today.id
-- FROM
--   Weather yesterday,
--   Weather today
-- WHERE
--   DATEDIFF (DAY, yesterday.recordDate, today.recordDate) = 1
--   and today.temperature > yesterday.temperature;
