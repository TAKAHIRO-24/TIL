# Windows Serviceでのデータベース起動・停止について

Windowsではサービスを起動・停止すると、データベースも自動で起動・停止される。

## Windowsサービスとの連動制御

以下のレジストリを変更することで、Windowsサービスとデータベースの起動・停止の自動連動を止めることが可能。

- `HKEY_LOCAL_MACHINE\SOFTWARE\ORACLE\KEY_OraDB12Home1\ORA_ORCL_AUTOSTART`
- `HKEY_LOCAL_MACHINE\SOFTWARE\ORACLE\KEY_OraDB12Home1\ORA_ORCL_SHUTDOWN`

![image](https://user-images.githubusercontent.com/85177462/191783829-c0559e66-a4fc-48f7-9f2e-32062f0a7c50.png)

## コマンドによるデータベース起動
1. `sqlplus / as sysdba`でログイン
2. `starup`コマンドで起動
   1. `startup nomount`で初期化パラメータファイルのみを読込み、インスタンス起動
   2. `startup mount`でデータベースファイルのうち、制御ファイルのみ読込
   3. `startup open`でデータファイル、REDOログファイル等を含めたデータベースファイル読込

## コマンドによるデータベース停止
1. `sqlplus / as sysdba`でログイン
2. `shutdown`コマンドで停止
   1. `shutdown normal`, `shutdown transactional`, `shutdown immediate`, `shutdown abort`にて停止。

# 参照
- [コマンドを使った起動・停止操作](http://uan.sakura.ne.jp/myoracle/manual_start.html)