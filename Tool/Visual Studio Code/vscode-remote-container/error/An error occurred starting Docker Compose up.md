# vscode-remote-containerでreopen remote containerした際にエラーが発生して接続不可

## 現象

![image](https://user-images.githubusercontent.com/85177462/124007537-6a26de80-da16-11eb-9310-1bd56b6f8c58.png)

reopen remote containerを実行した際に以下のエラーが発生。

![image](https://user-images.githubusercontent.com/85177462/124007599-7874fa80-da16-11eb-9a36-6b8e2ccbe2a4.png)

以下はターミナル上のエラーログ。

```
executor failed running [/bin/sh -c apt-get update]: exit code: 100
ERROR: Service 'python3' failed to build : Build failed
[24407 ms] Command failed: docker-compose --project-name python-docker -f c:\Users\a_my_\Documents\GitHub\Repositories\practice\python-docker\docker-compose.yml -f c:\Users\a_my_\Documents\GitHub\Repositories\practice\python-docker\.devcontainer\docker-compose.yml up -d --build
```

## 対応

