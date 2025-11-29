# sample_dbt_dataform_ecommerce
thelook_ecommerceをdbtとdataformでサンプル実装

## 環境構築
- dbtの環境刻築。python3があり、venvで仮想環境作る前提

```bash
cd dbt

# python環境
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt

# 疎通確認
dbt debug
dbt compile
```

- dataformの環境構築。npmが入っている前提

```bash
cd dataform

npm i
# .df-credentials.jsonの生成
dataform install
dataform init-creds
# コンパイル
dataform compile
```
