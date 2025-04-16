-- Write a solution to report the product_name, year, and price for each sale_id in the Sales table.
select
  product_name,
  year,
  price
from
  Sales s
  join Product p on s.product_id = p.product_id
