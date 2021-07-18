# Android SDKとは

SDK(Software Development Kit)の一種。  
Androidアプリケーションを開発するのに必要なソフトウェアをパッケージ化したもの。  
Androidアプリケーションを開発するには別途、JDK(java Development Kit)等のJava開発環境が必要。

## 構成

Android Studioの`ホーム画面＞Configure＞SDK Manager＞Appearance & Behavior＞System Settings＞Android SDK`からAndroid SDKを確認することができる。

![image](https://user-images.githubusercontent.com/85177462/126054977-0aba202b-c34a-4981-9138-953822873609.png)

### SDK Platform

AndroidにはいくつかのAPIレベルがあり、それぞれに必要なSDKが異なる。  
SDK Platformの各バージョンには以下のパッケージが含まれている。

- **Android SDK Platform** : 各バージョン用にアプリをコンパイルためのパッケージ。
- **System Image** : 各バージョンをAndroid Emulator上で実行するためのパッケージ。
  - **Google APIs...System Image** : Google Play開発者サービスが利用できる。
  - **Google Play...System Image** : Google Playストアも含まれている。
- **Sources for Android** : プラットフォームのソースファイルが含まれる。

# 参照
- [SDK Platform リリースノート](https://developer.android.com/studio/releases/platforms?hl=ja)