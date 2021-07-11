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