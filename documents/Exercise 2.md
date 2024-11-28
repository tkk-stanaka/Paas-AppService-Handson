# Azure App Serviceの作成とデプロイ

## 目次

- [1. Azure App Serviceの作成](#1-azure-app-serviceの作成)
- [2. アプリケーションのデプロイ（手動）](#2-アプリケーションのデプロイ手動)

## 概要

この演習では、Azure App Service を作成し、Java アプリケーションをデプロイします。

## 1. Azure App Serviceの作成

Azure Portal から App Service を開きます。
<img src="../images/Exercise2/1-01.png" width="800px">

「作成」から「Web アプリ」を選択します。
<img src="../images/Exercise2/1-03.png" width="800px">

Web アプリの設定を行います。
- リソースグループ: workshop
- 名前: workshop01
- 公開: コード
- ランタイムスタック: Java 17
- Java Web サーバのスタック: Java SE(Embedded Web Server)
- オペレーティングシステム: Linux
- リージョン: West US
- Linux プラン: (新規)ASP-xxxxx
- 価格プラン: Plemium XXXX 

「次: データベース」をクリックします。
<img src="../images/Exercise2/1-05.png" width="800px">
<img src="../images/Exercise2/1-06.png" width="800px">

データベースの設定を行います。
変更なしで「次: デプロイ」をクリックします。
<img src="../images/Exercise2/1-07.png" width="800px">

デプロイの設定を行います。
変更なしで「次: ネットワーク」をクリックします。
<img src="../images/Exercise2/1-08.png" width="800px">

ネットワークの設定を行います。
変更なしで「次: 監視とセキュリティ保護」をクリックします。
<img src="../images/Exercise2/1-09.png" width="800px">

監視とセキュリティ保護の設定を行います。
- Application Insights を有効にする: はい
- Application Insights: (新しい)workshop1

「次: タグ」をクリックします。
<img src="../images/Exercise2/1-10.png" width="800px">

タグの設定を行います。
変更なしで「次: 確認および作成」をクリックします。
<img src="../images/Exercise2/1-11.png" width="800px">

内容に問題がなければ「作成」をクリックします。
<img src="../images/Exercise2/1-12.png" width="800px">
<img src="../images/Exercise2/1-13.png" width="800px">

作成が完了すると、リソースが表示されます。Web アプリの URL を確認します。
<img src="../images/Exercise2/1-15.png" width="800px">

Web アプリの URL にアクセスして、デフォルトのページが表示されることを確認します。
<img src="../images/Exercise2/1-16.png" width="800px">

## 2. アプリケーションのデプロイ（手動）

次に、アプリケーションのデプロイを行います。
App Service に Oracle への接続情報を設定します。Oracle Database のIPアドレスを取得します。

<img src="../images/Exercise2/2-01.png" width="800px">

### 環境変数を設定

管理ブレードから「設定」を選択し、「環境変数」を開きます。「追加」をクリックして環境変数を追加します。
<img src="../images/Exercise2/2-02.png" width="800px">

環境変数を追加します。
- 名前: ORACLE_IPADDRESS
- 値: 先ほど取得した Oracle Database の IP アドレス

「適用」をクリックします。

<img src="../images/Exercise2/2-03.png" width="800px">

もう一度「適用」をクリックします。
<img src="../images/Exercise2/2-04.png" width="800px">

変更内容の保存を聞かれますので、「確認」をクリックします。
<img src="../images/Exercise2/2-05.png" width="800px">

環境変数が追加されました。
<img src="../images/Exercise2/2-06.png" width="800px">

### デプロイ

次に、アプリケーションをデプロイします。まずは、アプリケーションディレクトリに移動します。

```bash
cd webapp-java
```
<img src="../images/Exercise2/3-01.png" width="800px">

Azure CLI を使ってデプロイを行います。Azure CLI でログインします。ログイン画面が立ち上がるので、Azure アカウントでログインします。

```
az login
```

<img src="../images/Exercise2/3-03.png" width="800px">
<img src="../images/Exercise2/3-04.png" width="800px">
<img src="../images/Exercise2/3-05.png" width="800px">
<img src="../images/Exercise2/3-06.png" width="800px">
<img src="../images/Exercise2/3-07.png" width="800px">
<img src="../images/Exercise2/3-08.png" width="800px">
<img src="../images/Exercise2/3-09.png" width="800px">
<img src="../images/Exercise2/3-10.png" width="800px">

Azure CLIを使ってデプロイを行います。

```
az webapp deploy --resource-group workshop --name <アプリケーション名> --src-path ./target/webapp-java-0.0.1-SNAPSHOT.jar
``` 

<img src="../images/Exercise2/4-01.png" width="800px">

デプロイが完了しました。Web アプリの URL にアクセスして、アプリケーションが表示されることを確認します。
<img src="../images/Exercise2/4-02.png" width="800px">

アプリケーションが表示されました。
<img src="../images/Exercise2/4-03.png" width="800px">

## 参考資料
- [App Service の概要](https://learn.microsoft.com/ja-jp/azure/app-service/overview)
- [クイック スタート:Azure App Service で Java アプリを作成する](https://learn.microsoft.com/ja-jp/azure/app-service/quickstart-java?tabs=springboot&pivots=java-javase)

---
[Exercise 3 - GitHub ActionsでのCI/CDの設定](./documents/Exercise%203.md)