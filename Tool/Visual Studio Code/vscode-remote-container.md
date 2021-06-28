# Visual Studio CodeでDockerを使用したPython実行環境を構築する

## インストール済み
- Visual Studio Code
- Docker Desktop for Windows

## 前準備
以下の拡張機能をインストール。
- Remote Development
    - Remote - WSL
    - Remote - Containers
    - Remote - SSH
    - Remote - SSH: Editing Configuration Files
- Python

## Dockerイメージ手順

### １．Dockerfile作成

作成したDockerfileを元にコンテナを作成してくれる。  
以下はPython3の実行環境のDockerfile。

```Dockerfile
FROM python:3
USER root

RUN apt-get update
RUN apt-get -y install locales && \
    localedef -f UTF-8 -i ja_JP ja_JP.UTF-8
ENV LANG ja_JP.UTF-8
ENV LANGUAGE ja_JP:ja
ENV LC_ALL ja_JP.UTF-8
ENV TZ JST-9
ENV TERM xterm

RUN apt-get install -y vim less
RUN pip install --upgrade pip
RUN pip install --upgrade setuptools
```

### ２．docker-compose.yml作成

```docker-compose.yml
version: '3'
services:
  python3:
    restart: always
    build: .
    container_name: 'python3'
    working_dir: '/root/'
    tty: true
    volumes:
      - ./opt:/root/opt
```

### ３．vscode remote container起動

エディタ左下の緑アイコンを押下。

![image](https://user-images.githubusercontent.com/85177462/123675312-86dbde80-d87d-11eb-8f16-198d892c37cd.png)

[Add Development Container Configuration Files...]を押下。

![image](https://user-images.githubusercontent.com/85177462/123675441-ad017e80-d87d-11eb-83c5-98bfcc49a64d.png)

- Dockerfileからコンテナを作成する場合

[From 'Dockerfile']を押下。

- docker-compose.ymlからコンテナを作成する場合

[From 'docker-compose.yml']を押下。

![image](https://user-images.githubusercontent.com/85177462/123675724-0669ad80-d87e-11eb-94bf-41bc0c3fb970.png)

`.devcontainer`フォルダとその配下に`devcontainer.json`ファイルが作成される。  
`docker-compose.yml`からコンテナを作成した場合は`docker-compose.yml`ファイルも作成される。

![image](https://user-images.githubusercontent.com/85177462/123678120-e091d800-d880-11eb-91f2-b04043345411.png)

`.devcontainer`フォルダ内のファイルに設定を記載する。  

今回はPythonをデバッグするために、以下の拡張機能をコンテナに追加する。
- ms-python.python

各種設定項目は以下を参照。  

参考資料：[devcontainer.json reference](https://code.visualstudio.com/docs/remote/devcontainerjson-reference)

## Dockerコンテナ立ち上げ手順

一度Dockerイメージを作成したら、次回以降はコンテナの立ち上げを行うのみでよい。

エディタ左下の緑アイコンを押下。

![image](https://user-images.githubusercontent.com/85177462/123675312-86dbde80-d87d-11eb-8f16-198d892c37cd.png)

[Reopen in Container]を押下。

![image](https://user-images.githubusercontent.com/85177462/123677087-a96ef700-d87f-11eb-80b5-6555913231e7.png)

コンテナと接続を開始する。  
エディタ左下が[Dev Container:コンテナ名]になっていれば接続完了。

![image](https://user-images.githubusercontent.com/85177462/123677404-0bc7f780-d880-11eb-8f0f-2934e637213a.png)

## Pythonファイルをデバッグする

コンテナイメージの作成時に`.devcontainer/devcontainer.json`ファイルにPython拡張機能を追加していないとコンテナ内で拡張機能を使用できない。  
追加していない場合、以下のようなメッセージがでる。

![image](https://user-images.githubusercontent.com/85177462/123678516-58600280-d881-11eb-8374-23eeea1a1a73.png)

追加する場合は、[Dev Container: コンテナ名 @ desktop-linuxにインストールする]を押下。  
ただし、ここでインストールした場合、次回コンテナを再作成した場合には再度同様の手順でインストールする必要があるため、`.devcontainer/devcontainer.json`ファイルに記載するとよい。

python拡張機能をインストールすると、[F9]でブレイクポイントを設定することができる。

![image](https://user-images.githubusercontent.com/85177462/123679125-1e433080-d882-11eb-81b7-5c15fa25f3b4.png)

[F5]＞[Python File]押下でデバッグ実行。

![image](https://user-images.githubusercontent.com/85177462/123679204-33b85a80-d882-11eb-8ad6-4b87c4fe15a2.png)

ブレイクポイントで処理が止まったことを確認できる。

![image](https://user-images.githubusercontent.com/85177462/123679349-5d718180-d882-11eb-922b-3ddc0362db63.png)

## 参考資料
- [【2020年1月】令和だし本格的にVSCodeのRemote Containerで、爆速の"開発コンテナ"始めよう](https://qiita.com/koinori/items/084a0770c1f9e72e0c14)
- [【VScodeマン】ローカル環境汚さずに、簡単に自己学習環境用意したい！！(remote-container)](https://qiita.com/KiNShiR/items/1fa7b24f758b207997a6)
- [dockerで簡易にpython3の環境を作ってみる](https://qiita.com/reflet/items/4b3f91661a54ec70a7dc9)
- [VSCode Remote Containerが良い](https://qiita.com/d0ne1s/items/d2649801c6f804019db7)
- [devcontainer.json reference](https://code.visualstudio.com/docs/remote/devcontainerjson-reference)
