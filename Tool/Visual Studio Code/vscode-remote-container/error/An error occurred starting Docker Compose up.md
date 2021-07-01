# vscode-remote-containerでreopen remote containerした際にエラーが発生して接続不可

## 現象

![image](https://user-images.githubusercontent.com/85177462/124007537-6a26de80-da16-11eb-9310-1bd56b6f8c58.png)

reopen remote containerを実行した際に以下のエラーが発生。

![image](https://user-images.githubusercontent.com/85177462/124007599-7874fa80-da16-11eb-9a36-6b8e2ccbe2a4.png)

## 対応

以下はエラーログ。  

エラーログの保存場所は以下。
`C:\Users\user\AppData\Roaming\Code\logs\YYMMDDTHHMMSS\exthost1\ms-vscode-remote.remote-containers`

```
 => ERROR [2/6] RUN apt-get update                                        12.8s
------
 > [2/6] RUN apt-get update:
#6 2.169 Get:1 http://security.debian.org/debian-security buster/updates InRelea
se [65.4 kB]
#6 2.177 Get:2 http://deb.debian.org/debian buster InRelease [122 kB]
#6 2.258 Get:3 http://deb.debian.org/debian buster-updates InRelease [51.9 kB]
#6 3.170 Get:4 http://deb.debian.org/debian buster/main amd64 Packages [7907 kB]
#6 11.19 Reading package lists...
#6 12.65 E: Release file for http://security.debian.org/debian-security/dists/bu
ster/updates/InRelease is not valid yet (invalid for another 23h 44min 35s). Upd
ates for this repository will not be applied.
#6 12.65 E: Release file for http://deb.debian.org/debian/dists/buster-updates/I
nRelease is not valid yet (invalid for another 1d 6h 51min 34s). Updates for thi
s repository will not be applied.
------
executor failed running [/bin/sh -c apt-get update]: exit code: 100
[2021-07-01T14:12:39.275Z] ERROR: Service 'python3' failed to build : Build failed
[2021-07-01T14:12:40.129Z] Stop (20556 ms): Run: docker-compose --project-name python-docker -f c:\Users\a_my_\Documents\GitHub\Repositories\practice\python-docker\docker-compose.yml -f c:\Users\a_my_\Documents\GitHub\Repositories\practice\python-docker\.devcontainer\docker-compose.yml up -d --build
[2021-07-01T14:12:40.140Z] Command failed: docker-compose --project-name python-docker -f c:\Users\a_my_\Documents\GitHub\Repositories\practice\python-docker\docker-compose.yml -f c:\Users\a_my_\Documents\GitHub\Repositories\practice\python-docker\.devcontainer\docker-compose.yml up -d --build
[2021-07-01T14:12:40.142Z] Stop (20594 ms): Run: docker events --format {{json .}} --filter event=start
```

 `RUN apt-get update`でエラーが発生していることがわかる。

Dockerfileの記載をDockerHubの[Python公式イメージ](https://hub.docker.com/_/python)から取得。

Dockerfileを変更して実行後にエラーなく実行が完了した。