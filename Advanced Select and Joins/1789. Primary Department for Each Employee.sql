WITH
  employee_no_primary AS (
    SELECT
      employee_id,
      department_id
    FROM
      Employee
    WHERE
      employee_id NOT IN (
        SELECT
          employee_id
        FROM
          Employee
        GROUP BY
          employee_id
        HAVING
          COUNT(department_id) > 1
      )
  ),
  employee_primary AS (
    SELECT
      employee_id,
      department_id
    FROM
      Employee
    WHERE
      primary_flag = 'Y'
  )
SELECT
  employee_id,
  department_id
FROM
  employee_primary
UNION ALL
SELECT
  employee_id,
  department_id
FROM
  employee_no_primary;

