SELECT
  order_id,
  order_date,
  customer_id,
  product_id,
  store_id,
  quantity,
  list_price,
  discount,
  total_sales_amount
FROM {{ ref('int_sales_enriched') }}
