# 差分を確認する

## Working directoryとStaging areaの差分を確認する

|Working directory  |Staging area       |Repository|
|:-----------------:|:-----------------:|:--------:|
|modiried-readme2.md|modiried-readme1.md|readme.md |
|①                  |②                  |          |

```
# コマンドラインで確認
$ git diff

# p4mergeで確認
$ git difftool
```

- `git diff`のみ指定することでWorkig directoryとStaging areaの差分を表示する。
- `diff`の代わりに`difftool`とすると、`~/.gitconfig`に設定済みのGUIツールで表示する。

## Working directoryとRepositoryの差分を確認する

|Working directory  |Staging area       |Repository|
|:-----------------:|:-----------------:|:--------:|
|modiried-readme2.md|modiried-readme1.md|readme.md |
|①                  |                   |②         |

```
# コマンドラインで確認
$ git diff HEAD

# p4mergeで確認
$ git difftool HEAD
```

- HEADはアクティブブランチの最新のコミットを指すポインタ。
- `git diff HEAD`とすることでWorking directoryとHEADの差分を表示することができる。
- HEAD部分を特定のコミットやブランチを指定することも可能。

## Staging areaとRepositoryの差分を確認する

|Working directory  |Staging area       |Repository          |
|:-----------------:|:-----------------:|:------------------:|
|modiried-readme2.md|modiried-readme1.md|modiried-readme1.md |
|                   |①                  |②                   |

```
# コマンドラインで確認
$ git diff --staged HEAD

# p4mergeで確認
$ git difftool --staged HEAD
```

- `--staged`をつけることで、Working directoryではなくStaging areaを比較対象とする。
- 差分がない場合は何も表示されない。difftoolを指定した場合もp4mergeが開かない。

## 特定のファイルの差分を確認する

複数のファイルの差分がある場合、ファイル名を指定しないとすべての差分が連続して表示される。  
ファイル名を指定することでこれを回避することができる。

```
$ git diff -- <filename>
```

## コミット同士の差分を確認する

- ２つのコミットIDを指定する。１つ目のコミットIDがbaseとなる。
- 大抵、古いコミットを左、新しいコミットを右にする。
- 最新のコミットにはHEADを使用する。

```
$ git diff <commit-ID> <commit-ID>
```

また、コミットIDを指定しなくても、以下のようにHEADを起点にして親のコミットを指定することもできる。
- HEADの親コミットを指定する際には、`HEAD^`を指定。
- HEADの親の親コミットを指定する際には、`HEAD^`を指定。
- 親コミットが複数ある場合は、`HEAD^1`や`HEAD^2`を指定する。

```
                                       HEAD
                                        ↓
                                    main-branch
   HEAD^^          HEAD^1               ↓
  [2f3d3] ←------ [23f9v] ←------ [merge-commit]
     ↑             HEAD^2               ↓
     ------------ [1g4vd] ←--------------
                     ↑
               feature-branch
```

## ブランチ同士の差分を確認する

ブランチはコミットを指すポインタに過ぎない。基本的にはコミット同士の差分の確認の仕方と同じ。

- 左のブランチに古いもの。右のブランチに新しいものを指定。

```
$ git diff <branchname> <branchname>
```

### リモートリポジトリのmainブランチとローカルリポジトリのmainブランチの差分を確認する。

ブランチ一覧を表示。

```
$ git branch -a
* main
  remotes/origin/HEAD -> origin/main
  remotes/origin/main
```

差分を確認。

```
$ git diff origin/main main
```

`origin/main`ブランチはローカルリポジトリにあるリモートリポジトリの情報なので、差分を確認する前に、`git fetch`で最新のリモートリポジトリの状態にするといい。
