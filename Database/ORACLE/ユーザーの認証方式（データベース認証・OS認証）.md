
||認証方式|説明|
|:-:|:-:|:-|
|一般ユーザー|データベース認証|`データディクショナリ`の情報を用いてユーザー認証を行う。（CREATE USER user01 IDENTIFIED BY password01）|
|一般ユーザー|OS認証|OSユーザー名に`OS_AUTHENT_PREFIX`初期化パラメータに指定した接頭辞を付与したOS認証のOracleユーザー（CREATE USER user01 IDENTIFIED EXTERNALLY）が`データディクショナリ`にある場合にログインできる。<br>・OS_AUTHENT_PREFIX：OPS\$<br>・OSユーザー：user<br>・Oracleユーザー：OPS\$user|
|管理ユーザー|OS認証|データベースがOPENされていない状況で実行できる必要があるため、`データディクショナリ`の情報は使用しない。<br>OSユーザー名ではなく、OSのグループ名で認証を行う。|
||||