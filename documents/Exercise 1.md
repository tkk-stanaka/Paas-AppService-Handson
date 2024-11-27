# 開発環境の準備

## 目次

- [1. Azure Bastionを利用したWindows仮想マシンへの接続](#azure-bastionを利用したwindows仮想マシンへの接続)
- [2. コンテンツをGithubから取得](#コンテンツをgithubから取得)
- [3. アプリケーションをローカルで実行](#アプリケーションをローカルで実行)
- [4. データベースへの接続確認](#データベースへの接続確認)


## 1. Azure Bastionを利用したWindows仮想マシンへの接続

Azure Bastionを利用することで、Azureポータルを利用してWindows仮想マシンにリモートデスクトップ接続することができます。

[Azure Portal](https://portal.azure.com/)にアクセスし、Azure Bastionを利用するWindows仮想マシンを選択します。

<img src="../images/Exercise1/1-01.png" width="800">
<img src="../images/Exercise1/1-02.png" width="800">
<img src="../images/Exercise1/1-03.png" width="800">
<img src="../images/Exercise1/1-04.png" width="800">
<img src="../images/Exercise1/1-05.png" width="800">
<img src="../images/Exercise1/1-06.png" width="800">

## 2. コンテンツをGithubから取得

作業は、Bastionでログインしている端末で行います。

[GitHub](https://github.com/)にアクセスし、ご自身のアカウントでログインします。

<img src="../images/Exercise1/2-01.png" width="800">


[今回のハンズオン資料](https://github.com/h-morozumi/Paas-AppService-Handson)にアクセスします。

```
https://github.com/h-morozumi/Paas-AppService-Handson
```

<img src="../images/Exercise1/2-02.png" width="800">

コンテンツをForkします。

<img src="../images/Exercise1/2-03.png" width="800">
<img src="../images/Exercise1/2-04.png" width="800">
<img src="../images/Exercise1/2-05.png" width="800">
<img src="../images/Exercise1/2-06.png" width="800">

Forkしたリポジトリをクローンします。

<img src="../images/Exercise1/2-07.png" width="800">
<img src="../images/Exercise1/2-08.png" width="800">
<img src="../images/Exercise1/2-09.png" width="800">
<img src="../images/Exercise1/2-10.png" width="800">
<img src="../images/Exercise1/2-11.png" width="800">
<img src="../images/Exercise1/2-12.png" width="800">
<img src="../images/Exercise1/2-13.png" width="800">

## 3. アプリケーションをローカルで実行

<img src="../images/Exercise1/3-01.png" width="800">
<img src="../images/Exercise1/3-02.png" width="800">


```
cd webapp-java
```
<img src="../images/Exercise1/3-03.png" width="800">


```
./mvnw clean install
```
<img src="../images/Exercise1/3-04.png" width="800">
<img src="../images/Exercise1/3-05.png" width="800">



```
./mvnw spring-boot:run
```
<img src="../images/Exercise1/3-06.png" width="800">
<img src="../images/Exercise1/3-07.png" width="800">



ブラウザで以下のURLにアクセスします。
```
http://localhost:8080
```
<img src="../images/Exercise1/3-08.png" width="800">

Cntrl + Cでアプリケーションを停止します。
<img src="../images/Exercise1/3-09.png" width="800">

## 4. データベースへの接続確認

<img src="../images/Exercise1/4-01.png" width="800">
<img src="../images/Exercise1/4-02.png" width="800">
<img src="../images/Exercise1/4-03.png" width="800">
<img src="../images/Exercise1/4-04.png" width="800">
<img src="../images/Exercise1/4-05.png" width="800">
<img src="../images/Exercise1/4-06.png" width="800">
<img src="../images/Exercise1/4-07.png" width="800">

---
[Exercise 2: Azure App Serviceの作成](./Exercise%202.md)

