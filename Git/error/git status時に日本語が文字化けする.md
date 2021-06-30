## 現象

`git status`実行時に日本語のファイル名が以下のように数字で文字化けする。

```
deleted:    "security/\347\247\230\345\257\206\351\215\265\343\203\273\345\205\254\351\226\213\351\215\265.md"
deleted:    shell/bash/.bash_history.md
deleted:    shell/bash/path.md
deleted:    "shell/bash/\347\251\272\347\231\275\343\201\256\345\213\225\344\275\234.md"
```

## 対応

デフォルトの設定では日本語がエンコードされて表示されるため、以下のコマンドを実行。

```
$ git config --global core.quotepath false
```

これで`.gitconfig`ファイルに以下の設定が追加される。

```
[core]
	pager = less -F -X
	editor = \"C:\\Users\\a_my_\\AppData\\Local\\Programs\\Microsoft VS Code\\Code.exe\" --wait
	quotepath = false
```

## 結果

`.gitconfig`ファイルに設定を追加後、再度確認。

```
deleted:    security/秘密鍵・公開鍵.md
deleted:    shell/bash/.bash_history.md
deleted:    shell/bash/path.md
deleted:    shell/bash/空白の動作.md
```

日本語が文字化けしていないことが確認できる。

## おまけ

### core.quotepathとは

以下、[Git公式リファレンス](https://git-scm.com/docs/git-config)より引用。

>### core.quotePath
>Commands that output paths (e.g. ls-files, diff), will quote "unusual" characters in the pathname by enclosing the pathname in double-quotes and escaping those characters with backslashes in the same way C escapes control characters (e.g. \t for TAB, \n for LF, \\ for backslash) or bytes with values larger than 0x80 (e.g. octal \302\265 for "micro" in UTF-8). If this variable is set to false, bytes higher than 0x80 are not considered "unusual" any more. Double-quotes, backslash and control characters are always escaped regardless of the setting of this variable. A simple space character is not considered "unusual". Many commands can output pathnames completely verbatim using the -z option. The default value is true.

C言語で使用されるエスケープ文字（`\t`, `\n`, `\\`...）や16進数で0x80以上の文字は特殊な文字と認識され、エスケープ処理が行われるが、`core.quotePath`をFalseに設定すると、それらの文字を特殊な文字と認識しなくなる。

また、各コマンドに`-z`オプションを付けても日本語をそのまま出力するらしい。

```
$ git status -z
D  Database/transaction.mdD  Git/GitHub flow.mdD  Git/Pull Request.mdD  Git/README.mdD  Git/command/branch.mdD  Git/command/clean.mdD  Git/command/config.mdD  Git/command/diff.mdD  Git/command/fetch.mdD  Git/command/log.mdD  Git/command/ls.mdD  Git/command/merge.mdD  Git/command/rebase.mdD  Git/command/remove-file.mdD  Git/command/rename.mdD  Git/command/restore.mdD  Git/command/stash.mdD  Git/command/submodule.mdD  Git/command/tag.mdD  Git/command/コマンド一覧.mdD  Git/error/fatal: refusing to merge unrelated histories.mdD  Git/error/ssh接続エラー.mdD  Git/file/.gitcofig.mdD  Git/file/.gitignore.mdD  Git/file/bash.bashrc.mdD  Git/tool/Octotree.mdD  Git/tool/ZenHub.mdD  Git/tool/p4merge.mdD  Git/trackファイル.mdD  Git/開発の流れ.mdD  README.mdD  Tool/Android Studio/.ideavimrc.mdD  Tool/Visual Studio Code/keybindings.json.mdD  Tool/Visual Studio Code/settings.json.mdD  Tool/Visual Studio Code/vscode-remote-container.mdD  Tool/Visual Studio/.vsvimrc.mdD  Tool/p4merge/encording.mdD  Tool/p4merge/setup for Git.mdD  security/秘密鍵・公開鍵.mdD  shell/bash/.bash_history.mdD  shell/bash/path.mdD  shell/bash/空白の動作.md
```

確かに文字化けは解消されたが、`git status`コマンドで表示されるブランチの状況等は表示されず、変更一覧も一行で表示されている。

こちらの解消方法は確認中...

## 参考
- [git diff や git status での日本語の文字化けを防ぐ (core.page, core.quotepath)](https://maku77.github.io/git/settings/garbling.html)
- [Git - git-config Documentation](https://git-scm.com/docs/git-config)
