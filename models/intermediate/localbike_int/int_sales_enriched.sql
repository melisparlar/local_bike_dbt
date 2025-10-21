
SELECT
  oi.order_id,
  o.order_date,
  o.customer_id,
  o.store_id,
  o.staff_id,
  oi.product_id,
  oi.quantity,
  oi.list_price,
  oi.discount,
  ROUND(oi.quantity * oi.list_price * (1 - oi.discount), 2) AS total_sales_amount
FROM {{ref('stg_order_items')}} oi

LEFT JOIN {{ref('stg_orders')}} o
  ON oi.order_id = o.order_id
WHERE o.order_status IS NOT NULL