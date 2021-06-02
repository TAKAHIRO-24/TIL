# GitでSSH接続時にエラー

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

# configファイル
`~/.ssh/config` に秘密鍵を記述。

## 変更前のconfigファイル
```
Host *
  AddKeysToAgent yes
  UseKeychain yes
  IdentityFile ~/.ssh/id_ed25519
```
## 変更後のconfigファイル
```
Host *
    HostName github.com
    IdentityFile ~/.ssh/id_ed25519
    User git
```

# 原因
調査中...
