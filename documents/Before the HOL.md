# 事前準備

## 環境構築

### 1. リポジトリのクローン


### 2. リソースの展開

azure cliを使用して、リソースを展開します。

```bash
az login --tenant <テナントID>
```

```bash
az group create --name <リソース グループ名> --location westus
```

```bash
az deployment group create --resource-group <リソース グループ名> --template-file ./template/bicep/modules/virtualnetwork_spoke.bicep --parameters ./template/bicep/parameters/virtualnetwork_spoke.bicepparam
```

```bash
az deployment group create --resource-group <リソース グループ名> --template-file ./template/bicep/templates/bastion.bicep --parameters ./template/bicep/parameters/bastion.bicepparam
```

### 3. データベースの作成

```bash
az deployment group create --resource-group <リソース グループ名> --template-file ./template/bicep/modules/container_instance.bicep --parameters ./template/bicep/parameters/container_instance.bicepparam
```

```bash
az container exec -g <リソース グループ名> --name <コンテナ名>  --exec-command "/bin/bash"
```

```bash
curl -o ./scott.sql  "https://raw.githubusercontent.com/h-morozumi/Paas-AppService-Handson/refs/heads/main/template/sql/scott.sql"
```

```bash
sqlplus SYSTEM/password@XEPDB1 @./scott.sql
```

```bash
sqlplus SCOTT/tiger@XEPDB1
```

```bash
SELECT EMPNO, ENAME FROM EMP;
```
