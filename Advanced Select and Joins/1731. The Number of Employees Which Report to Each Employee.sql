select
  m.employee_id,
  m.name,
  count(e.reports_to) as reports_count ,
  Round(avg(e.age * 1.0) , 0) as average_age 
from
  Employees m
  JOIN Employees e ON m.employee_id = e.reports_to
GROUP BY
  m.employee_id,
  m.name
order by m.employee_id