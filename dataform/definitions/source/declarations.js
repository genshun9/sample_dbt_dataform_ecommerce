// BigQuery公開データセット thelook_ecommerce のソース定義

declare({
  database: "bigquery-public-data",
  schema: "thelook_ecommerce",
  name: "products"
});

declare({
  database: "bigquery-public-data",
  schema: "thelook_ecommerce",
  name: "orders"
});

declare({
  database: "bigquery-public-data",
  schema: "thelook_ecommerce",
  name: "order_items"
});

declare({
  database: "bigquery-public-data",
  schema: "thelook_ecommerce",
  name: "inventory_items"
});
