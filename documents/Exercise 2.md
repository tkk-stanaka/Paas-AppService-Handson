# Azure App Serviceの作成とデプロイ

## 目次

- [1. Azure App Serviceの作成](#1-azure-app-serviceの作成)
- [2. アプリケーションのデプロイ（手動）](#2-アプリケーションのデプロイ手動)

## 1. Azure App Serviceの作成

<img src="../images/Exercise2/1-01.png" width="800px">
<img src="../images/Exercise2/1-02.png" width="800px">
<img src="../images/Exercise2/1-03.png" width="800px">
<img src="../images/Exercise2/1-05.png" width="800px">
<img src="../images/Exercise2/1-06.png" width="800px">
<img src="../images/Exercise2/1-07.png" width="800px">
<img src="../images/Exercise2/1-08.png" width="800px">
<img src="../images/Exercise2/1-09.png" width="800px">
<img src="../images/Exercise2/1-10.png" width="800px">
<img src="../images/Exercise2/1-11.png" width="800px">
<img src="../images/Exercise2/1-12.png" width="800px">
<img src="../images/Exercise2/1-13.png" width="800px">
<img src="../images/Exercise2/1-14.png" width="800px">
<img src="../images/Exercise2/1-15.png" width="800px">
<img src="../images/Exercise2/1-16.png" width="800px">

## 2. アプリケーションのデプロイ（手動）

### 環境変数を設定
ORACLE_IPADDRESS
xxx

<img src="../images/Exercise2/2-01.png" width="800px">
<img src="../images/Exercise2/2-02.png" width="800px">
<img src="../images/Exercise2/2-03.png" width="800px">
<img src="../images/Exercise2/2-04.png" width="800px">
<img src="../images/Exercise2/2-05.png" width="800px">
<img src="../images/Exercise2/2-06.png" width="800px">

### デプロイ

```
az login
```

<img src="../images/Exercise2/3-01.png" width="800px">
<img src="../images/Exercise2/3-03.png" width="800px">
<img src="../images/Exercise2/3-04.png" width="800px">
<img src="../images/Exercise2/3-05.png" width="800px">
<img src="../images/Exercise2/3-06.png" width="800px">
<img src="../images/Exercise2/3-07.png" width="800px">
<img src="../images/Exercise2/3-08.png" width="800px">
<img src="../images/Exercise2/3-09.png" width="800px">
<img src="../images/Exercise2/3-10.png" width="800px">


```
az webapp deploy --resource-group workshop --name workshop02 --src-path ./target/webapp-java-0.0.1-SNAPSHOT.jar
``` 

<img src="../images/Exercise2/4-01.png" width="800px">
<img src="../images/Exercise2/4-02.png" width="800px">
<img src="../images/Exercise2/4-03.png" width="800px">

---
[Exercise 3 - GitHub ActionsでのCI/CDの設定](./documents/Exercise%203.md)