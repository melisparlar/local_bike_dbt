SELECT
  customer_id,
  COUNT(DISTINCT order_id) AS total_orders,
  SUM(quantity) AS total_items_purchased,
  SUM(total_sales_amount) AS total_revenue,
  MAX(order_date) AS last_order_date
FROM {{ref('int_sales_enriched')}}
GROUP BY customer_id
