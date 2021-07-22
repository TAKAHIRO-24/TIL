# Gradleとは

- <a href="#Gradle">Gradle</a>はオープンソースのビルドシステム。
- javaの<a href="#jar">jarファイル</a>やwarファイルを作成する。
- Groovyという言語でビルドの手順を定義する。
- Grovyはjava仮想マシン（JVM）用の動的言語。

## プロジェクト構成

Android StudioでProjectを作成すると、以下のツリー構造になる。

![image](https://user-images.githubusercontent.com/85177462/126588170-e791dff1-453c-485e-aec9-406606897d2d.png)

Gradleのビルドスクリプトは`build.gradle`。  
2種類の`build.gradle`の違いは以下の通り。
- <dt>build.gradle(Project: ...)</dt>
  <dd>すべてのモジュールに適用するビルド設定を定義。</dd>
- <dt>build.gradle(Module: ...</dt>
  <dd>モジュール固有のビルド構成を定義。</dd>

### モジュール

- ソースファイルとビルド設定の集まり。  
- モジュールによって機能ごとにプロジェクトを分割できる。  
- プロジェクトには一つまたは多数のモジュールを含めることができ、モジュールは別のモジュールを依存関係として使用可能。  
- 各モジュールは個別にビルド、テスト、デバッグを実行できる。

## ビルド構成

### Gradle設定ファイル
- <dt>settings.gradle</dt>
  <dd>このファイルの記述に基づいてGradleはアプリをビルドする際に含める必要のあるモジュールを識別する。</dd>
- <dt>build.gradle(Project: ...)</dt>
  <dd>すべてのモジュールに適用するビルド設定を定義。</dd>
- <dt>build.gradle(Module: ...</dt>
  <dd>モジュール固有のビルド構成を定義。ここに設定の追加をすることでmainアプリのマニフェスト内やトップレベルのbuild.gradleファイル内の設定をオーバーライドすることができる。</dd>

# 参照
- [Android デベロッパー＞Android Studio＞ユーザーガイド＞プロジェクトの概要](https://developer.android.com/studio/projects?hl=ja)
- [Android デベロッパー＞Android Studio＞ユーザーガイド＞ビルドを設定する](https://developer.android.com/studio/build?hl=ja)
- [Androidのビルドについて](http://mixi-inc.github.io/AndroidTraining/introductions/1.05.how-to-build-for-gradle.html)

# 注釈
- <dt><a id="jar">jarファイル</a></dt>
  <dd>javaのバイトコードや画像をzipファイル形式で一つにまとめたもの</dd>
- <dt><a id="Gradle">Gradle</a></dt>
  <dd>類似のビルドツールにMarvenがある。Marvenはビルドの手順の定義をXMLで記述する。</dd>