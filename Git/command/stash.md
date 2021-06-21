# stashとは

Working directoryとStaging areaの作業を一時的に退避させる。  
緊急の作業をすることになった際、現在の作業をstashし、別作業に取り掛かることができる。  
他のブランチに今の作業内容をコミットしたいときにも使える。作業ブランチを間違えてしまったときは、一度stashし、ブランチを切り替えてからstashから作業内容を戻すことができる。

## stashする

### trackedファイルをstashする

```
$ git stash
```

### untrackedファイルも含めてstashする

```
$ git stash -u
```

### .gitignoreファイルに記載のあるファイルの作業内容も含めてstashする

```
$ git stash -a
```

- `-a`はallの意味。
- `-a`を指定することで、untrackedファイルも.gitignoreファイルもすべて含めてstashすることができる。

## stashした内容を一覧表示する

```
$ git stash list
stash@{0}: WIP on main: fdf9314 fix conflict
stash@{1}: WIP on main: fdf9314 fix conflict
```

- 最後にstashに追加したものが0。

## stashした内容をWorking directoryに戻す。

```
$ git stash apply
```

- 作業内容がWorkig directoryに戻るがstashにも残る。
- stash前にStaging areaにあった作業内容もWorking directoryに戻る。
- Staging areaの内容をStaging areaに戻す場合には`--index`を指定する。

### 不可能
|Working directory|Staging area|Repository|Stash|
|:---------------:|:----------:|:--------:|:---:|
|file1            |            |          |file1|

- Working directoryにstashから戻す変更内容と競合する変更がある場合、エラーとなる。

### 可能
|Working directory|Staging area|Repository|Stash|
|:---------------:|:----------:|:--------:|:---:|
|                 |file1       |          |file1|

- 競合する内容がStaging areaにある場合はコンフリクトが起こる。  
- `git mergetool`コマンドを使用してコンフリクトを解消する。

## 作業内容をstashから消す

```
$ git stash drop 
```

## 特定のstashの内容を確認する

```
$ git stash show stash@{<i>}
```

- `git stash list`で確認できるstashのリファレンスを指定する。stash@{0}, stash{1}など。
- untrackedファイルの作業内容は表示されない。
- .gitignoreファイルに記載のあるファイルも表示されない。

## `git stash apply`と`git stash drop`を同時に行う

```
$ git stash pop
```

- stashはLIFO（Last In First Out）なので一番最後に追加したstashからpopする。

## 複数の作業内容をstashする

### stashにメッセージを添付する

stashに複数の作業内容ができる場合は、メッセージを添付しておくと後でわかりやすい。

```
$ git stash save "<message>"
```

メッセージを添付すると、`git stash list`で確認した際にメッセージが右側に付属する。

```
$ git stash list
stash@{0}: On main: 1st stash
```

### 特定のstashだけapplyする

特定のstashをWorking directoryに戻す場合は、リファレンス名を利用してstash@{0}のように指定する。

```
$ git stash apply stash@{<i>}
```

### 特定のstashだけdropする
```
$ git stash drop stash@{<i>}
```
