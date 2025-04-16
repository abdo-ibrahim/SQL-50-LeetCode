-- Write a solution to show the unique ID of each user, If a user does not have a unique ID replace just show null.
select
  unique_id,
  name
from
  EmployeeUNI
  right join Employees on EmployeeUNI.id = Employees.id
