{% snapshot users_snapshot %}

{{
  config(
    unique_key='user_id',
    strategy='timestamp',
    updated_at='created_at',
    invalidate_hard_deletes=True
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
FROM {{ source('ecommerce_sample_data', 'raw_users') }}

{% endsnapshot %}
