## 現象

`git clone`した際、ローカルリポジトリに`.git`フォルダは作成されるがその他のファイルやフォルダが作成されない。

## エラーメッセージ

`git clone`した際のメッセージは以下。

```
$ git clone git@github.com:TAKAHIRO-24/TIL.git
Cloning into 'TIL'...
remote: Enumerating objects: 456, done.
remote: Counting objects: 100% (209/209), done.
remote: Compressing objects: 100% (143/143), done.
Reremote: Total 456 (delta 159), reused 63 (delta 63), pack-reused 247
Receiving objects: 100% (456/456), 141.34 KiB | 742.00 KiB/s, done.
Resolving deltas: 100% (206/206), done.
error: invalid path 'Git/error/fatal: refusing to merge unrelated histories.md'
fatal: unable to checkout working tree
warning: Clone succeeded, but checkout failed.
You can inspect what was checked out with 'git status'
and retry with 'git restore --source=HEAD :/'
```

以下は取り出したエラーメッセージ。

```
error: invalid path 'Git/error/fatal: refusing to merge unrelated histories.md'
fatal: unable to checkout working tree
warning: Clone succeeded, but checkout failed.
```

リポジトリ内の一つのファイルのパスが不正とのこと。  
クローンはできたが、チェックアウトができていない状況。

## 対応

エラーメッセージには以下のコマンドを実行するように記載あり。

```
You can inspect what was checked out with 'git status'
and retry with 'git restore --source=HEAD :/'
```

実行するべきこととして以下が記載されている。
- `git status`
- `git restore --source=HEAD :/`

### 1. git status

```
$ git status
On branch main
Your branch is up to date with 'origin/main'.

Changes to be committed:
  (use "git restore --staged <file>..." to unstage)
        deleted:    Database/transaction.md
        deleted:    Git/GitHub flow.md
        deleted:    Git/Pull Request.md
        deleted:    Git/README.md
        deleted:    Git/command/branch.md
        deleted:    Git/command/clean.md
        deleted:    Git/command/config.md
        deleted:    Git/command/diff.md
        deleted:    Git/command/fetch.md
        deleted:    Git/command/log.md
        deleted:    Git/command/ls.md
        deleted:    Git/command/merge.md
        deleted:    Git/command/rebase.md
        deleted:    Git/command/remove-file.md
        deleted:    Git/command/rename.md
        deleted:    Git/command/restore.md
        deleted:    Git/command/stash.md
        deleted:    Git/command/submodule.md
        deleted:    Git/command/tag.md
        deleted:    Git/command/コマンド一覧.md
        deleted:    Git/error/fatal: refusing to merge unrelated histories.md
        deleted:    Git/error/ssh接続エラー.md
        deleted:    Git/file/.gitcofig.md
        deleted:    Git/file/.gitignore.md
        deleted:    Git/file/bash.bashrc.md
        deleted:    Git/tool/Octotree.md
        deleted:    Git/tool/ZenHub.md
        deleted:    Git/tool/p4merge.md
        deleted:    Git/trackファイル.md
        deleted:    Git/開発の流れ.md
        deleted:    README.md
        deleted:    Tool/Android Studio/.ideavimrc.md
        deleted:    Tool/Visual Studio Code/keybindings.json.md
        deleted:    Tool/Visual Studio Code/settings.json.md
        deleted:    Tool/Visual Studio Code/vscode-remote-container.md
        deleted:    Tool/Visual Studio/.vsvimrc.md
        deleted:    Tool/p4merge/encording.md
        deleted:    Tool/p4merge/setup for Git.md
        deleted:    security/秘密鍵・公開鍵.md
        deleted:    shell/bash/.bash_history.md
        deleted:    shell/bash/path.md
        deleted:    shell/bash/空白の動作.md
```

リモートリポジトリから取得されるべきファイルがすべてdeletedになっており、Staging areaにStagingされていることが確認できる。  

### 2. git restore --source=HEAD :/

`git restore`は各ステージの変更を元に戻すコマンド。  
`git restore --source=HEAD`はWorking directoryをHEADの内容で上書きするコマンド。

コマンド実行後、以下のメッセージ。

```
$ git restore --source=HEAD :/
error: invalid path 'Git/error/fatal: refusing to merge unrelated histories.md'
```

やはりエラーが発生している。
再度`git status`コマンドを実行して現状を確認。

```
$ git status
On branch main
Your branch is up to date with 'origin/main'.

Changes to be committed:
  (use "git restore --staged <file>..." to unstage)
        deleted:    Database/transaction.md
        deleted:    Git/GitHub flow.md
        deleted:    Git/Pull Request.md
        deleted:    Git/README.md
        deleted:    Git/command/branch.md
        deleted:    Git/command/clean.md
        deleted:    Git/command/config.md
        deleted:    Git/command/diff.md
        deleted:    Git/command/fetch.md
        deleted:    Git/command/log.md
        deleted:    Git/command/ls.md
        deleted:    Git/command/merge.md
        deleted:    Git/command/rebase.md
        deleted:    Git/command/remove-file.md
        deleted:    Git/command/rename.md
        deleted:    Git/command/restore.md
        deleted:    Git/command/stash.md
        deleted:    Git/command/submodule.md
        deleted:    Git/command/tag.md
        deleted:    Git/command/コマンド一覧.md
        deleted:    Git/error/fatal: refusing to merge unrelated histories.md
        deleted:    Git/error/ssh接続エラー.md
        deleted:    Git/file/.gitcofig.md
        deleted:    Git/file/.gitignore.md
        deleted:    Git/file/bash.bashrc.md
        deleted:    Git/tool/Octotree.md
        deleted:    Git/tool/ZenHub.md
        deleted:    Git/tool/p4merge.md
        deleted:    Git/trackファイル.md
        deleted:    Git/開発の流れ.md
        deleted:    README.md
        deleted:    Tool/Android Studio/.ideavimrc.md
        deleted:    Tool/Visual Studio Code/keybindings.json.md
        deleted:    Tool/Visual Studio Code/settings.json.md
        deleted:    Tool/Visual Studio Code/vscode-remote-container.md
        deleted:    Tool/Visual Studio/.vsvimrc.md
        deleted:    Tool/p4merge/encording.md
        deleted:    Tool/p4merge/setup for Git.md
        deleted:    security/秘密鍵・公開鍵.md
        deleted:    shell/bash/.bash_history.md
        deleted:    shell/bash/path.md
        deleted:    shell/bash/空白の動作.md

Untracked files:
  (use "git add <file>..." to include in what will be committed)
        Database/
        Git/
        README.md
        Tool/
        security/
        shell/
```

Working directoryにGit管理されていないUntrackedファイルとしてリモートリポジトリのファイルが作成されている。
ただし、先ほどエラーになっていたファイルは作成されていない。

### 3. 予想

ファイル名が不正とのことなので、他のファイルと比較して異なる点を確認。  
このファイルだけ`:`が使用されていることがわかった。

### 4. `:`の役割

以下、[ファイル名に使わない方が良い文字](https://all.undo.jp/asr/1st/document/01_03.html)より参照。

>（Windowsでは）ドライブ文字の次に来る特殊な文字
>...
>UNIX系（Androidなどが身近な例）だと副ストリームもドライブレターもありませんので、普通にファイル名の文字として使えます。(Macではパス区切り文字がコロンであった時代があり、特殊な例外になってます)

### 5. git pull origin main
上記調査より、リモートリポジトリで当該ファイルの文字`:`を大文字`：`に変更。  
その後に再度`git clone`を実行。

```
$ git pull origin main

 rename Git/error/{fatal: refusing to merge unrelated histories.md => fatal： refusing to merge unrelated histories.md} (100%)
```

エラーなく実行が完了した。

## まとめ

今回はWindowsでファイル名に使用できない文字を使用したことでPathが不正になったことが原因。  
当該ファイルはリモートリポジトリで直接作成したため、ファイル作成時にエラーが出なかった。  
原則リモートリポジトリで直接ファイルの編集はしないほうがいい。

## 参照
- [これからは git restore を使ってみようかな](https://bufferings.hatenablog.com/entry/2020/05/01/013451)
- [ファイル名に使わない方が良い文字](https://all.undo.jp/asr/1st/document/01_03.html)