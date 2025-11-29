{{
  config(
    materialized='table',
    tags=['mart', 'dimension']
  )
}}

SELECT
  product_id,
  product_name,
  brand,
  category,
  department,
  product_cost
FROM {{ ref('stg_products') }}
