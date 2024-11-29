# Front Door + App Serviceの構成

## 目次

- [1. 仮想ネットワーク統合でOracle DBに接続](#1-仮想ネットワーク統合でoracle-dbに接続)
- [2. プライプライベートエンドポイントの設定](#2-プライプライベートエンドポイントの設定)
- [3. Front Doorの設定](#3-front-doorの設定)

## 概要

この演習では、Azure Front Doorを使用して、App Serviceをプライベートエンドポイントとして公開します。また、App ServiceからOracle DBに接続するために、仮想ネットワーク統合を設定します。


## 1. 仮想ネットワーク統合でOracle DBに接続

App Serviceの管理ブレードから「ネットワーク」を選択し、仮想ネットワーク統合を有効にします。
<img src="../images/Exercise5/1-01.png" width="800">

「仮想ネットワーク統合の追加」をクリックします。
<img src="../images/Exercise5/1-02.png" width="800">

「仮想ネットワーク統合の追加」ブレードで、仮想ネットワークを選択し、サブネットを選択します。

- サブスクリプション: 現在使用しているサブスクリプションを選択
- 仮想ネットワーク: SpokeのVNetを選択
- サブネット: subnet-4 を選択

「接続」ボタンをクリックします。
<img src="../images/Exercise5/1-03.png" width="800">

仮想ネットワーク統合が追加されました。
<img src="../images/Exercise5/1-04.png" width="800">

Webアプリケーションにアクセスして、Oracle DBに接続できることを確認します。
URLの末尾に「/users」を追加してアクセスします。

<img src="../images/Exercise5/1-06.png" width="800">

無事にOracle DBに接続できました。

## 2. プライプライベートエンドポイントの設定

次に、App Serviceにプライベートエンドポイントを設定します。「0 プライベートエンドポイント」のリンクをクリックします。
<img src="../images/Exercise5/2-01.png" width="800">

「追加」から「簡易」を選択します。

<img src="../images/Exercise5/2-03.png" width="800">

プライベートエンドポイントの追加を行います。
- 名前: pe-appservice
- サブスクリプション: 現在使用しているサブスクリプションを選択
- 仮想ネットワーク: SpokeのVNetを選択
- サブネット: subnet-3 を選択
- プライベートDNSゾーンと統合する: はい

「OK」をクリックします。
<img src="../images/Exercise5/2-04.png" width="800">

プライベートエンドポイントが追加されました。
<img src="../images/Exercise5/2-06.png" width="800">

次に、公衆ネットワークアクセスを制限します。「アクセス制限なしで有効」のリンクをクリックします。

<img src="../images/Exercise5/3-01.png" width="800">

現在、「すべてのネットワークから有効（現在のアクセス制限がすべてクリアされます）」が選択されています。
<img src="../images/Exercise5/3-02.png" width="800">

公衆ネットワークアクセスの項目を「無効」に変更し、「保存」をクリックします。これで、外部からのアクセスを制限することができます。

<img src="../images/Exercise5/3-03.png" width="800">

チェックボックスにチェックを入れて「続行」をクリックします。
<img src="../images/Exercise5/3-04.png" width="800">

アクセス制限が無効になりました。
<img src="../images/Exercise5/3-05.png" width="800">

Webアプリケーションにアクセスを行うと、403エラーが返却されます。

※開発用のPCからアクセスについては、同じVNet内からのアクセスとなる為通常通りアクセスできます。

<img src="../images/Exercise5/3-06.png" width="800">

## 3. Front Doorの設定

次に、Azure Front Doorを使用して、閉域化したApp Serviceを公開します。
「オプションの受信サービス」から Azure Front Door の「詳細の表示」リンクをクリックします。
<img src="../images/Exercise5/4-01.png" width="800">

Front Door を新規に作成します。「新規作成」リンクをクリックします。
<img src="../images/Exercise5/4-02.png" width="800">

Front Doorの新規作成を行います。
- Front Door プロファイル名: profile1
- エンドポイント名: endpoint1
- 配信元グループ名: group1

「OK」をクリックします。
<img src="../images/Exercise5/4-03.png" width="800">

「作成」ボタンをクリックし、Front Doorを作成します。
<img src="../images/Exercise5/4-04.png" width="800">

Front Doorが追加されると、プライベートリンク接続要求が送信されるため、プライベートリンク接続を承認します。
検索窓から「Private Link」を検索し、サービスを選択します。
<img src="../images/Exercise5/4-05.png" width="800">

管理ブレードから「保留中の接続」を選択し、プライベートリンク接続を承認します。
<img src="../images/Exercise5/4-06.png" width="800">

Front Doorサービスを開き、エンドポイントのホスト名をコピーします。
<img src="../images/Exercise5/4-08.png" width="800">

Front Doorのエンドポイントにアクセスします。
<img src="../images/Exercise5/4-07.png" width="800">

無事にWebアプリケーションにアクセスできました。

## 参考資料

- [アプリを Azure 仮想ネットワークと統合する](https://learn.microsoft.com/ja-jp/azure/app-service/overview-vnet-integration)
- [Azure App Service で仮想ネットワーク統合を有効にする](https://learn.microsoft.com/ja-jp/azure/app-service/configure-vnet-integration-enable)
- [App Service アプリにプライベート エンドポイントを使用する](https://learn.microsoft.com/ja-jp/azure/app-service/overview-private-endpoint)
- [Application Gateway の統合](https://learn.microsoft.com/ja-jp/azure/app-service/overview-app-gateway-integration)
- [Azure Front Door とは](https://learn.microsoft.com/ja-jp/azure/frontdoor/front-door-overview)
- [クイックスタート: Azure portal を使用して Azure Front Door を作成する](https://learn.microsoft.com/ja-jp/azure/frontdoor/create-front-door-portal)

---
[Exercise 6 - Application Insightsの設定](./Exercise%206.md)
