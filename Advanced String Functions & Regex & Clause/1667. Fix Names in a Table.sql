SELECT
  user_id,
  CONCAT (
    UPPER(SUBSTRING(name, 1, 1)),
    LOWER(SUBSTRING(name, 2, LEN (name)))
  ) AS name
FROM
  users
order by
  user_id;
