{{
  config(
    materialized='view',
    tags=['staging']
  )
}}

SELECT
  promo_date,
  promo_name,
  discount_rate
FROM {{ ref('promotion_calendar') }}
