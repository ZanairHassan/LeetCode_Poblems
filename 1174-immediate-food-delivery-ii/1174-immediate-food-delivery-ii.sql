# Write your MySQL query statement below
WITH FirstOrders AS (
    SELECT 
        customer_id,
        MIN(order_date) AS first_order_date
    FROM 
        Delivery
    GROUP BY 
        customer_id
),
FirstOrderDetails AS (
    SELECT 
        DEV.delivery_id,
        DEV.customer_id,
        DEV.order_date,
        DEV.customer_pref_delivery_date
    FROM 
        Delivery DEV
    JOIN 
        FirstOrders fo ON DEV.customer_id = fo.customer_id AND DEV.order_date = fo.first_order_date
)
SELECT 
    ROUND(
        100.0 * SUM(CASE WHEN order_date = customer_pref_delivery_date THEN 1 ELSE 0 END) / COUNT(*), 
        2
    ) AS immediate_percentage
FROM 
    FirstOrderDetails
    ORDER BY
        immediate_percentage;
