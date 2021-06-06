# trackファイルとは
Gitがtrackしているファイル。つまり、Gitが管理しているファイル。  
新しく追加したファイルはtrackされていない。  

## track, untrackの変遷
以下は`new-file`をGitで管理されているフォルダに新規追加した場合。  
`readme.md`はGitで管理されている（コミット済み）ファイル。

|       |Working directory|Staging area|repository|
|:-----:|:---------------:|:----------:|:--------:|
|untrack|new-file         |*           |*         |
|track  |                 |            |readme.md |

\* Staging area, repositoryはGit管理されているステージなので、untrackファイルは存在しない。

Gitで管理されている`readme.md`を変更した場合、以下のようになる。

|       |Working directory |Staging area|repository|
|:-----:|:----------------:|:----------:|:--------:|
|untrack|new-file          |*           |*         |
|track  |modified-readme.md|            |          |

`new-file`と`modified-readme.md`を変更し`git add`場合、以下のようになる。

|       |Working directory|Staging area                  |repository|
|:-----:|:---------------:|:----------------------------:|:--------:|
|untrack|                 |*                             |*         |
|track  |                 |new-file<br>modified-readme.md|          |

## Gitが管理しているファイルの一覧を取得。
```
$ git ls-files
```


