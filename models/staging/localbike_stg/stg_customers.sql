SELECT   
customer_id,
  INITCAP(TRIM(first_name)) AS first_name,
  INITCAP(TRIM(last_name)) AS last_name,
  LOWER(TRIM(email)) AS email,
  phone,
  INITCAP(TRIM(street)) AS street,
  INITCAP(TRIM(city)) AS city,
  UPPER(TRIM(state)) AS state,
  zip_code
FROM {{source('local_bike_raw','customers')}}
where email is not null