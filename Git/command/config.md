# configファイル

## Gitの設定ファイル
### システム全体の設定
```
git config --global <attribute> <value>
```
※ `~/.gitconfig` に保存

### 実行したリポジトリ独自の設定 
```
git config <attribute> <value>
```
※ `.git/config` に保存

## 全体設定
リモートリポジトリにユーザーを作成した。
ローカルにもユーザーを登録し、リモートと紐づけをする。

```
# ユーザー名を登録
git config --global user.name <ユーザー名>

# メールアドレスを登録
git config --global user.email <E-mail>
```

設定した情報を確認するには以下のコマンド。
```
git config --global --list
```

## pagerを無効にする
コマンドラインで`git branch`や`git diff`実行時にpagerで表示されるのを防ぐ。
※pagerから抜けるには`Ctrl + C`。
```
$ git config --global --replace-all core.pager "less -F -X"
```

## difftool・mergetoolを設定する

### difftool
```
$ git config --global diff.tool p4merge
$ git config --global difftool.p4merge.path C:\Program Files\Perforce\p4merge.exe
$ git config --global difftool.prompt false
```

### mergetool
```
$ git config --global merge.tool p4merge
$ git config --global mergetool.p4merge.path C:\Program Files\Perforce\p4merge.exe
$ git config --global mergetool.prompt false
```

### 参考
- [Gitのdiffツールとしてp4mergeを使用する設定](https://github.com/TAKAHIRO-24/TIL/blob/main/Tool/p4merge/setup%20for%20Git.md)

## pull時にmergeではなく常にrebaseする
```
$ git config --global pull.rebase true
```

### 参考
- [pull時にmergeではなくrebaseする](https://github.com/TAKAHIRO-24/TIL/blob/main/Git/command/rebase.md)
