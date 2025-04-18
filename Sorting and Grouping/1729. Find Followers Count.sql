SELECT
  user_id,
  COUNT(follower_id) AS follower_count
FROM
  followers
GROUP BY
  user_id
