SELECT 
  store_id,
  INITCAP(TRIM(store_name)) AS store_name,
  INITCAP(TRIM(phone)) AS phone,
  INITCAP(TRIM(email)) AS email,
  INITCAP(TRIM(street)) AS street,
  INITCAP(TRIM(city)) AS city,
  UPPER(TRIM(state)) AS state,
  zip_code
FROM {{source('local_bike_raw','stores')}}
