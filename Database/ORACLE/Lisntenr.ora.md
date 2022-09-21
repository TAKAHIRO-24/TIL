# Listener.ora の設定

`(ORACLE_HOME)\network\admin\listener.ora`に配置。

## 動的登録

`listener.ora`に`LISTENER`を設定する。

```
LISTENER =
  (DESCRIPTION_LIST =
    (DESCRIPTION =
      (ADDRESS_LIST =
        (ADDRESS = (PROTOCOL = TCP)(HOST = localhost)(PORT = 1521))
      )
        (ADDRESS = (PROTOCOL = IPC)(KEY = EXTPROC1521))
    )
  )
```

また、リスナー名`LISTENER`、PORT=`1521`以外を設定する場合は、初期化パラメータ`LOCAL_LISTENER`に値を設定する。

```
$ ALTER SYSTEM SET LOCAL_LISTENER = "(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=LOCALHOST)(PORT=1521)));"

$ ALTER SYSTEM REGISTER;
```

インスタンスの状態を確認。
`状態READY`となっており、動的登録されていることがわかる。

```
$ lsnrctl status

(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=localhost)(PORT=1521)))に接続中
リスナーのステータス
------------------------
別名                      LISTENER
バージョン                TNSLSNR for 64-bit Windows: Version 12.2.0.1.0 - Production
開始日                    21-9月 -2022 23:41:34
稼働時間                  0 日 0 時間 1 分 31 秒
トレース・レベル          off
セキュリティ              ON: Local OS Authentication
SNMP                      OFF
パラメータ・ファイル      C:\oracle\product\12.2.0\dbhome_1\network\admin\listener.ora
ログ・ファイル            C:\oracle\diag\tnslsnr\PC-xxxxxxxx\listener\alert\log.xml
リスニング・エンドポイントのサマリー...
  (DESCRIPTION=(ADDRESS=(PROTOCOL=tcp)(HOST=127.0.0.1)(PORT=1521)))
  (DESCRIPTION=(ADDRESS=(PROTOCOL=tcp)(HOST=127.0.0.1)(PORT=1522)))
  (DESCRIPTION=(ADDRESS=(PROTOCOL=ipc)(PIPENAME=\\.\pipe\EXTPROC1521ipc)))
  (DESCRIPTION=(ADDRESS=(PROTOCOL=tcps)(HOST=PC-xxxxxxxx)(PORT=5500))(Security=(my_wallet_directory=C:\ORACLE\admin\orcl\xdb_wallet))(Presentation=HTTP)(Session=RAW))
サービスのサマリー...
サービス"orcl"には、1件のインスタンスがあります。
  インスタンス"orcl"、状態READYには、このサービスに対する1件のハンドラがあります...
サービス"orclXDB"には、1件のインスタンスがあります。
  インスタンス"orcl"、状態READYには、このサービスに対する1件のハンドラがあります...
コマンドは正常に終了しました。
```

## 静的登録

`listener.ora`に`SID_LIST_LISTENER`を設定する。  
`SID_NAME`は必須。

```
SID_LIST_LISTENER =
  (SID_LIST = 
    (SID_DESC =
      (SID_NAME = orcl)
      (GLOBAL_DBNAME = orcl)
      (ORACLE_HOME = C:\oracle\product\12.2.0\dbhome_1)
      (ENVS = "EXTPROC_DLLS=ONLY:C:\oracle\product\12.2.0\dbhome_1\bin\oraclr12.dll")
    )
  )
```

インスタンスの状態を確認。
`状態UNKNOWN`となっており、静的登録されていることがわかる。

```
$ lsnrctl status

(ADDRESS=(PROTOCOL=tcp)(HOST=)(PORT=1521))に接続中
リスナーのステータス
------------------------
別名                      LISTENER
バージョン                TNSLSNR for 64-bit Windows: Version 12.2.0.1.0 - Production
開始日                    21-9月 -2022 23:36:36
稼働時間                  0 日 0 時間 0 分 4 秒
トレース・レベル          off
セキュリティ              ON: Local OS Authentication
SNMP                      OFF
パラメータ・ファイル      C:\oracle\product\12.2.0\dbhome_1\network\admin\listener.ora
ログ・ファイル            C:\oracle\diag\tnslsnr\PC-xxxxxxxx\listener\alert\log.xml
リスニング・エンドポイントのサマリー...
  (DESCRIPTION=(ADDRESS=(PROTOCOL=tcp)(HOST=PC-xxxxxxxx)(PORT=1521)))
サービスのサマリー...
サービス"orcl"には、1件のインスタンスがあります。
  インスタンス"orcl"、状態UNKNOWNには、このサービスに対する1件のハンドラがあります...
コマンドは正常に終了しました。
```

# 参照
- [4 クライアントからの接続設定(サーバ編)](http://www.doppo1.net/oracle/beginner/network_connect.html)
- [listener.ora（サーバー側）の定義](http://system3support.jp/pdf/oracle_knowledge/first_time/p053.pdf)