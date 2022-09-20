
関連ファイルは以下の通り。

- tnsnames.ora
- listener.ora
- sqlnet.ora

デフォルトの配置場所は以下の通り。

`(ORACLE_HOME)\network\admin\`

配置場所を変えるには、`TNS_ADMIN`環境変数にパスを設定する。

レジストリの`HKEY_LOCAL_MACHINE\SOFTWARE\ORACLE\KEY_OraDB12Home1`に新規で`TNS_ADMIN`を作成し、設定値に新規配置場所を設定。