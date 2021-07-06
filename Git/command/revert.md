# 前のコミットの状態に戻す

## Revert

```
$ git revert <commit-ID>
```

```
                       間違えたコミット
commit1 ←--- commit2 ←--- commit3
                             ↑
                            main
```

コマンド実行後、間違えたコミットを打ち消すようなrevert-commitが作成される。

```
                       間違えたコミット
commit1 ←--- commit2 ←--- commit3 ←--- revert-commit
                                             ↑
                                            main
```

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