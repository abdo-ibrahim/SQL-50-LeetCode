WITH CumulativeWeight AS (
    SELECT 
        person_id,
        person_name,
        weight,
        turn,
        SUM(weight) OVER (ORDER BY turn) AS running_total
    FROM Queue
)
SELECT TOP 1 person_name
FROM CumulativeWeight
WHERE running_total <= 1000
ORDER BY turn DESC;

-- SELECT Top 1 q1.person_name
-- FROM Queue q1
-- WHERE ( -- 2D Loop
--     SELECT SUM(weight)
--     FROM Queue q2
--     WHERE q2.turn <= q1.turn
-- ) <= 1000
-- ORDER BY q1.turn DESC;