WITH staff_count AS (
  SELECT
    store_id,
    COUNT(staff_id) AS nb_staffs
  FROM {{ ref('stg_staffs') }}
  GROUP BY store_id
)
SELECT
  s.store_id,
  s.store_name,
  s.city,
  s.state,
  s.zip_code,
  CASE 
    WHEN s.state IN ('CA', 'OR', 'WA') THEN 'Ouest'
    WHEN s.state IN ('NY', 'NJ', 'MA') THEN 'Est'
    WHEN s.state IN ('TX', 'FL', 'GA') THEN 'Sud'
    ELSE 'Autre'
  END AS region,
  COALESCE(st.nb_staffs, 0) AS nb_staffs
FROM {{ ref('stg_stores') }} s
LEFT JOIN staff_count st
  ON s.store_id = st.store_id