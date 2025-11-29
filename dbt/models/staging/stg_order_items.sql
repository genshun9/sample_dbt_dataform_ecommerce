{{
  config(
    materialized='view',
    tags=['staging']
  )
}}

SELECT
  order_id,
  inventory_item_id,
  sale_price,
  created_at
FROM {{ source('thelook_ecommerce', 'order_items') }}
WHERE
  DATE(created_at) >= '2025-01-01'
