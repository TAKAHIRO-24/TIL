# MergeとRebase

Rebaseとはマージコミットを作らずにマージする方法。

```
$ git rebase main
Successfully rebased and updated refs/heads/rebase-practice.
```

## Automatic merge or Conflict

mainブランチにfeatureブランチをマージした場合、２つのコミットを親としたマージコミットが作成される。

```
                   HEAD
                     ↓
                main-branch
                     ↓
  [2f3d3] ←------ [23f9v] 
     ↑                    
     ------------ [1g4vd] 
                     ↑
               feature-branch
```

`git merge feature`実行後。

```
                                       HEAD
                                        ↓
                                   main-branch
                                        ↓
  [2f3d3] ←------ [23f9v] ←------ [merge-commit]
     ↑                                  ↓
     ------------ [1g4vd] ←--------------
                     ↑
               feature-branch
```

## Rebase

`git merge`ではなく`git rebase`を使用した場合、親コミットは１つとなる。  
mainブランチにfeatureブランチを統合する場合、mainブランチのコミットは削除され、featureブランチのコミットを親とする新たなコミットが作成される。  
mainブランチとfeatureブランチのコミットにコンフリクトが生じる場合は、それを解消しなければならないことは`git merge`と同様。  

```
                   HEAD
                     ↓
                main-branch
                     ↓
  [2f3d3] ←------ [23f9v] 
     ↑                    
     ------------ [1g4vd] 
                     ↑
               feature-branch
```

`git rebase feature`実行後。

```
                                       HEAD
                                        ↓
                                   main-branch
                  deleted               ↓
  [2f3d3]         [23f9v]            [12g8d]
     ↑                                  ↓
     ------------ [1g4vd] ←--------------
                     ↑
               feature-branch
```

### Rebaseの運用

- ローカルの作業環境でのみ行う。
- featureブランチにmainブランチをrebaseする。※ここでrebaseする前にmergeするとマージコミットが作成される。
- featureブランチをmainブランチにmergeする。

### Rebaseのメリット

- 不要なマージコミットを作成しない。
- コミット履歴がきれいになる。
- 将来mainブランチにマージするブランチを適宜rebaseしておくと、後々マージしやすくなる。

### Rebaseの際の注意点

- 既存のコミットを削除し、新たなコミットを作成する。
- **一度push済みのコミットをrebaseしない。**  
  ※リモートリポジトリにpush済みで、他の人がそのコミット履歴を前提として開発を進めていた場合、他の人のコミット履歴と自分のローカルリポジトリのコミット履歴が異なることになる。
- rebaseをするのは基本的には自分のローカルの作業にのみ行う。

## Rebase時のコンフリクト

```
                   HEAD
                     ↓
                main-branch
                     ↓
  [2f3d3] ←------ [23f9v] 
     ↑                    
     ------------ [1g4vd] 
                     ↑
               feature-branch
```

`git rebase main`を実行した際、コンフリクトが発生した場合は`git mergetool`を実行してコンフリクトを解消する。  
その後、`git rebase --continue`コマンドを実行すると、rebaseを再開することができる。

```
$ git rebase main
```

コンフリクト発生。

```
$ git mergetool
```

![image](https://user-images.githubusercontent.com/85177462/122648217-1f2de100-d163-11eb-9635-cdc9774be772.png)

コンフリクト解消。  
現在rebaseが中断しているため、再開するために以下のコマンドを実行。  

```
$ git rebase --continue
```

```
                  main-branch
                      ↓
  [2f3d3] ←------- [23f9v] 
                      ↑
                      ------------- [12g8d]
                                       ↑
                                 feature-branch
                                       ↑
                                     HEAD
```

featureブランチのコミットが削除され、mainブランチのコミットを親とした新たなコミットが作成される。  
ただし、変更内容はmainブランチもfeatureブランチも引き継いでいる。

mainブランチに移動し、featureブランチをマージする。

```
$ git checkout main
$ git merge feature
```

mainブランチもfeatureブランチも最新のコミットを指していることを確認できる。

```
                                     HEAD
                                       ↓
                                  main-branch
                                       ↓
  [2f3d3] ←------- [23f9v] ←------- [12g8d]
                                       ↑
                                 feature-branch
```

## pull時にmergeではなくrebaseする

- pull = fetch + mergeであるが、mergeをすると不要なマージコミットが作成されてしまう。
- pull時にマージコミットを作成したくない場合は`--rebase`オプションを付けてmerge代わりにrebaseする。
- ローカルに新しいコミットがない場合はmergeでもFast forward mergeされマージコミットは残らない。

```
$ git pull --rebase <remote_ref> <branch-name>
```

![image](https://user-images.githubusercontent.com/85177462/122658593-10b6e800-d1aa-11eb-8b84-5353f92fdbd2.png)

`git pull --rebase origin main`実行後。

![image](https://user-images.githubusercontent.com/85177462/122658625-7efbaa80-d1aa-11eb-9538-ef0f665cea18.png)

最新のコミットがマージコミットではなく別の新しいコミットに置き換わり、origin/mainのコミットが間に挿入されていることがわかる。

### 常にpull時はrebaseする設定

チーム開発の現場でpull時は必ずmergeではなくrebaseするように決まっている場合もある。その際は以下の設定を`~/.gitconfig`にしておくと便利。

```
$ git config --global pull.rebase true
```


