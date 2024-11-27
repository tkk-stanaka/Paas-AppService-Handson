# Azure App Serviceのスロットリングの設定

## 目次

- [1. ステージング環境の準備](#1-ステージング環境の準備)
- [2. ワークフローの修正](#2-ワークフローの修正)
- [3. アプリケーションの更新](#3-アプリケーションの更新)
- [4. ワークフローの実行](#4-ワークフローの実行)
- [5. スワップ操作](#5-スワップ操作)

## 1. ステージング環境の準備

<img src="../images/Exercise4/1-01.png" width="800">
<img src="../images/Exercise4/1-02.png" width="800">
<img src="../images/Exercise4/1-03.png" width="800">
<img src="../images/Exercise4/1-04.png" width="800">
<img src="../images/Exercise4/1-05.png" width="800">

## 2. ワークフローの修正

<img src="../images/Exercise4/2-01.png" width="800">

65行目
```yaml
        with:
          app-name: 'workshop02'
          slot-name: 'staging'
          package: '*.jar'
```

<details>
  <summary>全体</summary>

```yaml
# Docs for the Azure Web Apps Deploy action: https://github.com/Azure/webapps-deploy
# More GitHub Actions for Azure: https://github.com/Azure/actions

name: Build and deploy JAR app to Azure Web App - workshop02

on:
  # push:
  #   branches:
  #     - main
  workflow_dispatch:

env:
  APP_PATH: "webapp-java"

jobs:
  build:
    runs-on: ubuntu-latest

    steps:
      - uses: actions/checkout@v4

      - name: Set up Java version
        uses: actions/setup-java@v4
        with:
          java-version: '17'
          distribution: 'microsoft'

      - name: Build with Maven
        run: cd ${{ env.APP_PATH }} && mvn clean install

      - name: Upload artifact for deployment job
        uses: actions/upload-artifact@v4
        with:
          name: java-app
          path: "${{ github.workspace }}/${{ env.APP_PATH }}/target/*.jar"
          # path: '${{ github.workspace }}/target/*.jar'

  deploy:
    runs-on: ubuntu-latest
    needs: build
    environment:
      name: 'Production'
      url: ${{ steps.deploy-to-webapp.outputs.webapp-url }}
    permissions:
      id-token: write #This is required for requesting the JWT
  
    steps:
      - name: Download artifact from build job
        uses: actions/download-artifact@v4
        with:
          name: java-app
      
      - name: Login to Azure
        uses: azure/login@v2
        with:
          client-id: ${{ secrets.AZUREAPPSERVICE_CLIENTID_34DBD3F3C3F9473A99A933043F1F525A }}
          tenant-id: ${{ secrets.AZUREAPPSERVICE_TENANTID_B0BA3F8D8C584B069529CAF8C20B1A6A }}
          subscription-id: ${{ secrets.AZUREAPPSERVICE_SUBSCRIPTIONID_01E3F990E9A349AFA1B2FF46654BE33A }}

      - name: Deploy to Azure Web App
        id: deploy-to-webapp
        uses: azure/webapps-deploy@v3
        with:
          app-name: 'workshop02'
          slot-name: 'staging'
          package: '*.jar'
```

</details>

## 3. アプリケーションの更新

<img src="../images/Exercise4/3-01.png" width="800">

```html
<!DOCTYPE html>
<html>

<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>Home -Page</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
</head>

<body>
    <div>
        <h1>Hello.</h1>
        <p>Version: 3</p>
    </div>
</body>

</html>
```


## 4. ワークフローの実行

<img src="../images/Exercise4/4-01.png" width="800">
<img src="../images/Exercise4/4-02.png" width="800">
<img src="../images/Exercise4/4-03.png" width="800">

## 5. スワップ操作

<img src="../images/Exercise4/5-01.png" width="800">
<img src="../images/Exercise4/5-02.png" width="800">
<img src="../images/Exercise4/5-03.png" width="800">
<img src="../images/Exercise4/5-04.png" width="800">

---
