with Single as(
SELECT num from MyNumbers
group by num
having count(*) = 1
)
select max(num) as num from Single

-- Solution 2:
-- SELECT MAX(num) AS num
-- FROM (
--   SELECT num
--   FROM MyNumbers
--   GROUP BY num
--   HAVING COUNT(*) = 1
-- ) AS Single;