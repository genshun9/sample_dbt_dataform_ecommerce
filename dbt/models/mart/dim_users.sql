{{
  config(
    materialized='table',
    tags=['mart', 'dimension']
  )
}}

SELECT
  user_id,
  age,
  gender,
  country
FROM {{ ref('stg_users') }}
