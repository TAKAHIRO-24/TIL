# neovimのインストール
- [WindowsにNeoVimをインストールして設定ファイルinit.vimを読み込ませるまで](https://qiita.com/karakuri-t910/items/81f005ab6992ff54d5a5)
- [インストールしたてのWindowsにNeovimとVim-plugをGUIベースでインストールする](https://qiita.com/Suzukaze31/items/e8d23efcaa3b21a4aa90)

# ファイル名を指定して実行
環境変数に`nvim-qt`のパスを登録すれば実行可能。

# バッファ
- [vimでファイルを開く方法](https://kaworu.jpn.org/vim/vim%E3%81%A7%E3%83%95%E3%82%A1%E3%82%A4%E3%83%AB%E3%82%92%E9%96%8B%E3%81%8F%E6%96%B9%E6%B3%95)

ファイルを開く方法。
```
vi C:\users\user\AppData\Local\nvim\init.vim
e C:\users\user\AppData\Local\nvim\init.vim
```

複数ファイルを開いたり、編集するファイルを変更したりする際の操作。
- [vim バッファ入門](https://zenn.dev/sa2knight/articles/e0a1b2ee30e9ec22dea9)

`:ls`で現在開いているファイルを確認できる。
```
:ls
  1 #h   "~\AppData\Local\nvim\init.vim" line22
  3 %a + "~\AppData\Local\nvim\init2.vim" line1
```

`:b N`コマンドでバッファ番号を指定してファイル移動が可能。
```
:b 1
```

`:bd N`コマンドで不要になったバッファを消す。
```
:bd 1
```
`:bd! N`コマンドで未保存でも強制敵に削除する。

# ターミナル
`:terminal`や`:term`でvimからターミナルを開くことができる。  

- [Neovimのターミナルモードを快適に使いたい](https://qiita.com/Lennon_x00x_/items/e8fa47d27aaab9635161)

# init.luaの設定
- [Getting started using Lua in Neovim](https://github.com/willelz/nvim-lua-guide-ja/blob/master/README.ja.md)
- [neovimのinit.lua設定 おすすめ2023](https://qiita.com/maa_bp/items/3ab9fba56284ca314dfa)
