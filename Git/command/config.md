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
