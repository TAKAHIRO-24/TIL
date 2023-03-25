# DLLを作成する

## 手順
- `ファイル＞新規作成＞その他＞Delphiプロジェクト＞Windows＞ダイナミックリンク　ライブラリ`を選択  
![image](https://user-images.githubusercontent.com/85177462/227728602-2a1ad5ed-542b-44e4-90ad-60dcf94e5435.png)
![image](https://user-images.githubusercontent.com/85177462/227728643-8f5aa75e-22c7-4614-a978-9df6575f793e.png)

- 外部から参照可能な関数を`exports`に記載し、処理を記載する。
![image](https://user-images.githubusercontent.com/85177462/227728718-8ab7dd15-d7a5-4660-acfe-62d93b5de60d.png)
![image](https://user-images.githubusercontent.com/85177462/227728789-ecbc36b5-4a78-4f9d-a5e9-ddaba0e227df.png)

- コンパイルすると`.dll`ファイルが作成される。
  
# 参照
- (DLLの作り方)[http://oto.chu.jp/a.oto.chu.jp/kujira/text/delphi/dll.htm]