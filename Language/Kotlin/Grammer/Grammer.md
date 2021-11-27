# コメントアウト

Kotlinでは以下の２通りのコメントアウト方法がある。

- 一行コメントアウト

`//`以降の一行をコメントアウトできる。

```kotlin
//var name: String = "JetBrains"
var name: String //= "Brains"
```

- 一括コメントアウト

`/**/`で囲われた個所のみをコメントアウトできる。

```Kotlin
/*
var name: String = "Jet"
var name: String = "Brains"
*/
var name: String = "JetBrains"
```
 

# 変数

変数の宣言には`var`と`val`を使用する。
基本的な宣言方法は以下の通り。

```Kotlin
var name: String = "Jet"
val name: String = "Brains"
```

使い分けは以下の通り。

- var : 再代入可能。
- val : 1度だけ代入可能。

## 推論型変数

Kotlinでは原則的に宣言時に初期化が必要だが、`var`の前に`lateinit`を記述することで宣言のみを行うことができる。
また、変数の宣言のみを行う場合、型を明示的に示す必要がある。

```Kotlin
//宣言のみ
lateinit var name: string

//初期化
name = "JetBrains"
```

宣言と同時に代入を行う場合、代入した値のデータ型として型推論される。

```Kotlin
//String型と推論
var name = "JetBrains"

//Int型と推論
var founded = 2000
```

## オプショナル（Null-Safety）

宣言する変数に`Null`の代入可否を設定する必要がある。

```kotlin
//Null可
var name: String = "JetBrains"
name = null  //コンパイルエラー

//Null不可
var name: String? = "JetBrains"
name = null  //OK
```

オプショナルを設定することで実行時エラー（NullPointerException）をコンパイル時に防ぐことができる。  

また、Null許容型の変数のNullチェックは`let`関数を使用することで実現できる。  
`let`によるNullチェックに関しては<a href="#scope">スコープ関数</a>にて詳細を記載。


## 定数

定数を宣言するには`val`の前に`const`を記述する。

```Kotlin
const val name: String = "JetBrains"
```

`const`を付けた場合は、Javaからの呼び出し方が異なる。

- `const`を付ない場合
  - getterメソッドを使用する。
  - (例) example.getName()

- `const`を付けた場合
  - getterメソッドを使用せずに直接呼び出す。
  - (例) example.name


# 型

## 型の一覧
Kotlinにはプリミティブ型は存在せず、全てがオブジェクト。  
Kotlinの基本的な型は以下の通り。

|分類|型|詳細|
|:-:|:-:|:-:|
|数値型|Byte|8bit整数|
||Short|16bit整数|
||Int|32bit整数|
||Long|64bit整数|
||Float|32bit浮動小数点数|
||Double|64bit浮動小数点数|
|文字|Char||
|文字列|String||
|論理型|Boolean|True, False|
|列挙型||`enum class`で定義|
|特殊型|Any|JavaのObject。全てのスーパークラス。Null許容型のスーパークラスは`Any?`|
||Unit|Javaの`void`に相当。意味を持たない値を表現。`Any`は`Unit`のスーパークラス。|
||Nothing|インスタンスが存在しないことを表す。ある関数が`Nothing`を返すと定義された場合、その関数から`return`することはないことを示す。`Nothing`は全てのクラスのサブクラス。|
||プラットフォーム型|Javaで定義された型で`@NonNull`や`@Nullable`といったアノテートがされていないもの。|

## 型のチェック
`is`演算子を用いて型のチェックをすることができる。  
`is`演算子でチェックされた変数は、自動的に判定された型にキャストされる（スマートキャスト）。

```kotlin
val name: String = "JetBrains"
val obj: Any = name

//is演算子で型をチェック
if (obj is String) {
    //objは自動的にString型にキャストされる
    println(obj.length)
} else {
    println("obj is not String")
}

//否定も可能
// obj !is Stringでも可
if !(obj is String) {
    println("obj is not String")
} else {
    //objは自動的にString型にキャストされる
    println(obj.length)
}
```

## 型のキャスト（アンセーフキャスト）
型のキャストには`as`を用いる。

```kotlin
var name: Any = "JetBrains"
var name2: String = name as String
```

ただし、キャストに失敗した場合は`ClassCastException`がスローされる。
```kotlin
var value: Any = 100
var value2: String = value as String

//以下の例外が発生する。
Exception in thread "main" java.lang.ClassCastException: java.lang.Integer cannot be cast to java.lang.String
``` 

## 型変換

単純に型の変換を行う場合は以下の手段がある。

- Int型をString型に変換（`.toString()`）  
  2, 8, 16進数のように変換先を指定できる。

```kotlin
var value: Int = 100
var value2: String = value.toString()   //"100"
var value2: String = value.toString(2)  //"1100100"
var value2: String = value.toString(8)  //"144"
var value2: String = value.toString(10) //"100"
var value2: String = value.toString(16) //"64"
```

- String型をInt型に変換（`.toIntOrNull()`）  
  文字列に変換できない場合は`null`を返す。  
  ***型を指定する場合はNull許容型にする必要がある***

```kotlin
var value: String = "100"
var value2: Int? = value.toIntOrNull() //100

var value: String = "JetBrain"
var value2: Int? = value.toIntOrNull() //null
```

- String型をInt型に変換（`.toInt()`）  
  文字列に変換できない場合は`NumberFormatException`を投げる。  

```kotlin
var value: String = "100"
var value2: Int = value.toInt() //100

var value: String = "JetBrain"
var value2: Int = value.toInt() //NumberFormatException

//以下の例外が発生する。  
Exception in thread "main" java.lang.NumberFormatException: For input string: "xxxxxxx"
```

## Any, Unit, Nothing


# 関数

# 制御構文
## if文
## when文
## for文
## while文

# クラス

# object

# ラムダ式

# <div id="scope">スコープ関数</div>

# 例外


# 参照
## 全般
- [Android programing getstart](https://kuririnz.github.io/AndroidCourse/android/12-KotlinBasic/#%E5%AD%A6%E7%BF%92%E3%83%9D%E3%82%A4%E3%83%B3%E3%83%88)
## 変数
### オプショナル（Null-Safety）
- [Kotlinのif elseとletとalso](https://ticktakclock.hatenablog.com/entry/2020/02/22/203408)
### 定数
- [【Android - kotlin】定数の宣言はconstを付ける](https://advancement-of-it-dwarfs.blogspot.com/2018/09/android-kotlin-how-to-define-constants.html)

## 型
- [Kotlinの型を知る ~前編~](https://qiita.com/AAkira/items/16ae2e9c0f6073e0e983)
- [Kotlinの型を知る ~後編~ プラットフォーム型とCollections](https://qiita.com/AAkira/items/16ae2e9c0f6073e0e983)
### 型の一覧
- [基本的な型の一覧](https://maku77.github.io/kotlin/basic/types.html)
### 型のチェック
- [型チェックとキャスト](https://kotlindive.hatenablog.jp/entry/2018/02/01/192212)
### 型のキャスト（アンセーフキャスト）
- [型チェックとキャスト](https://kotlindive.hatenablog.jp/entry/2018/02/01/192212)
### 型変換
- 