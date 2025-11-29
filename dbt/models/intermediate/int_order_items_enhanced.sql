{{
  config(
    materialized='ephemeral',
    tags=['intermediate']
  )
}}

WITH order_items AS (
  SELECT * FROM {{ ref('stg_order_items') }}
),

inventory AS (
  SELECT 
    inventory_item_id,
    cost AS product_cost
  FROM {{ ref('stg_inventory_items') }}
)

SELECT
  order_items.order_id,
  order_items.sale_price,
  order_items.created_at,
  order_items.sale_price - COALESCE(inventory.product_cost, 0) AS gross_profit
FROM order_items
LEFT JOIN inventory USING (inventory_item_id)
