# Pull Requestを出す

ローカルでmainブランチからfeatureブランチを作成し、開発を行う。  
変更内容はローカルリポジトリでmainブランチへマージするのではなく、リモートリポジトリにpushし、mainブランチへのPull Requestをだしてマージするようにする。

## Pull Requestとは

- リモートリポジトリでマージする際に作成するマージリクエストのこと。
- GitHub上のGUIで作成する。
- マージはPull Requestを出した人以外の人が行う。
- マージする前にファイルの差分を確認する。

## ローカルの作業ブランチをリモートリポジトリにPushする

作業ブランチをリモートリポジトリにPushする際には、mainブランチへPushするのではなく、ローカルでの作業ブランチと同じ名前のブランチをリモートリポジトリにも作成してそこに反映させる。

```
$ git push origin <branch-name>
```

Push後にリモートリポジトリを確認すると、ブランチが新規作成されていることが確認できる。

![push後のリモートリポジトリのブランチ](https://user-images.githubusercontent.com/85177462/121816506-06cb4b80-ccb7-11eb-814f-1e68f28479aa.png)

Pull Request画面へ移動し、New pull requestボタンを押下。

![image](https://user-images.githubusercontent.com/85177462/121817590-439a4100-ccbd-11eb-858d-e6857c08c7ed.png)

どのブランチをどのブランチへマージするのか選択し、Create pull requestを押下。

![image](https://user-images.githubusercontent.com/85177462/121817618-717f8580-ccbd-11eb-9e5b-224a2fedc7e0.png)

開発内容やその他レビュー時に必要な情報を記載し、リクエストを作成する。

![image](https://user-images.githubusercontent.com/85177462/121817721-04202480-ccbe-11eb-98d1-677dbb4329cf.png)

Pull Requestを作成すると、レビュワーなどを設定することができる。  
チーム開発をする際は必要に応じて設定すると、設定先へメールが送信される。

![image](https://user-images.githubusercontent.com/85177462/121817768-49445680-ccbe-11eb-8113-0a6a035440ce.png)

## Pull Requestをレビューする

Pull Request画面のFiles changedにて変更箇所・差分を確認する。

![image](https://user-images.githubusercontent.com/85177462/121817824-ac35ed80-ccbe-11eb-9e2e-dc2caa9a39ee.png)

変更箇所に対してコメントをする場合、変更箇所先頭にカーソルを合わせると、[+]ボタンが表示されるため、ボタンを押下。  
下段に表示されるエリアにコメントを追記することができる。

![image](https://user-images.githubusercontent.com/85177462/121817886-0cc52a80-ccbf-11eb-9251-afbd19c851bd.png)

レビューが完了したら、右上のFinish your reviewあるいはReview changesを押下。  
コメントを記載し、Submit reviewする。

![image](https://user-images.githubusercontent.com/85177462/121817999-865d1880-ccbf-11eb-99d3-9a801b6eed45.png)

## Pull Requestをマージする

レビューが完了したら、ConversationタブのMerge pull requestボタンを押下。

![image](https://user-images.githubusercontent.com/85177462/121818073-01263380-ccc0-11eb-8346-87837932b805.png)

マージコメントを記載してmainブランチへマージする。

![image](https://user-images.githubusercontent.com/85177462/121818096-18fdb780-ccc0-11eb-983e-c08750ae35d4.png)

mainブランチが更新されていることを確認する。

![image](https://user-images.githubusercontent.com/85177462/121818115-392d7680-ccc0-11eb-999b-09cc00b00cc9.png)

最後に、ローカルリポジトリのmainブランチをリモートリポジトリのmainブランチからPullして最新の情報へ更新する。

```
$ git checkout main
Switched to branch 'main'
Your branch is behind 'origin/main' by 1 commit, and can be fast-forwarded.
  (use "git pull" to update your local branch)

$ git pull origin main
remote: Enumerating objects: 1, done.
remote: Counting objects: 100% (1/1), done.
remote: Total 1 (delta 0), reused 0 (delta 0), pack-reused 0
Unpacking objects: 100% (1/1), 630 bytes | 39.00 KiB/s, done.
From github.com:TAKAHIRO-24/git-practice
 * branch            main       -> FETCH_HEAD
   bb8d72f..1b023b6  main       -> origin/main
Updating 5c6bd62..1b023b6
Fast-forward
 README.md | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
```
