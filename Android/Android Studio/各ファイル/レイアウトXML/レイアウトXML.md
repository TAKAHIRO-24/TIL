# レイアウトXML

`res＞layout＞activity_main.xml`等のレイアウトXMLファイルは以下のようになっている。

![image](https://user-images.githubusercontent.com/85177462/147402715-5663b3fc-2a20-4a08-aeba-9087c48cd150.png)

レイアウトXMLのルート要素には`xmlns`の指定がついている。

## `xmlns`とは

このURLは検索しても`DTD`を取得することはできない。  
※`DTD`とは、`Document Type Definition`の略で、XMLファイルの定義を記述するスキーマ言語。各要素の意味を記述する。

![image](https://user-images.githubusercontent.com/85177462/147402780-702261fd-0c44-49e3-aa41-0fa0402ad3ff.png)

XMLは要素名や属性名に対し、`名前空間（namespace）`を付けることができる。  
名前空間は`URI（Uniform Resource Identifier）`で指定する。

名前空間となる文字列を属性等の前に毎回つけると読みにくくなるため、XMLでは`接頭辞（prefix）`を使用する。

下記の例でいえば、`xmlns:android="http://schemas.android.com/apk/res/android"`はURLではなくURIであり、接頭辞`android`は`http://schemas.android.com/apk/res/android`を表している。

![image](https://user-images.githubusercontent.com/85177462/147402715-5663b3fc-2a20-4a08-aeba-9087c48cd150.png)

そのため、以下のように変更しても問題ない。

![image](https://user-images.githubusercontent.com/85177462/147403441-138813c6-867a-4515-b7f9-20274a4b0987.png)

# 参照
- [#32 AndroidのXMLのxmlnsとは？](https://blog.mokelab.com/32/xmlns.html)