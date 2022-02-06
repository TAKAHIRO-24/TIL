# IniFileの使用方法

## 注意点

`.ini`ファイルを記録する際の`文字コード`によっては、`TIniFile.ReadString`で上手く読み込まれない。

windows標準のメモ帳で記録する際には、以下の文字コードを使用する。

- 使用可能
  - ANSI
- 使用付加
  - UTF-8
  - UTF-8(DOM付き)

# 参照
- [TIniFile および TMemIniFile の使用](https://docwiki.embarcadero.com/RADStudio/Sydney/ja/TIniFile_%E3%81%8A%E3%82%88%E3%81%B3_TMemIniFile_%E3%81%AE%E4%BD%BF%E7%94%A8)
- [Delphiでiniファイルを扱う](https://nomnel.hatenadiary.org/entry/20111128/1322475353)
- [IniFile で行こう](https://hp.vector.co.jp/authors/VA015850/delphi/tips/etc01.html)