# sample_dbt_dataform_ecommerce
thelook_ecommerceをdbtとdataformでサンプル実装

## 環境構築
- google cloudとの接続関連。gcloudコマンド打てる前提

```bash
# 設定作成
gcloud config configurations create xxxx
gcloud config set project YOUR_PROJECT_ID
gcloud config set account YOUR_GMAIL_ACCOUNT

# Application Default Credentialsを設定
gcloud auth application-default login
```

- dbtの環境刻築。python3があり、venvで仮想環境作る前提

```bash
cd dbt

# python環境
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt

# 疎通確認
dbt debug
dbt deps
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
