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

## lateinit変数

Kotlinでは原則的に宣言時に初期化が必要だが、`var`の前に`lateinit`を記述することで宣言のみを行うことができる。
また、変数の宣言のみを行う場合、型を明示的に示す必要がある。

```Kotlin
//宣言のみ
lateinit var name: string

//初期化
name = "JetBrains"
```

>クラスのプロパティはできるだけ再代入不可変数の`val`変数として定義すると保守性の高いコードを作成することができる。ただし、`val`変数は生成時に参照先のオブジェクトを確定しておく必要があるため、変数の宣言時に代入するか、`init`ブロックでの代入が必要。  
しかし、Androidなどのフレームワーク上で実装を行っている場合、どうしてもフレームワークによる初期化関数の呼び出しの段階まで変数の初期化ができないことがある。このようなケースで`val`変数の代わりに使用できるのが`lateinit`変数。

```kotlin
class MainActivity : Activity() {
    private lateinit var surfaceView: SurfaceView

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        surfaceView = SurfaceView(this)
    }
    //...
}
```

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

ただし、型のキャストができない場合例外が投げられる。

```kotlin
var name: String = "JetBrains"

if (name is Int) {  

} else {

}

//String型はInt型にキャストできないため以下のエラーが発生する
Incompatible types: Int and String

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

関数の基本的な記述方法は以下の通り。

```kotlin
//定義
public fun calc(x: Int): Int {
    return x + 10
}

//参照
var value: Int = calc(20)
```

# 制御構文
## if文

if文の基本形は以下の通り。

```kotlin
var name: Any = "JetBrains"

if (name is String) {
    //条件式がTrueの場合に実行
    println(name)
} else {
    //条件式がFalseの場合に実行
    println("name is not String")
}
```

KotlinにはJavaの三項演算子（条件演算子）は存在しない。  
その代わり、if文が代入式として利用できる。  
代入式としてif文を使用する際には最後に記述した変数や式が左辺の変数に代入される。

```kotlin
var value: Int = 10
var value2: Int = if (value > 5) {
    value += 10
    value += 10
    value  //この値が代入される
} else {
    value  //この値が代入される
}

println(value2) //30
```

## when文

Kotlinの`when`文ではアロー演算子（`->`)を使用する。  
- 処理が一行の場合は、アロー演算子の後に半角スペースをはさんで記述。
- 処理が複数行にわたる場合は、{}のブロック内に記述。
- `,`で複数条件を指定しすることができる。
  - `&&`や`||`を使用して条件式を記述することも可能。
- `is`演算子や`in`演算子を使用することができる。
- `!`演算子を使用することで、`!in`, `!is`を使用することができる。
- `else`によって、上記全ての条件に該当しないものを処理することができる。

```kotlin
when(num) {
    0 ->          //numが0の場合の処理
    1 -> {
                  //numが1の場合の処理
                  //処理が複数行の場合は{}ブロック内に記述
    }
    2,3 ->        //numが2,3の場合の処理
    in 4..10 ->   //numが4～10の範囲内の場合の処理
    !in 11..15 -> //numが11～15の範囲外の場合の処理
    is Int ->     //numがInt型の場合の処理
    !is Int ->    //numがInt型ではない場合の処理
    in 16..20, in 30..35 -> //numが16～20または30～35の範囲の場合の処理
    (num == 36) || (num == 38) -> //numが36または38の場合の処理
    else ->       //上記全ての条件に該当しなかった場合
}
```

`when`文も`if`文と同様に代入式として使用することができる。

```kotlin
var num: Int = 10
var num2: String = when(num) {
    1 -> "one"
    2 -> "two"
    else -> "other"
}
```

また、`when`文に引数を与えなかった場合、`if-else`文の代替として認識され、分岐条件は論理型の判定になるように記述する必要がある。

```kotlin
var num: Int = 10
var num2: Int = when {
    //条件はTrueかFalseになるように記述する必要がある
    num == 1 -> 10
    num == 10 -> 10 * 10
    else -> 0
}
```

## for文

Kotlinの`for`文では、`for (変数 in イテレータ)`の形式で記述する。  
イテレータにはIteratorインターフェースを実装したオブジェクトを指定する。

```kotlin
//処理が1行の場合は以下のように記述可能。
for (i in 1..3) println(i)

//処理が複数行の場合は{}内に記述可能。
var num: Int = 0

for (i in 1..3) {
    num = i + 10
    println(num) //11, 12, 13
}

//downToを使用した例
for (i in 20 downTo 0) {
    println(i) //20, 19, 18 ... 2, 1, 0
}

//stepを使用した例
for (i in 20 downTo 0 step 2) {
    println(i) //20, 18, 16 ... 4, 2, 0
}

//配列を使用した例
val array: Array<String> = arrayOf("banana", "apple", "orange")

for (fruit in array) {
    println(fruit) //banana, apple, orange
}

//mapを使用した例
val map: Map<Int,String> = mapOf(1 to "banana"
                                ,2 to "apple"
                                ,3 to "orange")

for ((num,fruit) in map) {
    println("${num} : ${fruit}") //1 : banana
                                 //2 : apple
                                 //3 : orange
}

//インデックス付きのfor文
//indicesを使用した例
val name: String = "JetBrains"

for (i in name.indices) {
    println(name[i])  //J, e, t, B, r, a, i, n, s
}

//インデックス付きのfor文
//withIndex()を使用した例
val name: String = "JetBrains"

for ((index, value) in name.withIndex()) {
    println("index : ${index}, value : ${value}")
    /*
    index : 0, value : J
    index : 1, value : e
    index : 2, value : t
    index : 3, value : B
    index : 4, value : r
    index : 5, value : a
    index : 6, value : i
    index : 7, value : n
    index : 8, value : s
    */
}
```

イテレータとは`for`文が動作するために必要な概念で、イテレータが実装されていないオブジェクトでは`for`文を使うことができない。  

具体的にはイテレータとは以下の実装がなされている必要がある。  
これらによって、`for`文がいつまで繰り返されるべきなのかを知ることができる。
- next()
  - 次の要素を返すメソッド
- hasNext()
  - 次の要素が存在するかを確かめるメソッド

上の`1, 2, 3`が出力される`for`文では、`1..3`という`Int`型の値の範囲を指定する`IntRange`型にイテレータが実装されているため、1の次には2があり、2の次には3があり、3の次には値がないといった判断をコンピューターが可能となる。


## while文

```kotlin
var i: Int = 0

while (i <= 10) {
    println(i) //0, 1, 2, 3...8, 9, 10
    i++
}

var i: Int = 10
do {
    println(i) //10, 9, 8...2, 1, 0
    i--
} while (i > 0)
```

## 高階関数を用いたループ

- repeat
  - repeat関数はループ回数を指定するだけでその回数ループする。***繰り返し回数***は`it`で参照可能。
- forEach
  - 配列やコレクションのループに使用可能。***繰り返しの要素***は`it`で参照可能。

```kotlin
//repeat関数
repeat(5) {
    println(it) //0, 1, 2, 3, 4
}

//ループ回数にarray.sizeを指定
val array: Array<String> = arrayOf("banana", "apple", "orange")

repeat(array.size) {
    println("${it} : ${array[it]}")
    /*
    0 : banana
    1 : apple
    2 : orange
    */
}

//forEach関数
val array: Array<String> = arrayOf("banana", "apple", "orange")

array.forEach {
    println(it) //banana, apple, orange
}
```


# クラス

クラスは以下を含めることができる。

- クラスメンバ
  - コンストラクタと初期化ブロック
  - 関数
  - プロパティ
  - ネストされたインナークラス
  - オブジェクトの宣言

Kotlinのクラスの記述方法は以下の通り。

```kotlin
class Person constructor (val name: String, val age: Int)
```

プライマリコンストラクタがアノテーションや可視性修飾子を持っていない場合は、`constructor`は省略可能。  
丸括弧内を`プライマリコンストラクタ`といい、上記の例では`name`と`age`というプロパティを宣言している。また、インスタンスを作成する際に、このコンストラクタに渡した値で自動的に初期化される。

クラスやプロパティは自動的に`public`アクセスが可能になるため、呼び出し側では`インスタンス名.name`, `インスタンス名.age`のような形でプロパティを利用できる。

## コンストラクタ

Kotlinのコンストラクタには以下の2種類がある。
- プライマリコンストラクタ（primary constructor）
- セカンダリコンストラクタ（secondary constructor）

### １．プライマリコンストラクタ（primary constructor）

以下のように、丸括弧に囲まれたコードブロックをプライマリコンストラクタという。  
※`constructor`は省略するのが一般的。

```kotlin
class Person constructor(val fullname: String, val age: Int )
```

プライマリコンストラクタでは以下の定義する。
- コンストラクタの引数。
- 引数で初期化されるプロパティ。

インスタンスを生成する場合は以下のように記述する。

```kotlin
val person = Person("JetBrain", 21)
```

#### ■パターン１

プライマリコンストラクタを明示的に記述する場合は以下のようになる。

```kotlin
class Person constructor (_fullname: String, _age: Int) {

    val fullname: String
    val age: Int
    
    init {
        //thisは省略可能
        this.fullname = _fullname
        this.age = _age
    }

    fun feature() {
        println("${this.fullname} : ${this.age}")
    }
}

val person: Person  = Person("JetBrains", 21)
person.feature() //JetBrains : 21
```

`init`は初期化ブロックの実装個所。  
初期化ブロックでは、生成された時に実行される初期化コードを含んでおり、プライマリコンストラクタと一緒に利用されることを意図されている。

#### ■パターン２

コンストラクタ引数に`var`や`val`を指定することでプロパティの宣言と初期化を同時に行うことができる。

```kotlin
class Person (private val fullname: String, private val age: Int) {

    fun feature() {
        println("${this.fullname} : ${this.age}")
    }
}

val person: Person  = Person("JetBrains", 21)
person.feature() //JetBrains : 21
```

#### ■パターン３

コンストラクタ引数にデフォルト値を設定することも可能。

```kotlin
class Person (private val fullname: String = "no-name"
             ,private val age: Int = 0) {

    fun feature() {
        println("${this.fullname} : ${this.age}")
    }
}

val person: Person  = Person()
person.feature() //no-name : 0
```

### セカンダリコンストラクタ（secondary constructor）

***TODO : セカンダリコンストラクタの使用例を調べる。***

- クラスに0個以上持つことができる。
- 最終的にプライマリコンストラクタを呼び出すことが必要。
- `this`を使用してプライマリコンストラクタを呼び出すことが可能。

基本構文は以下の通り。

```kotlin
constructor (引数: データ型): this(引数)
```

#### ■パターン１

セカンダリコンストラクタが１つの場合。

セカンダリコンストラクタにnameが渡され、その後プライマリコンストラクタが実行される。

```kotlin
class Person (private val name: String, private val age: Int) {

    //thisはプライマリコンストラクタを指す
    constructor (name: String) : this(name, 21)

    fun feature() {
        println("${name} : ${age}")
    }
}

val person: Person = Person("JetBrain")
person.feature() //JetBrain : 21
```

#### ■パターン２

セカンダリコンストラクタが２つの場合。

***TODO : 後ほど記述する。***

## 継承

Kotlinの全てのクラスは共通の`Any`スーパークラスを持つ。  
これはスーパータイプの宣言がないクラスのデフォルトのスーパークラスとなる。

```kotlin
class Person //Anyから暗黙の継承
```

スーパークラスを明示的に宣言するには以下のように記述する。  
`open`アノテーションを付けることによって、他のクラスがこのクラスを継承することができる。  
デフォルトでは全てのクラスは`final`になっており、継承可能とするには`open`を明示的に指定する必要がある。

```kotlin
//スーパークラス
open class Base(p: Int)

//継承
class Derived(p: Int) : Base(p)
```

上記例の場合、コンストラクタの引数（`Derived(p: Int)`）によって基底の型を初期化している。  
※インスタンス化の際に`引数p`に渡される値によって`Base(p)`も初期化している。

仮にプライマリコンストラクタを持たない場合、セカンダリコンストラクタはそれぞれ基底の型を`super`キーワードを使用して初期化するか、他の初期化してくれるコンストラクタに移譲しなければならない。

```kotlin
class MyView: View {
    constructor(ctx: Content) : super(ctx) {

    }
    constructor(ctx: Content, attrs: AttributeSet) : super(ctx, attrs) {

    }
}
```

### ■オーバーライド

スーパークラスのメソッドをサブクラスで再定義しなおしたい場合は、以下のアノテーションが必要。

- オーバーライド可能なメソッドについて、スーパークラスにて`open`アノテーションを指定する。
- サブクラスにてオーバーライドするメソッドにて、`override`アノテーションを指定する。
- `open`アノテーションを持たないクラスは`open`メンバも持つことができない。

```kotlin
//スーパークラス
open class Base {
    //サブクラス内でオーバーライド可能なメソッド
    open fun v() {

    }
    //サブクラス内でオーバーライド不可能なメソッド
    fun nv() {

    }
}

//継承
class Derived() : Base() {
    //オーバーライドを明示的に指定。
    override fun v() {

    }
}
```

`override`しているメンバはそれ自体が`open`なので、サブクラス内でオーバーライドされる可能性がある。  
これを防ぐには、`final`アノテーションを指定する。

```kotlin
open class Derived() : Base() {
    //サブクラス内でオーバーライドを禁止。
    final override fun v() {

    }
}
```

オーバーロードはプロパティにも適用可能。  
プライマリコンストラクタでプロパティ宣言の一部として`override`アノテーションを使用可能。

- `val`プロパティを`var`プロパティでオーバーロード可能。その逆も同様。

```kotlin
open class Base {
    //オーバーライド可能であることを明示的に示す。
    open val x: Int
        get {

        }
}

//プライマリコンストラクタにてオーバーライドアノテーションを指定。
class SubClass (override val x: Int) : Base {

}
```

複数のクラスやインターフェースを継承する場合、以下の方法で実装する。

- カンマ区切り（`,`）によってクラスやインターフェースを記載する。
- 複数のクラスやインターフェースから継承する場合、同じメソッド名のものが存在する場合は、サブクラスでオーバーライドする必要がある。
    - メソッド名が同じものを複数のクラスやインターフェースからオーバーライドする場合、以下のように指定する。
        - `super<クラス名>`
        - `super<インターフェース名>`
- インターフェースのメンバはデフォルトで`open`が適用されている。

```kotlin
open class A {
    open fun f() {
        println("A")
    }

    fun a() {
        println("a")
    }
}

interface B {
    //インターフェースではopenは不要
    fun f() {
        println("B")
    }

    fun b() {
        println("b")
    }
}

//スーパークラスの両方にf()メソッドが存在するため、クラスCでは曖昧さ排除のためf()をオーバーライドして再定義する必要がある。
class C() : A(), B {
    
    override fun f() {
        super<A>.f() //A.f() を呼び出す
        super<B>.f() //B.f() を呼び出す
    }
}
```

### ■インターフェース

Kotlinでインターフェースを実装するには、`interface`修飾子を使用する。

```kotlin
interface Printable {
    fun print()
    fun printDetail()
}
```

インターフェースをクラスで実装するには以下の通り。
- クラス名の後に`:（コロン）`を記述してその後ろにインターフェース名やスーパークラス名を指定する。
- `override`を記載してメソッドを実装する。
  - `override`修飾子はスーパークラスやインターフェースをオーバーライドするメソッドやプロパティを指定するために利用。Kotlinでは`override`修飾子は省略不可能。
- インターフェースに定義のあるメソッドは、実装クラスにて必ずオーバーライドする必要がある。

```kotlin
class KotlinPrinter : Printable {
    //interfaceに実装のあるprint(), printDetail()のどちらか片方でも実装がなければコンパイルエラー
    override fun print() {
        println("Kotlin summay")
    }
    override fun printDetail() {
        println("Kotlin detail print")
    }
}
```

インターフェースは、デフォルトの実装を持たせることができる。  
デフォルトの実装をもつメソッドを実装クラス側でオーバーライドしなければ、インターフェースに定義したデフォルトの処理が実行される。

```kotlin
interface Printable {
    //interfaceにてデフォルトの実装
    fun print() {
        println("Hello World")
    }
    fun printDetail()
}

class KotlinPrinter : Printable {
    override fun printDetail() {
        println("Kotlin detail print")
    }
}

val printer: KotlinPrinter = KotlinPrinter()
//デフォルトの実装が適用される。
printer.print()  //Hello World
printer.printDetail() //Kotlin detail print
```

複数のインターフェースやスーパークラスを継承する場合、同じメソッド名の処理については必ずオーバーライドしなければならない。  
片方のインターフェースのみにデフォルトの実装がある場合は、オーバーライドしなくても、デフォルトの処理が継承される。  
また、インターフェースで実装されているデフォルトの処理を実装クラスから呼び出す場合は、`super<インターフェース名>.メソッド名`で行う。

```kotlin
interface Printable {
    //interfaceにてデフォルトの実装
    fun print() {
        println("Hello World")
    }
    fun printDetail()
}

interface Display {
    //interfaceにてデフォルトの実装
    fun print() {
        println("Hello Display")
    }
}

//PrintableとDisplayの2つのインターフェースを実装
class KotlinPrinter : Printable, Display {
    //fun print()をオーバーライドしなければ、コンパイルエラーになる
    override fun print() {
        super<Printable>.print()
        super<Display>.print()
    }
    override fun printDetail() {
        println("Kotlin detail print")
    }
}
```

***TODO:インターフェース内のプロパティ***

### ■抽象クラス

抽象クラスは`abstract`を指定して定義することが可能。  
また、抽象クラスは`open`を指定せずともオーバーライドすることができる。

## 可視性修飾子

## getter, setter

Kotlinでプロパティを定義する場合、以下のように記述する。

- `name`プロパティを公開している。
- Personクラス内では、メンバー変数`_name`として保持。
  - プロパティの値を保持するデータストレージ（メンバー変数）を`バッキングフィールド（backing field）`という。
- `get()`では、プロパティの値を返すように実装。
- `set(value)`は、外部からプロパティに値を設定した際に、`value`に自動的に値がはいる。この値をバッキングフィールドに設定できる。
- Kotlinでは、getter, setterともに省略可能だが、`set()`を実装することによって、入力値の制御を行うことが可能。
  - `check()`, `require()`にて制御可能。

```kotlin
class Person {
    private var _name: String = ""

    var name: String
        get() {
            return _name
        }
        set(value) {
            //setterを実装することで、以下のように入力値の制御が可能。
            require(value.length > 0)
            _name = value
        }
}

fun main() {
    val person: Person = Person()

    person.name = "JetBrains"
    println(person.name) //JetBrains

    //require(value.length > 0)によって、空白を入力しようとすると、例外が発生する。
    person.name = ""
    println(person.name)

    //以下の例外が発生。
Exception in thread "main" java.lang.IllegalArgumentException: Failed requirement.
}
```

Kotlinでは、バッキングフィールドを明示的に作成せずとも必要に応じて自動的に作成することができる。

以下のコードは上記のコードと同様の処理となる。
- バッキングフィールド（メンバー変数）を宣言していない。
- バッキングフィールドの代わりに`field`を使用。
  - Kotlinではあるプロパティを実装するために必要なバッキングフィールドは必要に応じて暗黙的に自動生成され、getter, setterで`field`にてそれにアクセスできる。

```kotlin
calss Person {
    var name: String = ""
        get() {
            return field
        }
        set(value) {
            require(value.length > 0)
            field = value
        }
}
```

また、`require(value.length > 0)`のように入力値や出力値を特別制御する必要がない場合は、getter, setterは省略可能。

```kotlin
class Person {
    var name: String = ""
}

fun main() {
    val person: Person = Person()

    person.name = "JetBrains"
    println(person.name) //JetBrains
}
```

上記の場合、`name`という変数の値を外部から直接書き換えているかのように見えるが、内部的にはバッキングフィールドが自動で作成されており、`field`を通じて間接的にクラス内の`name`の値を書き換えたり呼び出したりしている。


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
### lateinit変数
- [lateinit による変数の初期化](https://maku77.github.io/kotlin/basic/lateinit.html)

## 型
- [Kotlinの型を知る ~前編~](https://qiita.com/AAkira/items/16ae2e9c0f6073e0e983)
- [Kotlinの型を知る ~後編~ プラットフォーム型とCollections](https://qiita.com/AAkira/items/16ae2e9c0f6073e0e983)
### 型の一覧
- [基本的な型の一覧](https://maku77.github.io/kotlin/basic/types.html)
### 型のチェック
- [型チェックとキャスト](https://kotlindive.hatenablog.jp/entry/2018/02/01/192212)
### 型のキャスト（アンセーフキャスト）
- [型チェックとキャスト](https://kotlindive.hatenablog.jp/entry/2018/02/01/192212)

## 制御構文
### when文
- [when 式による条件分岐](https://maku77.github.io/kotlin/basic/when.html)
### for文
- [Kotlinでループ処理](https://qiita.com/NagaokaKenichi/items/b68b699dc0b792754d7b)
- [【Kotlin練習問題】forループのためのイテレーターの実装](https://codelabsjp.net/kotlin-practice-iterator/)
### 高階関数を用いたループ
- [Kotlinでループ処理](https://qiita.com/NagaokaKenichi/items/b68b699dc0b792754d7b)

## クラス
- [これがKotlinのオブジェクト指向プログラミングか！と思ったこと](https://qiita.com/syumiwohossu/items/60a7c50af868a551f2f2)
### コンストラクタ
- [【Kotlin】コンストラクタ（プライマリ / セカンダリ）](https://zenn.dev/tm35/articles/38780504cacdd5)
- [Kotlin - コンストラクタ](https://blog.y-yuki.net/entry/2019/05/25/093000)
### 継承
- [クラスと継承](https://dogwood008.github.io/kotlin-web-site-ja/docs/reference/classes.html)
### インターフェース
- [インターフェース](https://dogwood008.github.io/kotlin-web-site-ja/docs/reference/interfaces.html)
- [Kotlin - インターフェース](https://blog.y-yuki.net/entry/2019/05/20/100000)
### getter, setter
- [クラスの実装 〜 プロパティとバッキングフィールド](https://kotlin.keicode.com/lang/classes-properties.php)
- [13日目：プロパティとフィールド](https://kotlin.hatenablog.jp/entry/2012/12/13/231343)
- [[Kotlin]クラスにカスタムゲッター/セッターを定義する](https://pouhon.net/kotlin-getter/3223/)
- [Kotlinにおけるクラス、プロパティ、コンストラクタ、データクラス、シングルトン](https://atmarkit.itmedia.co.jp/ait/articles/1804/02/news009.html)
## 可視性修飾子
- [可視性修飾子](https://dogwood008.github.io/kotlin-web-site-ja/docs/reference/visibility-modifiers.html)