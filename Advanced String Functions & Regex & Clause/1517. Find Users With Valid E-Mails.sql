SELECT *
FROM Users
WHERE mail LIKE '%@leetcode.com'
  AND LEFT(MAIL,1) LIKE '[a-zA-Z]%'
  AND mail NOT LIKE '%[^A-Za-z0-9_.-]%@leetcode.com';