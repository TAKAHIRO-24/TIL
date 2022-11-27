# テーブルをexportする

export(import)の種類は以下の2つがある。
- `exp(imp)`コマンド
- `expdp(impdp)`コマンド

## expコマンド
```
# exp(imp) ユーザー名/パスワード エクスポートするモード ダンプファイル ログファイル

command> exp sample01/password tables=(sample01.sampletbl) sample.dmp log=sample.log
```

### エクスポートするモード
|モード|機能説明|パラメータ|
|:---:|:---:|:---:|
|フル|データベース全体のエクスポート|FULL=y|
|ユーザー|指定したユーザー全体のエクスポート|OWNER=(user,...)|
|テーブル|指定したテーブル全体のエクスポート|TABLES=(table,...)|
|テーブルスペース|指定したテーブルスペ全体のエクスポート|TABLESPACES=(tablespace,...)|

### ダンプファイル
ダンプファイルにファイル名を含めた出力先を指定。  
デフォルトはコマンドを実行した際のカレントディレクトリに`export.dmp`ファイルが出力される。

### ログファイル
ログファイルにファイル名を含めた出力先を指定。  
デフォルトはログファイルが出力されない。

## impコマンド
`exp`コマンドを使用してexportしたファイルをimportすることが可能。
```
command> imp sample01/password file=sample.dmp
```

## expdpコマンド
```
--管理用ユーザーでディレクトリオブジェクト作成
sql> create directory sample_dpump_dir as '\\127.0.0.1\C$\oracle\oradata';

--exportを実行するユーザーに権限付与
sql> grant read, write on directory sample_dpump_dir to sample01;

--コマンド実行
# expdp ユーザー名/パスワード エクスポートするモード ダンプファイル ログファイル
command> expdp sample01/password tables=(sample01.sampletbl) directory=sample_dpump_dir
```

### エクスポートするモード
|モード|機能説明|パラメータ|
|:---:|:---:|:---:|
|フル|データベース全体のエクスポート|FULL=y|
|スキーマ|指定したスキーマ全体のエクスポート|SCHEMAS=(schema,...)|
|テーブル|指定したテーブル全体のエクスポート|TABLES=(table,...)|
|テーブルスペース|指定したテーブルスペ全体のエクスポート|TABLESPACES=(tablespace,...)|

## impdpコマンド
`expdp`コマンドを使用してexportしたファイルをimportすることが可能。
```
command> impdp sample01/password file=\\127.0.0.1\C$\oracle\oradata\expdat.dmp
```

# 参照
- [Oracle Direct Seminar 意外と知らない!? Export/Importの基礎](https://www.oracle.com/jp/a/tech/docs/technical-resources/20100908-expimp-beginner.pdf)