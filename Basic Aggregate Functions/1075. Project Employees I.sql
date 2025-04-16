select
  p.project_id,
  Round(avg(e.experience_years * 1.0), 2) as average_years
from
  Employee e
  join Project p on e.employee_id = p.employee_id
group by
  p.project_id
