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
