WITH RankedSalaries AS (
    SELECT salary, ROW_NUMBER() OVER (ORDER BY salary DESC) AS row_num
    FROM Employee
)
SELECT 
    CASE 
        WHEN COUNT(salary) < 2 THEN NULL
        ELSE MAX(salary)
    END AS SecondHighestSalary
FROM RankedSalaries
WHERE row_num > 1;
