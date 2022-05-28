# Kotlinコルーチンでの非同期処理

## ライブラリ

コルーチンに使用するライブラリを`build.gradle(Module)`に追記する。

```
dependencies {
    //コルーチンに関するライブラリ
    implementation "org.jetbrains.kotlinx:kotlinx-coroutines-android:1.4.2"
    implementation "androidx.lifecycle:lifecycle-runtime-ktx:2.2.0"
}
```

## 実装

```Kotlin
//呼び出し元
@UiThread
private fun asyncExecute() {
    //lifecycleScope.launch内の処理と外の処理が非同期となる。
    lifecycleScope.launch {
        backgroundTaskRunner()
        postBackgroundTaskRunner()
    }
}

@WorkerThread
private suspend fun backgroundTaskRunner() {
    withContext(Dispatchers.IO) {
        //バックグランド処理
    }
}

@UiThread
private fun postBackgroundTaskRunner() {
    //バックグランド処理後UIスレッドで行う処理
}
```