with
  first_year_table as (
    select
      product_id,
      min(year) as first_year
    from
      sales
    group by
      product_id
  )
select
  p.product_id,
  f.first_year,
  s.quantity,
  s.price
from
  first_year_table f,
  sales s,
  product p
where
  p.product_id = s.product_id
  and f.product_id = s.product_id
  and f.first_year = s.year
