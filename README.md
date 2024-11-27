# Paas-AppService-Handson

## 概要


## 目次

- [Exersise 1 - 開発環境の構築](./documents/Exercise%201.md)
- [Exersise 2 - データベースの作成](./documents/Exercise%202.md)


---

## メモ

```
./mvnw clean install
./mvnw spring-boot:run
```

```
az login --tenant <テナントID>
az group create --name <リソース グループ名> --location westus
az deployment group create --resource-group <リソース グループ名> --template-file ./template/bicep/modules/virtualnetwork_spoke.bicep --parameters ./template/bicep/parameters/virtualnetwork_spoke.bicepparam
az deployment group create --resource-group <リソース グループ名> --template-file ./template/bicep/templates/bastion.bicep --parameters ./template/bicep/parameters/bastion.bicepparam
az deployment group create --resource-group <リソース グループ名> --template-file ./template/bicep/modules/container_instance.bicep --parameters ./template/bicep/parameters/container_instance.bicepparam

```

```
az container exec -g <リソース グループ名> --name <コンテナ名>  --exec-command "/bin/bash"
curl -o ./scott.sql  "https://raw.githubusercontent.com/h-morozumi/Paas-AppService-Handson/refs/heads/main/template/sql/scott.sql"
sqlplus SYSTEM/password@XEPDB1 @./scott.sql
```
