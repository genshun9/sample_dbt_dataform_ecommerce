{{
  config(
    materialized='view',
    tags=['staging']
  )
}}

SELECT
  order_id,
  user_id,
  status,
  created_at
FROM {{ source('thelook_ecommerce', 'orders') }}
WHERE
  DATE(created_at) >= '2025-01-01'
