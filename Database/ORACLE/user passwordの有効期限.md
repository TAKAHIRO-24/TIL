# パスワード有効期限
- [[ORAエラー] ORA-28002:パスワードは、x日以内に期限切れになります。](https://oracle.programmer-reference.com/ora-28002/)

ログイン時に以下のメッセージが出てきた。

![image](https://user-images.githubusercontent.com/85177462/236668083-ae6461ea-b502-418a-ad4d-741fcd4008c3.png)

デフォルトではパスワードの有効期限が180日となっており、期限に近づくと警告が発生する。

有効期限は以下のSQLで確認可能。  
`EXPIRY_DATE`が有効期限。
```sql
select USERNAME,ACCOUNT_STATUS,CREATED,PROFILE,EXPIRY_DATE,LOCK_DATE
 from dba_users where USERNAME ='username';
```
![image](https://user-images.githubusercontent.com/85177462/236668392-c7ba34c4-7faa-47a1-ba1e-ce27f2d40f4a.png)

期限が過ぎているユーザーに期限超過後に初めて接続した場合、`7日いないに期限切れになる`旨のメッセージがでてきて、`DBA_USERS.EXPIRY_DATE`に接続日時の7日後が設定される。

[例]上記の`SAMPLE03`に接続した場合

![image](https://user-images.githubusercontent.com/85177462/236668570-22572c56-5f5e-405a-b5a2-422a15dae22f.png)

![image](https://user-images.githubusercontent.com/85177462/236668602-ce833b0f-b2b2-4a5c-8075-10865e9623f5.png)

`DBA_USERS.EXPIRY_DATE`が更新されていることがわかる。

## 対処方法１　パスワードを変更する
## 対処方法２　パスワードの有効期限を無制限にする
プロファイルの設定を変更し、パスワードの有効期限を変更する必要がある。  

```sql
ALTER PROFILE <PROFILENAME> LIMIT PASSWORD_LIFE_TIME UNLIMITED;
```
プロファイル変更後は各ユーザーのパスワードの再設定が必要。
```sql
ALTER USER <USERNAME> IDENTIFIED BY <PASSWORD>;
```

ただし同じプロファイルを使用しているユーザーは全て変更されてしまうため注意が必要。  
※上記５つのユーザーは全て`DEFAULT`プロファイルを使用している。
特定のユーザーのみ有効期限を無制限にする場合は新たにプロファイルを作成する必要がある。
- [ORA-28002: パスワードは、XX日以内に期限切れになります。](https://oha-yo.com/oracle/ora-28002/)

```sql
--プロファイル作成
CREATE PROFILE SAMPLE_PROFILE LIMIT PASSWORD_LIFE_TIME UNLIMITED;

--プロファイルの割り当て
ALTER USER SAMPLE01 PROFILE SAMPLE_PROFILE;
```

# 参照
- [[ORAエラー] ORA-28002:パスワードは、x日以内に期限切れになります。](https://oracle.programmer-reference.com/ora-28002/)
- [ORA-28002: パスワードは、XX日以内に期限切れになります。](https://oha-yo.com/oracle/ora-28002/)