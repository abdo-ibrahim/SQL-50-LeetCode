/*
If the customer's preferred delivery date is the same as the order date, then the order is called immediate; otherwise, it is called scheduled.

The first order of a customer is the order with the earliest order date that the customer made. It is guaranteed that a customer has precisely one first order.

Write a solution to find the percentage of immediate orders in the first orders of all customers, rounded to 2 decimal places.
*/

WITH FirstOrders AS (
  SELECT customer_id, MIN(order_date) AS first_order_date
  FROM Delivery
  GROUP BY customer_id
)
SELECT
  ROUND(
    SUM(CASE WHEN d.order_date = d.customer_pref_delivery_date THEN 1.0 ELSE 0 END) * 100 / COUNT(*),
    2
  ) AS immediate_percentage
FROM Delivery d , FirstOrders f
where d.customer_id = f.customer_id AND d.order_date = f.first_order_date;
