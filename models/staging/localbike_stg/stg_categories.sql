SELECT 
  category_id,
  INITCAP(TRIM(category_name)) AS category_name
FROM {{source('local_bike_raw','categories')}}
WHERE category_name IS NOT NULL