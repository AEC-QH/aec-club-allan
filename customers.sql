WITH customer_orders AS (
    SELECT customer_id
         , MIN(created_at) AS first_order_at
         , COUNT(*)        AS number_orders
         , MAX(created_at) AS last_order_at
    FROM coffee_shop.orders
    GROUP BY 1
)
SELECT customer_orders.customer_id
     , customers.name
     , customers.email
     , customer_orders.first_order_at
     , customer_orders.number_orders
     , customer_orders.last_order_at
FROM coffee_shop.customers
LEFT OUTER JOIN customer_orders
             ON customers.id = customer_orders.customer_id
ORDER BY customer_orders.first_order_at
LIMIT 5;


