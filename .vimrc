set enc=utf-8
set fenc=utf-8
set fencs=utf-8,cp932,iso2022-jp,euc-jp,sjis,ucs-2
"行番号を表示させない
set number
" タイトルをウインドウ枠に表示
set title
" ルーラーを表示
"set ruler
" タブや改行を表示しない
set nolist
" 入力中のコマンドをステータスに表示する
set showcmd
" 括弧入力時の対応する括弧を表示
set showmatch
" ステータスラインを常に表示
set laststatus=2
" ステータスラインに表示する情報の指定
set statusline=%y%{GetStatusEx()}%F%m%r%=<%c:%l>
" ステータスラインの色
hi StatusLine   term=NONE cterm=NONE ctermfg=black ctermbg=white
" ハイライト
if &t_Co > 2 || has("gui_running")
	" シンタックスハイライトを有効にする
	syntax on
	" 検索結果文字列のハイライトを有効にする
	set hlsearch
endif

" 新しい行を直前の行と同じインデントにする
set autoindent
" Tab文字を画面上の見た目で何文字幅にするか設定
set tabstop=2
" cindentやautoindent時に挿入されるタブの幅
set shiftwidth=2
" Tabキー使用時にTabでは無くホワイトスペースを入れたい時に使用する
" この値が0以外の時はtabstopの設定が無効になる
set softtabstop=0
" Tab文字を空白に置き換える
set expandtab

" 前回終了したカーソル行に移動
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif

set backspace=2
set wildmenu

colorscheme advantage
syntax on
filetype on
set hlsearch

hi StatusLine term=bold cterm=bold ctermfg=black ctermbg=white
hi Visual term=bold cterm=bold ctermfg=0 ctermbg=4

" Function定義
"
" GetStatusEx
" ステータス表示用function
function! GetStatusEx()
	let str = ''
	let str = str . '' . &fileformat . ']'
	if has('multi_byte') && &fileencoding != ''
	let str = '[' . &fileencoding . ':' . str
	endif
	return str
endfunction

