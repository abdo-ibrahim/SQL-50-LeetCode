WITH All_Categories AS (
    SELECT 'Low Salary' AS category
    UNION ALL SELECT 'Average Salary'
    UNION ALL SELECT 'High Salary'
),
Accounts_Category AS (
    SELECT
        CASE 
            WHEN income < 20000 THEN 'Low Salary'
            WHEN income BETWEEN 20000 AND 50000 THEN 'Average Salary'  
            WHEN income > 50000 THEN 'High Salary'
        END AS category
    FROM Accounts 
)
SELECT 
    ac.category,
    COALESCE(COUNT(acc.category), 0) AS accounts_count
FROM 
    All_Categories ac
LEFT JOIN 
    Accounts_Category acc ON ac.category = acc.category
GROUP BY 
    ac.category;