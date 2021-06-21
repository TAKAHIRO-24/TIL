# stashとは

Working directoryとStaging areaの作業を一時的に退避させる。  
緊急の作業をすることになった際、現在の作業をstashし、別作業に取り掛かることができる。  
他のブランチに今の作業内容をコミットしたいときにも使える。作業ブランチを間違えてしまったときは、一度stashし、ブランチを切り替えてからstashから作業内容を戻すことができる。

## stashする

```
$ git stash
```

## stashした内容を一覧表示する

```
$ git stash list
```

## stashした内容をWorking directoryに戻す。

```
$ git stash apply
```

- 作業内容がWorkig directoryに戻るがstashにも残る。
- stash前にStaging areaにあった作業内容もWorking directoryに戻る。
- Staging areaの内容をStaging areaに戻す場合には`--index`を指定する。

## 作業内容をstashから消す

```
$ git stash drop 
```
