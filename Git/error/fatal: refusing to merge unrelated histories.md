# fatal: refusing to merge unrelated histories

## 経緯
- ローカルフォルダで`git init`コマンドを実行した。
- 当該ローカルリポジトリに対応するリモートリポジトリをGitHubで作成した。
- ローカルの変更をリモートリポジトリへ反映させようとしたらエラーが発生した。

## 現象
`git remote add origin <remote_ref>`でリモートリポジトリのリファレンス名を登録した後、`git push origin main`を実行したところ、以下のエラーが発生。

```
$ git push origin main
To github.com:TAKAHIRO-24/Python-docker.git
 ! [rejected]        main -> main (non-fast-forward)
error: failed to push some refs to 'github.com:TAKAHIRO-24/Python-docker.git'
hint: Updates were rejected because the tip of your current branch is behind
hint: its remote counterpart. Integrate the remote changes (e.g.
hint: 'git pull ...') before pushing again.
hint: See the 'Note about fast-forwards' in 'git push --help' for details.
```

## 対応

`git pull origin main`を実行し、リモートリポジトリの変更内容をローカルリポジトリに反映させたが、以下のエラーが発生。

```
$ git pull origin main
From github.com:TAKAHIRO-24/Python-docker
 * branch            main       -> FETCH_HEAD
fatal: refusing to merge unrelated histories
```

## 解決策

以下の記事が参考になる。

[[Git] fatal: refusing to merge unrelated historiesを解決する話](https://qiita.com/mei28/items/85bc881ac1f26332ac15)

現在のローカルリポジトリとリモートリポジトリは同じブランチから分岐してできているわけではないため、マージに失敗している。
以下のコマンドを使用することで回避することができる。

```
$ git merge --allow-unrelated-histories origin/main
```
