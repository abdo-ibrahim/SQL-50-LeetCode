WITH FirstOrders AS (
    SELECT product_id, MAX(change_date) as change_date
    FROM Products
    WHERE change_date <= '2019-08-16'
    GROUP BY product_id
)
SELECT 
    P.product_id, 
    ISNULL(F.new_price, 10) as price
FROM 
    (SELECT DISTINCT product_id FROM Products) P 
    LEFT JOIN FirstOrders FO ON P.product_id = FO.product_id
    LEFT JOIN Products F ON P.product_id = F.product_id 
        AND F.change_date = FO.change_date;