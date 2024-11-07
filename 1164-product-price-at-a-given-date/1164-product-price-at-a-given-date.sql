# Write your MySQL query statement below
WITH LatestPrice AS (
    SELECT 
        product_id,
        new_price,
        change_date,
        ROW_NUMBER() 
    OVER (PARTITION BY product_id
          ORDER BY change_date DESC) AS row_num
    FROM 
        Products
    WHERE 
        change_date <= '2019-08-16'
)

SELECT 
    p.product_id,
    COALESCE(lp.new_price, 10) AS price
FROM 
    (SELECT DISTINCT product_id FROM Products) p
LEFT JOIN 
    LatestPrice lp ON 
    p.product_id = lp.product_id AND lp.row_num = 1
ORDER BY 
    P.product_id;
