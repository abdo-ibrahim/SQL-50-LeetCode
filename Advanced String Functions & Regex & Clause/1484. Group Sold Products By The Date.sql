WITH t AS (SELECT DISTINCT * FROM Activities)
select sell_date , count(*) as num_sold ,
STRING_AGG(t.product, ',') WITHIN GROUP (ORDER BY t.product) as products
from t
group by sell_date
order by sell_date