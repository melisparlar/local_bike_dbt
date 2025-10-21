SELECT   product_id,
  INITCAP(TRIM(product_name)) AS product_name,
  brand_id,
  category_id,
  model_year,
  list_price
FROM {{source('local_bike_raw','products')}}
where product_name is not null