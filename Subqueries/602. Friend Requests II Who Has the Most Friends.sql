
SELECT TOP 1 X.id, count(X.id) as num
FROM (
    SELECT requester_id as id
    FROM RequestAccepted
    UNION ALL
    SELECT accepter_id
    FROM RequestAccepted
) X
GROUP BY X.id
ORDER BY num DESC;

-- WITH Requests AS (
--   SELECT requester_id AS id, COUNT(*) AS num
--   FROM RequestAccepted
--   GROUP BY requester_id
-- ),
-- Accepted AS (
--   SELECT accepter_id AS id, COUNT(*) AS num
--   FROM RequestAccepted
--   GROUP BY accepter_id
-- )
-- SELECT TOP 1 
--   COALESCE(r.id, a.id) AS id,
--   COALESCE(r.num, 0) + COALESCE(a.num, 0) AS num
-- FROM Requests r
-- FULL JOIN Accepted a ON r.id = a.id
-- ORDER BY num DESC;

