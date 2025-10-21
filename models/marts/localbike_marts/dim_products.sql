SELECT
  p.product_id,
  p.product_name,
  b.brand_name,
  c.category_name,
  p.model_year,
  p.list_price,
FROM  {{ref('stg_products')}} p
LEFT JOIN {{ref('stg_brands')}} b
  ON p.brand_id = b.brand_id
LEFT JOIN {{ref('stg_categories')}} c
  ON p.category_id = c.category_id