# Grep

- grepを使用することで、指定したフォルダ内やその下層のフォルダ内にあるファイルから、特定の文字列を使用しているファイルを探索することができる。

## 使用方法

```
$ grep 検索文字列 <file-name>
```

- `work`フォルダ内ファイルから文字列`target`を検索する場合、`grep target work/*`を使用。
- `work`フォルダより下層の全ファイルから文字列`target`を検索する場合、`grep -r target work/*`を使用。

# 参考
- [grepコマンドの詳細まとめました【Linuxコマンド集】](https://eng-entrance.com/linux-command-grep)