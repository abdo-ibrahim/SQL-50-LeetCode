/*
We define query quality as:
The average of the ratio between query rating and its position.
We also define poor query percentage as:
The percentage of all queries with rating less than 3.
Write a solution to find each query_name, the quality and poor_query_percentage.
Both quality and poor_query_percentage should be rounded to 2 decimal places.
*/
SELECT
  query_name,
  ROUND(AVG(rating * 1.0 / position), 2) AS quality,
  ROUND(
    SUM(
      CASE
        WHEN rating < 3 THEN 1.0
        ELSE 0
      END
    ) * 100.0 / COUNT(*),
    2
  ) AS poor_query_percentage
FROM
  Queries
GROUP BY
  query_name;
