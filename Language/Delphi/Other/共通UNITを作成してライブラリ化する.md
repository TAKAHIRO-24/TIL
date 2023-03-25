# 共通UNITを作成してライブラリ化する

## 手順
- 共通UNITを作成  
![image](https://user-images.githubusercontent.com/85177462/227727990-45d1a2be-0903-4e24-a583-0736c6e7b51d.png)

- `ツール＞オプション＞言語＞Delphi＞ライブラリ＞参照パス`に共通UNITを配置するパスを指定する。  
![image](https://user-images.githubusercontent.com/85177462/227728059-dcfb6313-d559-4255-9c2e-507ac48e5d8f.png)
![image](https://user-images.githubusercontent.com/85177462/227728115-ef12d56b-b126-46c2-aeab-6bfc3fd4b57e.png)
![image](https://user-images.githubusercontent.com/85177462/227728183-f47fbe34-c27c-4131-b317-066d60fcfc03.png)

- 共通ユニットを呼び出すには、`uses`に共通ユニットのUnit名を記載するのみ。  
![image](https://user-images.githubusercontent.com/85177462/227728277-cec0b1d6-1578-4096-bc2f-f713ccc2114f.png)


## 補足
特定のプロジェクトのみに追加したい場合は、以下に共通UNITを配置するパスを指定する。  
`プロジェクト＞オプション＞Delphiコンパイラ＞検索パス`  
![image](https://user-images.githubusercontent.com/85177462/227728356-0271a1bd-5fcf-4c79-b025-d350a2925cd0.png)


# 参照
- [コンポーネントの登録方法等 パスを通す](http://mrxray.on.coocan.jp/Delphi/CompoInstall/CompPathXE2.htm)
