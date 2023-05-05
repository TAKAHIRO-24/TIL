"----------------------------------------------------------------------------"
"          共通
"----------------------------------------------------------------------------"
" 文字コードをUTF-8に設定
set fenc=utf-8
" バックアップファイルを作成しない
set nobackup
" スワップファイルを作成しない
set noswapfile
" 編集中のファイルが変更されたら自動で読み直す
set autoread
" バッファが編集中で未保存でもその他のファイルが開けるようにする
set hidden
" 入力中のコマンドをステータスに表示する
set showcmd

"----------------------------------------------------------------------------"
"         キーバインド
"----------------------------------------------------------------------------"
" jj連続押下でInsertModeに変更　
" inoremap jj <ESC>
" :edit でinit.vimを開く 
cnoremap init :<C-u>edit $MYVIMRC<CR>
" NormalModeで「<spase>s」でinit.vimの再読み込み
noremap <Space>s :source $MYVIMRC<CR>
noremap <Space>w :<C-u>w<CR>

"----------------------------------------------------------------------------"
"         カーソル
"----------------------------------------------------------------------------"
" 現在の行を強調表示
set cursorline
" 現在の行を強調表示（縦）
set cursorcolumn
" 折り返し時に表示行単位での移動ができるようにする
nnoremap j gj
nnoremap k gk
 
"----------------------------------------------------------------------------"
"         見た目
"----------------------------------------------------------------------------"
" 行番号を表示
set number
" インデントはスマートインデント
set smartindent
" 括弧入力時の対応する括弧を表示
set showmatch
" ステータスラインを常に表示
set laststatus=2
" コマンドラインの補完
set wildmode=list:longest
" シンタックスハイライトの有効化
syntax enable
" 背景色
highlight Normal ctermbg=none
highlight NonText ctermbg=none
highlight LineNr ctermbg=none
highlight Folded ctermbg=none
highlight EndOfBuffer ctermbg=none

"----------------------------------------------------------------------------"
"         入力
"----------------------------------------------------------------------------"
" 不可視文字を可視化（タブが「▶-」と表示される）
set list listchars=tab:\▶\-
"Tab文字を半角スペースにする
set expandtab
" 行頭以外のTab文字の表示幅（スペース〇個分）
" set tabstop=2
" 行頭でのTab文字の表示幅
" set shiftwidth=2
" クリップボードを有効
set clipboard=unnamed


"----------------------------------------------------------------------------"
"         検索
"----------------------------------------------------------------------------"
" 文字検索列が小文字の場合は大文字小文字を区別なく検索する
set ignorecase
" 検索文字列に大文字が含まれている場合は区別して検索する
set smartcase
" 検索文字列入力時に順次検索対象列にヒットさせる
set incsearch
" 検索時に最後まで行ったら最初に戻る
set wrapscan
" 検索語をハイライト表示
set hlsearch
" ESC連打でハイライト解除
nmap <ESC><ESC> :nohlsearch<CR><ESC>

"----------------------------------------------------------------------------"
"         ターミナルモード
"----------------------------------------------------------------------------"
" 新規タブでターミナルモードを起動
nnoremap :Term <cmd>terminal<CR>
" 下分割でターミナルモードを起動（git-bashを起動する※環境変数にパス通す必要あり）
nnoremap :term <cmd>belowright new<CR><cmd>terminal git-bash.exe<CR>
" TerminalのInsertModeからの離脱を「[ctrl+\]+[ctrl+n]」から[ESC]に変更
"tnoremap <ESC> <C-\><C-n>
tnoremap <C-[> <C-\><C-n>
" 常にInsertModeで開く
autocmd TermOpen * startinsert
