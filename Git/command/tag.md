# コミットにラベル付けする

## 最新のコミットにラベル付けする

```
$ git tag <tagname>
```

- 特定のコミットを特定のversionとして公開したりするのに使う。  

　以下、GitHubでリリースをタグ管理している例。[GitHub-tensorflow](https://github.com/tensorflow/tensorflow/tags)

![image](https://user-images.githubusercontent.com/85177462/123105617-e64b8000-d472-11eb-8c03-704af4c1efec.png)

![image](https://user-images.githubusercontent.com/85177462/123106062-480bea00-d473-11eb-90eb-b801832356b0.png)

- `git log`でコミット履歴を表示すると、タグ名も表示される。

## タグ一覧を表示

```
$ git tag --list
```

## タグを削除

```
$ git tag --delete <tagname>
```
