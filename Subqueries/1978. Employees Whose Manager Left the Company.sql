SELECT m.employee_id
FROM Employees m
WHERE m.manager_id IS NOT NULL and m.salary < 30000
  AND m.manager_id NOT IN (
    SELECT DISTINCT employee_id
    FROM Employees
)
order by m.employee_id;