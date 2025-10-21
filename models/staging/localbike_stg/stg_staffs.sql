SELECT 
  staff_id,
  INITCAP(TRIM(first_name)) AS first_name,
  INITCAP(TRIM(last_name)) AS last_name,
  LOWER(TRIM(email)) AS email,
  phone,
  active,
  store_id,
  manager_id
FROM {{source('local_bike_raw','staffs')}}
