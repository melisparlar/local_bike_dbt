SELECT 
brand_id,
INITCAP(TRIM(brand_name)) as brand_name
FROM {{source('local_bike_raw','brands')}}
where brand_name is not null
