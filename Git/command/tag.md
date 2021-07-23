# コミットにラベル付けする

## １．lightweighted tag

### 最新のコミットにラベル付けする

```
$ git tag <tagname>
```

- 特定のコミットを特定のversionとして公開したりするのに使う。  

　以下、GitHubでリリースをタグ管理している例。[GitHub-tensorflow](https://github.com/tensorflow/tensorflow/tags)

![image](https://user-images.githubusercontent.com/85177462/123105617-e64b8000-d472-11eb-8c03-704af4c1efec.png)

![image](https://user-images.githubusercontent.com/85177462/123106062-480bea00-d473-11eb-90eb-b801832356b0.png)

- `git log`でコミット履歴を表示すると、タグ名も表示される。

```
$ git log --oneline
e3ab155 (HEAD -> main, tag: tagname) clean up
```

### タグ一覧を表示

```
$ git tag --list
```

### タグ名をリファレンスにしてコミット情報を表示

```
$ git show <tagname>
```

### タグを削除

```
$ git tag --delete <tagname>
```

### タグの編集

- 上書き

```
$ git tag -a <tagname> -f -m <new-message>
```

- 前回メッセージを編集

```
$ git tag -a <tagname> -f
```


## ２．annotated tag

タグには以下のようにリリースノートのような情報を付け加えることもできる。

![image](https://user-images.githubusercontent.com/85177462/123119686-b4d8b180-d47e-11eb-8d69-bc3ccf2ebfd6.png)

- annotated tagはtagに追加情報（アノテーション）を加えたもの。
- `git tag -a v1.0`のように、バージョンを指定する場合、アノテーションにはRelese Noteを箇条書きで書くことがある。
- デフォルトで設定しているエディタが表示されるので、そこにアノテーションを書く。
- `-m "<message>"`オプションを付けて実行すれば、エディタは開かれず直接メッセージを書いて実行することができる。

### コミットにアノテーションを付けてラベル付けする

- 最新のコミットにタグ付けされる。

```
$ git tag -a <tagname>
```

## tag同士のdiffを表示する

```
$ git diff <tagname1> <tagname2>

# ツールを使用して比較
$ git difftool <tagname1> <tagname2>
```

## 特定のコミットにラベル付けする

```
$ git tag -a <tagname> <commit-ID>
```

## リモートリポジトリにtag情報を送信する

### 指定のリモートリポジトリに送信する
```
$ git push <remote_ref> <tagname>
```
- `git pull origin main`と`git push origin main`実行後に行う。
- `git push origin main`のようにpushするだけではtag情報はpushされない。
- remote_refは通常origin。

### すべてのtag情報をpushする
```
$ git push <remote_ref> --tags
```

### 特定のtag情報をリモートリポジトリ上から削除する
```
$ git push <remote_ref> :<tagname>
```

## 特定のtagで作業する

### コードを特定のバージョンの状態にする
```
$ git checkout tag/<tagname>
```

### すべてのtag情報をローカルに取得する
```
$ git fetch --tags --all
```
- `git clone`でtagの情報も取得できるが、後から取得したい場合には上記コマンドを使用。
- もし`git checkout tag/<tagname>`でcheckoutできなければ、一度tag情報をfetchするとよい。

## オプション
- `-a`(`--annotate`) : 注釈付きタグ作成
- `-f`(`--force`) : タグ名がすでに存在していたら置き換える
- `-m`(`--message`) : タグ付け時のメッセージ

# 参照
- [Gitのタグのメッセージを上書きする](https://qiita.com/tksugimoto/items/4d0a9e1308363c7e0911)