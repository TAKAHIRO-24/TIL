# 既存のソースコードをgit管理する

## 手順
1. GitHubのサイトで新しいリモートリポジトリを作成する。
   `Repositories＞New`
![image](https://user-images.githubusercontent.com/85177462/230721914-849cca1c-bb08-439c-a771-64de8df65149.png)
2. 既存のソースコードを保存しているフォルダで`git init`コマンドを実行。  
   `.git`フォルダが作成される。
3. `git add .`, `git commit`を実行し、`mainブランチ`を作成する。  
   ※ここで`git add`, `git commit`する前は、一つもブランチが作成されていない。  
   　そのため、`git branch main`で作成しようとすると`fatal: Not a valid object name: 'main'.`エラーが発生する。
4. 

## エラー原因
### git branch mainコマンドでfatal: Not a valid object name: 'main'.エラーが発生する
リポジトリにコミットがまだ存在しないため。

リポジトリにコミットを追加する前にブランチを作成すると、Gitは指定されたブランチがどこを指しているのかを知ることができない。このため、このようなエラーが発生する。

まず、リポジトリにコミットを追加し、その後にブランチを作成する必要がある。