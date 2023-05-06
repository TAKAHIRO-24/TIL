# ファイル構成について
|ファイル名|詳細|
|:-------:|:-------:|
|manifest.json|設定ファイル。各ファイルの役割を記載。|
|content_script.js|開いているwebページに対するjsを記載。|
|background.js|content_script.jsで取得した値をpopup系のファイルに受け渡す処理を記載。|
|popup.html/js|拡張機能のポップアップ周りについて記載。|

# 参照
- [【google拡張機能】拡張機能を作る時の値の受け渡しについて](https://twotone.me/web/4865/)