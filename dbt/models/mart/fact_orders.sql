{{
  config(
    materialized='incremental',
    unique_key='order_id',
    partition_by={
      "field": "order_created_at",
      "data_type": "timestamp",
      "granularity": "day"
    },
    tags=['mart', 'fact']
  )
}}

WITH orders AS (
  SELECT
    order_id,
    user_id,
    status,
    created_at AS order_created_at
  FROM {{ ref('stg_orders') }}
  {% if is_incremental() %}
  WHERE created_at > (SELECT MAX(order_created_at) FROM {{ this }})
  {% endif %}
),

order_items_agg AS (
  SELECT
    order_id,
    SUM(sale_price) AS total_sale_amount,
    SUM(gross_profit) AS total_gross_profit
  FROM {{ ref('int_order_items_enhanced') }}
  {% if is_incremental() %}
  WHERE created_at > (SELECT MAX(order_created_at) FROM {{ this }})
  {% endif %}
  GROUP BY order_id
)

SELECT
  orders.order_id,
  orders.user_id,
  orders.status,
  orders.order_created_at,
  COALESCE(oi.total_sale_amount, 0) AS total_sale_amount,
  COALESCE(oi.total_gross_profit, 0) AS total_gross_profit
FROM orders
LEFT JOIN order_items_agg AS oi USING (order_id)
