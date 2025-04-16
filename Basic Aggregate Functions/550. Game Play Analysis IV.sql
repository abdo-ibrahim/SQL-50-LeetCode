/*
Write a solution to report the fraction of players that logged in again on the day after the day they first logged in, rounded to 2 decimal places. In other words, you need to count the number of players that logged in for at least two consecutive days starting from their first login date, then divide that number by the total number of players.
*/
WITH
  FirstPlayers AS (
    SELECT
      player_id,
      MIN(event_date) AS first_login_date
    FROM
      Activity
    GROUP BY
      player_id
  )
SELECT
  ROUND(
    COUNT(DISTINCT A.player_id) * 1.0 / (
      SELECT
        COUNT(*)
      FROM
        FirstPlayers
    ),
    2
  ) AS fraction
FROM
  Activity A
  JOIN FirstPlayers F ON A.player_id = F.player_id
  AND A.event_date = DATEADD (DAY, 1, F.first_login_date);
