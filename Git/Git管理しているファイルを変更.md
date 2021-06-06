# Git管理しているファイルをリネーム

## 使用コマンド
```
$ git mv <filename1> <filename2>
```

## 注意点
`mv <filename1> <filename2>`はUNIX系のOSコマンドで`<filename1>`を`<filename2>`へリネームする。  
※`<filename1>`を削除し、`<filename2>`を作成する。
このコマンドでリネームすると、Gitで変更前のファイルとは別のファイルと認識される。

### mvコマンドでリネームしてしまった場合

下記コマンドで変更前のGit管理の履歴を引き継いでStaging areaへ追加することができる。

```
$ git add -A
```

## git mvコマンドを使用した場合

ファイル名を変更する。

```
$ git mv newfile.txt namechanged.txt
```

変更を確認。

```
$ git status
Changes to be committed:
  (use "git restore --staged <file>..." to unstage)
        renamed:    newfile.txt -> namechanged.txt
```

`git add`コマンドを使用していないが、**Staging areaに変更が反映されている。**

## mvコマンドを使用した場合

ファイル名を変更する。

```
$ mv namechanged.txt namechanged2.txt
```

変更を確認。

```
$ git status
Changes not staged for commit:
  (use "git add/rm <file>..." to update what will be committed)
  (use "git restore <file>..." to discard changes in working directory)
        deleted:    namechanged.txt

Untracked files:
  (use "git add <file>..." to include in what will be committed)
        namechanged2.txt
```

`namechanged.txt`が削除され、untrackedの`namechanged2.txt`が新規作成された。

下記コマンドで新規作成したファイルをStaging areaへ変更を反映。

```
$ git add -A
```
ファイル名は不要。
ファイル名を指定しないことで、namechanged.txtの削除とnamechanged2.txtの作成を同時にStaging areaへ変更反映。
これでrenameと認識される。

Git管理が引き継がれていることを確認。

```
$ git status
Changes to be committed:
  (use "git restore --staged <file>..." to unstage)
        renamed:    namechanged.txt -> namechanged2.txt
```

## 要確認
`mv`コマンドでリネームしたファイルを`git add <filename>`コマンドでStaging areaへ変更反映してもGit管理が引き継がれている。

`mv`コマンドでリネーム。

```
$ mv namechanged.txt namechanged2.txt
```

変更を確認。
変更前ファイルが削除され、新しく新規作成された。


```
$ git status
Changes not staged for commit:
  (use "git add/rm <file>..." to update what will be committed)
  (use "git restore <file>..." to discard changes in working directory)
        deleted:    namechanged.txt

Untracked files:
  (use "git add <file>..." to include in what will be committed)
        namechanged2.txt
```

変更をStaging areaへ反映。

```
$ git add namechanged2.txt
```

変更を確認。

```
$ git status
Changes to be committed:
  (use "git restore --staged <file>..." to unstage)
        renamed:    namechanged.txt -> namechanged2.txt
```

TODO:`-A`コマンドの役割を確認する必要がある。
