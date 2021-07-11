# docker imageが削除できないとき

現在のdockerイメージ一覧。

```
$ docker images
REPOSITORY                                           TAG       IMAGE ID       CREATED        SIZE
kotlin_base                                          latest    c0fbf0b6b40a   12 hours ago   1.08GB
vsc-kotlin-3bfbcf15187ae00c0954e5e09e7775a5          latest    c0fbf0b6b40a   12 hours ago   1.08GB
vsc-python-docker-9333101a88141badbdf6449bc96001b1   latest    6723449bde51   11 days ago    892MB
```

dockerイメージを削除する際に以下のエラーが発生。

```
$ docker rmi c0fbf0b6b40a
Error response from daemon: conflict: unable to delete c0fbf0b6b40a (must be forced) - image is referenced in multiple repositories
```

複数のリポジトリから参照されているから削除できないよう。  
`-f`オプションを付けることで削除可能。

```
$ docker rmi -f c0fbf0b6b40a
Untagged: kotlin_base:latest
Untagged: vsc-kotlin-3bfbcf15187ae00c0954e5e09e7775a5:latest
Deleted: sha256:c0fbf0b6b40ab191feaaa4b176e9b8d3c0fde45377c1c73102a39c8c36163c65
```

再度イメージ一覧を表示。  
削除できていることが確認できる。

```
$ docker images
REPOSITORY                                           TAG       IMAGE ID       CREATED       SIZE
vsc-python-docker-9333101a88141badbdf6449bc96001b1   latest    6723449bde51   11 days ago   892MB
```

# 参考資料
- [Docker不要なコンテナ、イメージを大掃除！コンテナとイメージの一括削除](http://www.kaasan.info/archives/3953)