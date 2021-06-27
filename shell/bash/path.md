# pathの指定

windows（dos）の場合、pathの区切り文字に`\`を使用する。  
これをプログラムやbash等で使用するとうまく認識されないので以下のように記述する。

```
$ C:Program Files\\Perforce\\p4merge.exe
```

`\`を２つ続けて記述しないとエスケープシーケンスとして認識されてしまう。  
