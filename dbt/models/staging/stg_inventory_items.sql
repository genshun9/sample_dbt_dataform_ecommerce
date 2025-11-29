{{
  config(
    materialized='view',
    tags=['staging']
  )
}}

SELECT
  id AS inventory_item_id,
  cost
FROM {{ source('thelook_ecommerce', 'inventory_items') }}
WHERE
  DATE(created_at) >= '2025-01-01'
