# GitでSSH接続時にエラー

## エラー内容
リモートリポジトリをSHH接続でクローンしようとした際に以下のエラーが発生。
```
$ git clone git@github.com:TAKAHIRO-24/sample-repo.git
Cloning into 'sample-repo'...
/c/Users/a_my_/.ssh/config: line 3: Bad configuration option: usekeychain
/c/Users/a_my_/.ssh/config: terminating, 1 bad configuration options
fatal: Could not read from remote repository.

Please make sure you have the correct access rights
and the repository exists.
```

## configファイル
`~/.ssh/config` に秘密鍵を記述。

### 変更前のconfigファイル
```
Host *
  AddKeysToAgent yes
  UseKeychain yes
  IdentityFile ~/.ssh/id_ed25519
```
### 変更後のconfigファイル
```
Host *
    HostName github.com
    IdentityFile ~/.ssh/id_ed25519
    User git
```

## 実行
```
$ git clone git@github.com:TAKAHIRO-24/sample-repo.git
Cloning into 'sample-repo'...
remote: Enumerating objects: 3, done.
remote: Counting objects: 100% (3/3), done.
remote: Total 3 (delta 0), reused 0 (delta 0), pack-reused 0
Receiving objects: 100% (3/3), done.
```
クローンに成功した。

# 原因
調査中...

# 参考
- gitでssh接続する際にBad configuration option: usekeychainやterminating, 1 bad configuration optionsとエラーが出たときの解決方法: [Qiita](https://qiita.com/kaino5454/items/98dcf3a996f2074e0074 "gitでssh接続する際にBad configuration option: usekeychainやterminating, 1 bad configuration optionsとエラーが出たときの解決方法")
