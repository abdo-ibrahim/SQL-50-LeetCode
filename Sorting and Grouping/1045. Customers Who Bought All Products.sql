SELECT
  customer_id
FROM
  customer c
  JOIN product p ON c.product_key = p.product_key
GROUP BY
  customer_id
HAVING
  COUNT(DISTINCT p.product_key) = (
    SELECT COUNT(*)
    FROM product
  );
