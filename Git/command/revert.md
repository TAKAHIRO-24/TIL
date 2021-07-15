# 前のコミットの状態に戻す

## Revert

### ローカルリポジトリでrevertする

```
$ git revert <commit-ID>
```

- 指定したコミットの一つ前に状態が戻るようにrevert commitを作成しコミットする。
- 過去のコミットやrevertの作業履歴が残るため、resetよりrevertが推奨される。
- working directoryやstaging areaに作業内容がある場合は破棄するかコミットしてからrevertする。
- GitHubでもrevert処理できる（Pull Requestでのマージをrevertする）。

```
                       間違えたコミット
commit1 ←--- commit2 ←--- commit3
                             ↑
                            main
                             ↑
                            HEAD
```
```
$ git log --oneline
b548fb2 (HEAD -> feature) update readme (mistake)
3d7e366 (origin/main, origin/HEAD, main) Initial commit
```

コマンド実行後、間違えたコミットを打ち消すようなrevert-commitが作成される。

```
$ git revert HEAD
hint: Waiting for your editor to close the file...
[feature b01e518] Revert "update readme (mistake)"
 1 file changed, 1 deletion(-)
```

```
                       間違えたコミット
commit1 ←--- commit2 ←--- commit3 ←--- revert-commit
                                             ↑
                                            main
                                             ↑
                                            HEAD
```
```
$ git log --oneline
b01e518 (HEAD -> feature) Revert "update readme (mistake)"
b548fb2 update readme (mistake)
3d7e366 (origin/main, origin/HEAD, main) Initial commit
```

### リモートリポジトリでrevertする

リモートリポジトリのfeatureブランチに`git push origin feature`し、mainブランチにマージした後に変更を取り消す場合は以下の手順で行う。

- マージが完了してcloseされたPull Requestを開く。

![image](https://user-images.githubusercontent.com/85177462/125196594-72dca780-e295-11eb-8f30-136d66676462.png)

- 右下の[Revert]ボタンを押下すると、revert用のPull Requestを作成する画面が表示されるので、内容を記載して[Create pull request]ボタンを押下。

![image](https://user-images.githubusercontent.com/85177462/125196676-afa89e80-e295-11eb-954e-b2576d1d3cce.png)

- 作成されたPull Request画面で内容に問題なければマージを行う。

![image](https://user-images.githubusercontent.com/85177462/125196730-d961c580-e295-11eb-8fed-3e367fa771fe.png)


## Reset

resetするとすでに変更をリモートリポジトリにpushしていた場合、他の開発メンバーとの変更に辻褄が合わなくなるため注意する必要がある。

```
$ git reset <option> <commit-ID>
```

- 指定したコミットにHEADが移動し、それまでのコミットは全て削除される。
- Staging areaの内容はリセットされるが、Working directoryの内容はそのまま。（オプションによって選択することができる）
- リモートリポジトリにpush済みのコミットが削除されないように注意する。
- 見られてはいけない機密情報等のコミットはresetを使用する。
- 特に理由がなければrevertを使用する。

### オプション一覧

|                   |Working directory|Staging area|
| :-------------    | :-------------: | :--------: |
|-- soft            |キープ            |キープ      |
|-- mixed(デフォルト)|キープ            |リセット    |  
|-- hard            |リセット          |リセット    |

- 「リセット」は指定したコミットと同じ状態に上書きされる。

```
                       間違えたコミット
commit1 ←--- commit2 ←--- commit3
                             ↑
                            main
```

コマンド実行後、間違えたコミットを削除する。

```

commit1 ←--- commit2
                ↑
               main
```

### 1. git reset HEAD^

変更前の状況。

|                   |Working directory|Staging area|
| :-------------    | :-------------: | :--------: |
|                   |変更６            |変更５      |

```
 main
   ↓
INITIAL ←--- 変更１ ←--- 変更２ ←--- 変更３ ←--- 変更４
                                                 ↑
                                              feature
                                                 ↑
                                                HEAD
```

現在の状況は以下の通り。

```
$ git log --oneline
496bd58 (HEAD -> feature) 4th update
cbd9f78 3rd update
d119528 2nd update
0ff0997 1st update
```

```
$ git status
On branch feature
Changes to be committed:
  (use "git restore --staged <file>..." to unstage)
        modified:   README.md
Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git restore <file>..." to discard changes in working directory)
        modified:   README.md
```

コマンド実行。

```
$ git reset HEAD^
```

以下のようになる。  
HEADが一つ前のコミットを指し、Working directoryの内容はそのままでStaging areaの内容はリポジトリで上書きされている。


|                   |Working directory|Staging area|
| :-------------    | :-------------: | :--------: |
|                   |変更６            |変更３      |

```
 main
   ↓
INITIAL ←--- 変更１ ←--- 変更２ ←--- 変更３
                                      ↑
                                    feature
                                      ↑
                                     HEAD
```

```
$ git log --oneline
cbd9f78 (HEAD -> feature) 3rd update
d119528 2nd update
0ff0997 1st update
```
```
$ git status
On branch feature
Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git restore <file>..." to discard changes in working directory)
        modified:   README.md

no changes added to commit (use "git add" and/or "git commit -a")
```

### 2. git reset --soft HEAD^

変更前の状況。

|                   |Working directory|Staging area|
| :-------------    | :-------------: | :--------: |
|                   |変更６            |変更３      |

```
 main
   ↓
INITIAL ←--- 変更１ ←--- 変更２ ←--- 変更３
                                      ↑
                                    feature
                                      ↑
                                     HEAD
```

現在の状況は以下の通り。

```
$ git log --oneline
cbd9f78 (HEAD -> feature) 3rd update
d119528 2nd update
0ff0997 1st update
```

コマンド実行。

```
$ git reset --soft HEAD^
```

以下のようになる。

|                   |Working directory|Staging area|
| :-------------    | :-------------: | :--------: |
|                   |変更６            |変更３      |

```
 main
   ↓
INITIAL ←--- 変更１ ←--- 変更２
                          ↑
                        feature
                          ↑
                         HEAD
```

最新のコミットが削除され、ひとつ前のコミットをHEADが指していることがわかる。

```
$ git log --oneline
d119528 (HEAD -> feature) 2nd update
0ff0997 1st update
```

Working directoryとStaging areaの両方に変更がある。

```
$ git status
On branch feature
Changes to be committed:
  (use "git restore --staged <file>..." to unstage)
        modified:   README.md

Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git restore <file>..." to discard changes in working directory)
        modified:   README.md
```

`git diff`でWorking directoryとStaging areaの差分を確認する。

![image](https://user-images.githubusercontent.com/85177462/125804266-fa489d8e-771d-4708-a77c-98cf34590cf4.png)

上記より、最新のコミットがStaging areaに戻っていることがわかる。  
**間違えてコミットしてしまった場合は`git reset --soft HEAD^`をすれば一つ前のコミットに戻り、Staging areaの内容もコミット前に戻る。**

### 3. git reset --hard HEAD^

現在の状況。

|                   |Working directory|Staging area|
| :-------------    | :-------------: | :--------: |
|                   |変更６            |変更３      |

```
 main
   ↓
INITIAL ←--- 変更１ ←--- 変更２
                          ↑
                        feature
                          ↑
                         HEAD
```

```
$ git log --oneline
d119528 (HEAD -> feature) 2nd update
0ff0997 1st update
```

コマンド実行。

```
$ git reset --hard HEAD^
HEAD is now at 0ff0997 1st update
```

最新のコミットが一つ前に戻ったことがわかる。

|                   |Working directory|Staging area|
| :-------------    | :-------------: | :--------: |
|                   |変更１            |変更１      |

```
 main
   ↓
INITIAL ←--- 変更１
               ↑
            feature
               ↑
              HEAD
```

```
$ git log --oneline
0ff0997 (HEAD -> feature) 1st update
```

```
$ git status
On branch feature
nothing to commit, working tree clean
```

Working directoryとStaging areaの内容が指定したコミットに上書きされたことがわかる。

## Revert・Reset・Checkout

||コミット単位|ファイル単位|
|:---------:|:---------:|:---------:|
|Revert|打ち消しコミットで状態を戻す|-|
|Reset|指定したコミットに戻して、それ以降のコミットを破棄|unstageする|
|Checkout|ブランチの切替|Working directoryの変更を破棄|