SELECT 
  *
FROM {{source('local_bike_raw','orders')}}
where order_status is not null