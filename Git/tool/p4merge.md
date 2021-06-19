## p4mergeとGitとの連携

下記参照。

- [Gitのdiffツールとしてp4mergeを使用する設定](https://github.com/TAKAHIRO-24/TIL/blob/main/Tool/p4merge/setup%20for%20Git.md)

## Gitでp4mergeを使用した際に発生する不要なファイル

Gitでp4mergeを使用してコンフリクトを解消した際に、`.orig`ファイルが作成される。  
不用であれば`.gitignore`ファイルに追記することでGit管理から外すことができる。

下記参照。

- [p4mergeを使用してコンフリクトに対処してマージする](https://github.com/TAKAHIRO-24/TIL/blob/main/Git/command/merge.md)
