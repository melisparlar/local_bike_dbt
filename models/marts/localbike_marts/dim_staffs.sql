WITH staff_sales AS (
  SELECT
    staff_id,
    COUNT(DISTINCT order_id) AS total_orders_handled,
    SUM(total_sales_amount) AS total_sales_amount
  FROM {{ref('int_sales_enriched')}} 
  GROUP BY staff_id
)
SELECT
  s.staff_id,
  s.first_name, 
  s.last_name,
  s.email,
  s.phone,
  s.store_id,
  COALESCE(ss.total_orders_handled, 0) AS total_orders_handled,
  COALESCE(ss.total_sales_amount, 0) AS total_sales_amount
FROM {{ref('stg_staffs')}} s
LEFT JOIN staff_sales ss
  ON s.staff_id = ss.staff_id
