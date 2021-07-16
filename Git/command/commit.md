# コミットメッセージを変更する

##　直前のコミットメッセージの変更

```
$ git commit --amend -m "commit message"
```

## 例

以下のコミットメッセージを変更したい場合。

```
$ git log --oneline
7c27e45 (HEAD -> feature-git-bash) Create GitBash.md2
```

`$ git commit --amend -m "Create GitBash.md"`コマンドを実行。

変更を確認。

```
$ git log --oneline
5b0929d (HEAD -> feature-git-bash) Create GitBash.md
```