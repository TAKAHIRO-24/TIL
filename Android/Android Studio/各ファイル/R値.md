
以下から引用。
- [基礎＆応用力をしっかり育成！Androidアプリ開発の教科書 Kotlin対応 なんちゃって開発者にならないための実践ハンズオン Kindle](https://www.amazon.co.jp/dp/B07SC5WVPY/ref=dp-kindle-redirect?_encoding=UTF8&btkr=1)

>Android開発では、resフォルダ内のファイルやそのファイル中に記述された「@+id」の値などのリソースは、Kotlinクラスから利用されることが容易に想像できます。これらリソースを、Kotlinクラスから効率良く利用できるように、また、指定ミスをなくすために、Androidではそのファイルや値を識別するためのJavaのint型定数を使用することになっています。このint型定数をまとめて記述するクラスとして`Rクラス`を用意し、そこにAndroid Studioが自動追記する仕組みとなっています。これによって、アプリ内では、Rクラス中の定数(これを`R値`と呼ぶことにします)を使ってリソースをやり取りできるのです。  
この仕組みは、KotlinでのAndroid開発でも変わらず、JavaクラスのR値をKotlinコード内で利用することになります。たとえば、「`R.layout.activity_main`」という記述は、「`res/layout/activity_main.xml`」ファイルを指す定数です。  
なお、Javaでは定数は大文字で記述することになっていますが、R値に関しては、実際のフォルダ階層やファイル名などとの対応関係をはっきりさせるために、記述されたフォルダ名やファイル名をそのまま使っています。