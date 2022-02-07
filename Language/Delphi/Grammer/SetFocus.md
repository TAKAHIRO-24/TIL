# TControl.SetFocus

`TEdit`からカーソル移動が発生した際に値チェックを行い、不正な値が入力されていた場合は`TEdit`にカーソルを合わせる。

以下のように、単純に`TEdit.SetFocus`をしても次のコンポーネントにカーソルが移動してしまう。

```pascal
et_year.SetFocus;
```

以下のように遅延メソッドを実装する。

```pascal
uses
  System.Classes, FMX.Controls;

procedure DelayedSetFocus(control: TControl);
begin
  TThread.CreateAnonymousThread(
    procedure
    begin
      TThread.Synchronize(nil,
        procedure
        begin
          control.SetFocus;
        end
      );
    end
  ).Start;
end;
```

このメソッドにカーソル移動したいコンポーネントを渡す。

```pascal
DelayedSetFocus(et_year);
```

# 参照
- [Delphi FMX set focus to a particular control so the cursor appears](https://stackoverflow.com/questions/36713878/delphi-fmx-set-focus-to-a-particular-control-so-the-cursor-appears?rq=1)