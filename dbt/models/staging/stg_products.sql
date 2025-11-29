{{
  config(
    materialized='view',
    tags=['staging']
  )
}}

SELECT
  id AS product_id,
  name AS product_name,
  brand,
  category,
  department,
  cost AS product_cost
FROM {{ source('thelook_ecommerce', 'products') }}
