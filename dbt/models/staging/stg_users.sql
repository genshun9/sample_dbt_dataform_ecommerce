{{
  config(
    materialized='view',
    tags=['staging']
  )
}}

SELECT
  user_id,
  first_name,
  last_name,
  age,
  gender,
  country,
  created_at
FROM
  {{ ref('users_snapshot') }}
WHERE
  dbt_valid_to IS NULL
