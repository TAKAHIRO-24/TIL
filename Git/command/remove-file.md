# ファイルの削除をGit管理する
以下のコマンドを使用することでfilenameを削除し、削除作業をGitで管理することができる。

## 使用コマンド

```
$ git rm <filename>
```

- trackされないファイルは削除できない。
- Staging areaに作業内容があるファイルは削除できない。

### 注意点
UNIX標準の`rm`コマンドでファイルを削除した場合、以下のコマンドで変更をStaging areaへ反映させる必要がある。

```
# ファイルを削除
$ rm <filename>

# Staging areaへ変更を反映
$ git add -A
```

## 各ステージで削除
### 1. Working directoryでファイルを削除

Git管理されていないuntrackedファイルを削除するには`rm`コマンドで削除する必要がある。
`git rm`コマンドではuntrackedファイルを削除することはできない。

### 2. Staging areaに変更内容が`git add`されているファイルを削除

Staging areaに変更内容があるファイルは`git rm`コマンドを使用することはできない。

|Working directory        |Staging area   |Repository|
|:-----------------------:|:-------------:|:--------:|
|delete_soon.txt          |delete_soon.txt|          |

```
$ git rm delete_soon.txt
error: the following file has changes staged in the index:
    delete_soon.txt
(use --cached to keep the file, or -f to force removal)
```

`rm`コマンドを使用する必要がある。

```
$ rm delete_soon.txt
```

変更を確認する。
Working directoryのファイルが削除され、Staging areaの変更はそのまま。

```
$ git status
Changes to be committed:
  (use "git restore --staged <file>..." to unstage)
        new file:   delete_soon.txt

Changes not staged for commit:
  (use "git add/rm <file>..." to update what will be committed)
  (use "git restore <file>..." to discard changes in working directory)
        deleted:    delete_soon.txt
```

ちなみに、Working directoryのファイルを削除したが、Gitとしては削除した履歴を管理している。  
そのため、Working directoryには削除済みのラベルが張られたdelete_soon.txtがあるイメージ。

|Working directory        |Staging area   |Repository|
|:-----------------------:|:-------------:|:--------:|
|[deleted] delete_soon.txt|delete_soon.txt|          |

ここで、`git add`をすることでdelete_soon.txtを削除した変更内容をStaging areaへ反映させることができる。

```
$ git add delete_soon.txt

$ git status
On branch main
Your branch is ahead of 'origin/main' by 4 commits.
  (use "git push" to publish your local commits)

nothing to commit, working tree clean
```

|Working directory|Staging area                                |Repository|
|:---------------:|:------------------------------------------:|:--------:|
|                 |delete_soon.txt<br>[deleted] delete_soon.txt|          |

Staging areaにあった新規作成の履歴と`git add`コマンドによってStaging areaに反映された削除履歴によってStaging areaのファイル状況がなくなる。

### 3. Repositoryに変更内容が`git commit`されているファイルを削除

|Working directory|Staging area   |Repository     |
|:---------------:|:-------------:|:-------------:|
|delete_soon.txt  |delete_soon.txt|delete_soon.txt|

ファイルを削除する。

```
$ git rm delete
```

変更を確認する。

```
$ git status
Changes to be committed:
  (use "git restore --staged <file>..." to unstage)
        deleted:    delete_soon.txt
```

|Working directory        |Staging area             |Repository     |
|:-----------------------:|:-----------------------:|:-------------:|
|[deleted] delete_soon.txt|[deleted] delete_soon.txt|delete_soon.txt|

変更を`commit`する。

```
$ git commit -m "comment"

$ git status
On branch main
Your branch is ahead of 'origin/main' by 6 commits.
  (use "git push" to publish your local commits)

nothing to commit, working tree clean
```

|Working directory        |Staging area             |Repository                                  |
|:-----------------------:|:-----------------------:|:------------------------------------------:|
|[deleted] delete_soon.txt|[deleted] delete_soon.txt|delete_soon.txt<br>[deleted] delete_soon.txt|

コミットログを確認する。
削除の履歴がコミットされていることを確認。

```
$ git log
commit 59ed8b10790a251a522d37b748b448232d954b0e (HEAD -> main)
Author: TAKAHIRO-24 <minami.takahiro0526@gmail.com>
Date:   Mon Jun 7 01:15:47 2021 +0900

    delete file
```

## 削除した履歴を元に戻す

誤ってファイルを削除してしまった場合、以下の操作を行うと、削除前に戻すことができる。

```
$ git rm delete_soon.txt
```

|Working directory        |Staging area             |Repository     |
|:-----------------------:|:-----------------------:|:-------------:|
|[deleted] delete_soon.txt|[deleted] delete_soon.txt|delete_soon.txt|

変更を元に戻す。
※元に戻すコマンドは`git status`で確認することができる。

```
$ git restore --staged delete_soon.txt
```

変更を確認する。
削除履歴をunstageしたが、Working directoryの削除は反映されたままであることが確認できる。

```
$ git status
Changes not staged for commit:
  (use "git add/rm <file>..." to update what will be committed)
  (use "git restore <file>..." to discard changes in working directory)
        deleted:    delete_soon.txt
```

フォルダにもdelete_soon.txtが存在しないことを確認。

```
$ ls
namechanged2.txt  README.md
```

|Working directory        |Staging area   |Repository     |
|:-----------------------:|:-------------:|:-------------:|
|[deleted] delete_soon.txt|delete_soon.txt|delete_soon.txt|

Working directoryの削除を元に戻す。

```
$ git restore delete_soon.txt
```

変更を確認する。

```
$ git status
On branch main
Your branch is ahead of 'origin/main' by 7 commits.
  (use "git push" to publish your local commits)

nothing to commit, working tree clean
```

Working directoryにdelete_soon.txtが存在することを確認。

```
$ ls
delete_soon.txt  namechanged2.txt  README.md
```

|Working directory|Staging area   |Repository     |
|:---------------:|:-------------:|:-------------:|
|delete_soon.txt  |delete_soon.txt|delete_soon.txt|

## まとめ
- Working directory, Staging areaに変更があるファイルは`rm`コマンドで削除する。
- `commit`済みのファイルは`git rm`コマンドで削除する。
- ファイルの削除も`git restore`コマンドでもとに戻すことができる。
