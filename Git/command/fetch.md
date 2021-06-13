# リモートリポジトリから情報を取得

## fetch

`git pull`コマンドは`git fetch`コマンドと`git merge`コマンドを合わせたもの。
リモートリポジトリに情報をローカルリポジトリのブランチにマージしたくない場合は`git fetch`コマンドを使用して、リモートリポジトリの情報を取得する。  
取得した情報は`origin main`に反映される。

```
$ git fetch <remote_ref>
```

- remote_fefはリモートリポジトリのリファレンス名。（originなど）
- remote_refを省略すると、デフォルトでoriginが指定される。
- マージはしない。
- ローカルリポジトリのremotes/remote_ref(origin)/branch-name

### originとは

ローカルリポジトリにあるリモートリポジトリのリファレンス名。
以下コマンドで確認できる。

```
$ git remote -v
origin  git@github.com:TAKAHIRO-24/git-practice.git (fetch)
origin  git@github.com:TAKAHIRO-24/git-practice.git (push)
```

originも含めてローカルリポジトリのブランチを確認するには以下のコマンドを使用。

```
$ git branch -a
* main
  remotes/origin/HEAD -> origin/main
  remotes/origin/main
```

リモートリポジトリの情報が更新された場合、`git fetch`コマンドを使用すると、ローカルリポジトリのorigin/mainに変更が反映される。  
以下、ローカルのmainブランチがorigin/mainよりコミットが１つ少ないことを表示している。

```
$ git status
On branch main
Your branch is behind 'origin/main' by 1 commit, and can be fast-forwarded.
  (use "git pull" to update your local branch)

nothing to commit, working tree clean
```

ここで、mainブランチのreadme.mdファイルの中身とorigin/mainブランチのreadme.mdファイルを確認。

- mainブランチ

```
$ cat README.md
# git-practice
このリポジトリはGit動画講座用です．

ローカルリポジトリで変更。
conflictブランチで変更(コンフリクト)
```

- origin/mainブランチ

`git checkout origin/main`コマンドでorigin/mainブランチへ移動できる。

```
$ cat readme.md
# git-practice
このリポジトリはGit動画講座用です．

ローカルリポジトリで変更。
Github上で更新
```

origin/mainブランチはリモートリポジトリの情報を保持していることが確認できる。

## pull

`git pull`コマンドは`git fetch`コマンドと`git merge`コマンドを合わせたもの。
以下、イメージ。

```
* ◆はコミットポイント

remote main               ------------◆-------------->
                                      ↓ fetch
local remotes/origin/main ------------◆-------------->
                                      ↓ merge
local  main               --------------------------->

```

```
$ git pull <remote_ref> <branch-name>
```
- **指定したリモートリポジトリのブランチを今いるブランチにマージする。**
- pushするまえにpullする。

リモートリポジトリが更新されており、その情報をpullする前にリモートリポジトリへpushしようとすると以下のエラーがでる。

```
$ git push origin main
To github.com:TAKAHIRO-24/git-practice.git
 ! [rejected]        main -> main (non-fast-forward)
error: failed to push some refs to 'github.com:TAKAHIRO-24/git-practice.git'
hint: Updates were rejected because the tip of your current branch is behind
hint: its remote counterpart. Integrate the remote changes (e.g.
hint: 'git pull ...') before pushing again.
hint: See the 'Note about fast-forwards' in 'git push --help' for details.
```

また、pullした際にリモートリポジトリの内容が更新されていて、ローカルリポジトリの変更と競合がある場合、conflictが発生し、以下のエラーが発生。

```
$ git pull origin main
remote: Enumerating objects: 5, done.
remote: Counting objects: 100% (5/5), done.
remote: Compressing objects: 100% (3/3), done.
remote: Total 3 (delta 2), reused 0 (delta 0), pack-reused 0
Unpacking objects: 100% (3/3), 688 bytes | 52.00 KiB/s, done.
From github.com:TAKAHIRO-24/git-practice
 * branch            main       -> FETCH_HEAD
   5c6bd62..bb8d72f  main       -> origin/main
Auto-merging README.md
CONFLICT (content): Merge conflict in README.md
Automatic merge failed; fix conflicts and then commit the result.
```

`CONFLICT (content): Merge conflict in README.md`でREADME.mdファイルでコンフリクトが発生している。  
これを解消するために、README.mdファイルをエディタで開いて編集する。  
