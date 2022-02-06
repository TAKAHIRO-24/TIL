# MessageDlg

以下のように記述した場合、`mtWarning`と`[mbYes]`が未定義の識別子となる。

```pascal
MessageDlg('西暦年を入力してください。',mtWarning, [mbYes], 0);
```

列挙型は以下のように`XXX.YYY`と記述する必要がある。

```pascal
MessageDlg('西暦年を入力してください。',TMsgDlgType.mtWarning, [TMsgDlgBtn.mbYes], 0);
```

# 参照
- [(FireMonkey)メッセージを表示するには？](https://www.petitmonte.com/bbs/answers?question_id=7648)