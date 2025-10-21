SELECT
  c.customer_id,
  CONCAT(c.first_name, ' ', c.last_name) AS full_name,
  c.email,
  c.city,
  c.state,
  ca.total_orders,
  ca.total_revenue,
  ca.last_order_date,
  CASE
    WHEN ca.last_order_date > DATE_SUB(CURRENT_DATE(), INTERVAL 6 MONTH) THEN 'Actif'
    ELSE 'Inactif'
  END AS customer_status
FROM {{ref('stg_customers')}} c
LEFT JOIN {{ref('int_customer_activity')}} ca
  ON c.customer_id = ca.customer_id 

