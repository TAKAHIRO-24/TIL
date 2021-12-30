# strings.xml

`app＞res＞values`内に設置し、アプリ内で表示する文字列を記載する。  
これらの表示文字列は、レイアウトXMLやソース中に記載するのではなく、原則的に`res/values`フォルダ内の`strings.xml`に記載する。  
これによって、多言語対応の際に、所定のフォルダにそれぞれの言語に対応した`strings.xml`を配置することでAndroid OSの言語設定に応じて自動的にOS側が`strings.xml`を切り替えてくれる。

以下は、`AndroidManifest.xml`ファイル。
その中の`Application＞android:label＞`には`@string/app_name`が指定されている。

![image](https://user-images.githubusercontent.com/85177462/147398687-750c7866-8224-4030-921d-cbdb5ebf2c39.png)

以下は、`strings.xml`ファイル。  
`app_name`には`はろーあんどろいど`が指定されている。  

![image](https://user-images.githubusercontent.com/85177462/147398724-e9f1c68f-fbbc-4210-b94e-c70336e79526.png)

アプリを実行すると、以下のように表示される。

![image](https://user-images.githubusercontent.com/85177462/147398740-a2354b85-d066-4495-99e1-96affcb79c25.png)

ただし、`res＞values-en＞strings.xml`ファイルを作成し、以下のように記述した場合は、OSの言語設定が英語の場合はこの`values-en＞strings.xml`ファイルが参照される。

以下フォルダ構成。

![image](https://user-images.githubusercontent.com/85177462/147398782-6b8bff15-36b9-47cd-b4be-6bddc62b4e79.png)

![image](https://user-images.githubusercontent.com/85177462/147398796-b3493a60-80d1-49ad-abfc-a5afe7b8206e.png)

`values-en＞stirngs.xml`ファイルに以下の記載をする。

![image](https://user-images.githubusercontent.com/85177462/147398804-eaf1b541-13f0-4f0b-aca4-684a58a0da71.png)

OSの言語設定を英語にした場合、以下のように表示される。

![image](https://user-images.githubusercontent.com/85177462/147398836-dddc5ccd-e593-42ad-9234-36c5fed464d2.png)

![image](https://user-images.githubusercontent.com/85177462/147398841-54b1237b-868e-4e44-be69-d792a06bc808.png)

アプリのタイトルが変更されていることが確認できる。

また、`values-en＞strings.xml`に記載がなく、`values＞strings.xml`に記載のあるものを使用している（例えば、上記の`app_neme`の記載が`values-en＞strings.xml`には存在しない）場合、OSの言語設定が英語になっていても、デフォルトで`values＞strings.xml`が読み込まれる。

`strings.xml`には以下の記法がある。

- 
```XML
<string name="...">...</string>
```
- `spnner`で使用。
```XML
<string-array name="...">
    <item>...</item>
    <item>...</item>
    <item>...</item>
</string-array>
```
