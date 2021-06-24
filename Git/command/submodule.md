# submoduleとは

一つのリポジトリ内にほかのリポジトリを内包させること。  
プロジェクトの一部として別のプロジェクトを使用する際に利用する。  
例）third partyのライブラリや共通ユニット、DockerやCICD関連のスクリプト等をbaseプロジェクトのように使うこともある。
```
                    [main-project]
                          |
         -------------------------------------
         |                |                  |
  [sub-project1]    [sub-project2]     [sub-project3]   
```

## プロジェクトにsubmoduleを追加する

```
$ git submodule add <submodule_url>
```

## .gitsubmodulesファイルとは

submoduleの定義が記述されたファイル。

```
[submodule "sub-project"]
        path = sub-project
        url = git@github.com:TAKAHIRO-24/sub-project.git
```

`git submodule add <submodule_url>`でsubmoduleをリポジトリに追加した場合、リモートリポジトリにpushすると、以下のようになる。

![image](https://user-images.githubusercontent.com/85177462/123281872-fd5aa280-d544-11eb-9b39-2e3397292633.png)

このsubmoduleは[@...]に表示されているコミットIDに紐づいている。  
そのため、sub-projectでコミットが更新されたとしても、submoduleでは以前のコミットを参照し続けることになる。  

以下のリンクを踏むと、sub-projectの当該コミットのGitHubページを表示することができる。

![image](https://user-images.githubusercontent.com/85177462/123282417-735f0980-d545-11eb-905d-1966c251ebc9.png)


## submoduleを含むプロジェクトをクローンする

submoduleをすでに含んでいるプロジェクトを`git clone <remote_ref>`しても、submoduleはクローンされない。  
正確には、submoduleフォルダは作成されるが、その中身がクローンされない。  
そのため、**submoduleフォルダ内で**以下のコマンドを実行する必要がある。

### submoduleを初期化する

```
$ git submodule init
```

### submoduleを更新する

```
$ git submodule update
```

### クローン時にsubmoduleを初期化＆クローンする

以下のコマンドで、クローン時に` git submodule init`と`git submodule update`を実行する。

```
$ git clone --recurse-submodules <remote_ref>
```

- クローンする段階でsubmoduleを含んだプロジェクトであることがわかる場合はこちらのコマンドを使用。
- リポジトリのREADMEに手順として書いておくと親切。
- `git submodule add`コマンドではsubmodule_urlを指定したが、今回はクローン元のリファレンス名を指定する。

## submoduleが更新された場合

親プロジェクトのsubmoduleディレクトリは常に最新のコミットを指すわけではない。  

```
main-project/
     sub-project/
          ↓  特定コミットへのポインタ
      [commit1] ←------ [commit2]
                            ↑
                  sub-project main-branch
```

そのため、main-project内のsubmodule（sub-project）を最新のコミットにしたい場合は、**submoduleフォルダ内で`git pull`を実行**する必要がある。  
これによってポインタが更新される。

```
                  main-project/
                       sub-project/
                            ↓
      [commit1] ←------ [commit2]
                            ↑
                  sub-project main-branch
```

ただし、すべてのsubmoduleフォルダ内に移動して`git pull`するのは面倒なので、以下のコマンドを使用すると一括で更新ができる。  
下記コマンドは、**main-projectフォルダで実行**する。

```
$ git submodule foreach '<command>'
```

例えば、`git submodule foreach 'git pull origin main'`とすると、各submoduleで`git pull origin main`が実行される。


