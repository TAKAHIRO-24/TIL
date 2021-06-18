# Gitのdiffツールとしてp4mergeを使用する設定

p4mergeをGitのdiffツールとして使用する際には以下の設定を行う。  

Gitコマンドとして`difftool`コマンドを使用した際に、p4mergeが起動する設定を行う。

`git config --global`コマンドを使用してGitのconfigファイルに設定を記載する。

```
# diff用設定
$ git config --global diff.tool p4merge
$ git config --global difftool.p4merge.path C:\Program Files\Perforce\p4merge.exe

## gitでdifftoolを起動した際にプロンプトで一度表示されることを抑止
$ git config --global difftool.prompt false

# merge用設定
$ git config --global merge.tool p4merge
$ git config --global mergetool.p4merge.path C:\Program Files\Perforce\p4merge.exe
$ git config --global mergetool.prompt false
```

`~/.gitconfig`ファイルを確認する。

```
[user]
	name = TAKAHIRO-24
	email = minami.takahiro0526@gmail.com
[diff]
	tool = p4merge
[difftool "p4merge"]
	path = C:Program
[difftool]
	prompt = false
[merge]
	tool = p4merge
[mergetool "p4merge"]
	path = C:Program
[mergetool]
	prompt = false
```

設定が追加されていることが確認できる。

## 追記
上記.gitconfigファイルを確認すると、p4mergeのpathが正しく設定できていないことがわかる。  
空白が入ると正しく設定されていない。  
今回は直接`~/.gitconfig`ファイルを編集して書き換えた。

```
[user]
	name = TAKAHIRO-24
	email = minami.takahiro0526@gmail.com
[diff]
	tool = p4merge
[difftool "p4merge"]
	path = C:Program Files\Perforce\p4merge.exe
[difftool]
	prompt = false
[merge]
	tool = p4merge
[mergetool "p4merge"]
	path = C:Program Files\Perforce\p4merge.exe
[mergetool]
	prompt = false
```
