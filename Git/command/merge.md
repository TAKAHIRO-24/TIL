# ブランチの統合

## リモートリポジトリで統合

リモートリポジトリでブランチの統合をする場合は、Pull Requestを出して行う。

## ローカルリポジトリで統合

### ブランチの差分を確認

ブランチを統合する前にブランチ間の差分を表示し、統合が正当か確認する。

```
$ git diff <base-branch> <compare-branch>
```

base-branchをベースに、compare-branchとの差分を表示。  
以下、mainブランチとnew-featureブランチの比較。

```
$ git diff main new-feature
diff --git a/README.md b/README.md
index 92e728b..6d0437c 100644
--- a/README.md
+++ b/README.md
@@ -1,4 +1,5 @@
 # git-practice
 このリポジトリはGit動画講座用です．

-ローカルリポジトリで変更。
\ No newline at end of file
+ローカルリポジトリで変更。
+new-featureブランチで変更。
\ No newline at end of file
```

追加された行は単純に行を追加するのみ。  
ただし、変更のあった行はDelete-Insertするので、mainブランチは`---`となっており、new-featureブランチは`+++`となっている。

### マージを実行

下記コマンドを使用。  
変更の反映先のブランチへ移動し、branch-nemeには変更元のブランチを指定。

```
$ git merge <branch-name>
```
ただし、mainブランチなどのチーム共有のブランチに統合する場合はローカルではなくリモートリポジトリで行う。  
その際はPull Requestをだしてブランチの統合を依頼する。

以下、mainブランチにnew-featureブランチをマージ。

```
$ git merge new-feature
Updating 2f21b78..8d7a284
Fast-forward
 README.md | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
```

変更があった行はDelete-Insertされている。

#### マージの種類

**1. Fast-fowart**

通常のマージ。

**2. Automatic merge**

マージ先のブランチにマージ元にはないコミットが存在する場合。  
ただし、マージ先の変更とマージ元の変更に競合がない場合は問題なくマージすることができる。

以下、mainブランチとfeatureブランチでそれぞれ変更があり、同じ個所を変更していない場合。

```
            HEAD
             ↓
            main
             ↓
commit1 ← commit2
   ↑
   ←----- commit3
             ↑
          feature
```

`git merge feature`を実行。

```
                        HEAD
                         ↓
                        main
                         ↓
commit1 ← commit2 ← merge-commit1
   ↑                     ↓
   ←----- commit3 ←-------
             ↑
          feature
```

この際、変更箇所に重複がないため、自動でマージされる。  
このことをAutomatic mergeという。

ちなみに、以下のコマンドで各ブランチのコミット履歴を一括で確認することができる。

```
$ git log --all --oneline --graph
* 1fc9194 (HEAD -> main) make new file for automatic merge
| * 8e5da5a (no-fast-forward) update readme for automatic merge
|/
* 8d7a284 update readme
* 2f21b78 (origin/main, origin/HEAD) modified .gitignore
```

mainブランチとno-fast-forwardブランチでそれぞれコミットが存在することがわかる。  
マージ後は分かれていたブランチが統合される様子がわかる。

```
$ git log --all --oneline --graph
*   a9c88c8 (HEAD -> main) Merge branch 'no-fast-forward' into main
|\
| * 8e5da5a (no-fast-forward) update readme for automatic merge
* | 1fc9194 make new file for automatic merge
|/
* 8d7a284 update readme
* 2f21b78 (origin/main, origin/HEAD) modified .gitignore
```

**3. Conflict**
マージ先のブランチにマージ元にはないコミットが存在する場合。  
また、マージ先の変更とマージ元の変更に競合があり、マージする前に競合を排除する必要がある。

以下、mainブランチとconflictブランチで同じ個所を変更している場合。

```
$ git log --all --oneline --graph
* 0030d8f (HEAD -> main) update readme on main for conflict
| * 358cf33 (conflict) update readme on conflict branch for conflict
|/
*   a9c88c8 Merge branch 'no-fast-forward' into main
```

mainブランチに移動して、`git merge conflict`を実行。
同じ個所を変更しているため、conflictが発生。

```
$ git merge conflict
Auto-merging README.md
CONFLICT (content): Merge conflict in README.md
Automatic merge failed; fix conflicts and then commit the result.
```

conflictが発生した場合、マージされたファイルは`merging area`に移動される。`(main|MERGING)`と表示。
どのファイルがconflictでマージできなかったのか確認するには`git status`コマンドを使用する。

```
$ git status
On branch main

You have unmerged paths.
  (fix conflicts and run "git commit")
  (use "git merge --abort" to abort the merge)

Unmerged paths:
  (use "git add <file>..." to mark resolution)
        both modified:   README.md

no changes added to commit (use "git add" and/or "git commit -a")
```

conflictが解消されていないファイルはUnmergedと表示される。  
解消するには、対象のファイルをエディタで開いて競合個所を編集する。  
conflict個所は以下のように表示される。

```
$ code readme.md

<<<<<<< HEAD
mainブランチで変更(コンフリクト発生)
=======
conflictブランチで変更(コンフリクト)
>>>>>>> conflict
```

main(HEAD)ブランチとconflictブランチでのそれぞれの変更を確認することができる。  
残したい変更以外を削除し、ファイルを保存する。  
その後、`git add`と`git commit`を実行する。

```
$ git log --oneline --graph
*   3645ac1 (HEAD -> main) resolve conflict
|\
| * 358cf33 (conflict) update readme on conflict branch for conflict
* | 0030d8f update readme on main for conflict
|/
*   a9c88c8 Merge branch 'no-fast-forward' into main
```

コミットの変遷は以下のようになる。


```
            HEAD
             ↓
            main
             ↓
commit1 ← commit2
   ↑
   ←----- commit3
             ↑
          feature
```

`git merge feature`を実行。
conflictが発生したため、競合個所を編集し、featureブランチの変更を残してcommitを行う。

```
                        HEAD
                         ↓
                        main
                         ↓
commit1 ← commit2 ← merge-commit1
   ↑                     ↓
   ←----- commit3 ←-------
             ↑
          feature
```

Automatic mergeと同様に、commit2とcommit3の両方の子commitが作成される。
