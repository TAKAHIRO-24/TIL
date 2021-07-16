# リモートリポジトリを登録する

## 現在の登録を確認

```
$ git remote -v
origin  git@github.com:TAKAHIRO-24/TIL.git (fetch)
origin  git@github.com:TAKAHIRO-24/TIL.git (push)
```

## リモートリポジトリを登録

```
$ git remote add origin git@github.com:TAKAHIRO-24/water_cost_calculation.git
error: remote origin already exists.
```

すでにリモートリポジトリを`origin`で登録しているため、エラーが発生。  
一度リモートリポジトリを削除する。

## 登録しているリモートリポジトリを削除

```
$ git remote rm origin
```

登録されているリモートリポジトリが削除されていることを確認。

```
$ git remote -v
```

## 再度リモートリポジトリを登録

```
$ git remote add origin git@github.com:TAKAHIRO-24/water_cost_calculation.git
```

登録されていることを確認。

```
$ git remote -v
origin  git@github.com:TAKAHIRO-24/water_cost_calculation.git (fetch)
origin  git@github.com:TAKAHIRO-24/water_cost_calculation.git (push)
```