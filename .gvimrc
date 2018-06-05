"==========================================
" 表示設定
"==========================================
"----------------------------------------
" カラースキーム
"----------------------------------------
" colorscheme desert
" colorscheme molokai
colorscheme badwolf
syntax on
set t_Co=256

"----------------------------------------
" フォント
"----------------------------------------
set guifont=Consolas:h9,Lucida_Console:h9:w5
set guifontwide=MS_Gothic:h9
set encoding=utf-8
set fileencodings=utf-8,euc-jp,sjis
set linespace=0

" (メニュー文字化け対策)
source $VIMRUNTIME/delmenu.vim
set langmenu=ja_jp.utf-8
source $VIMRUNTIME/menu.vim

"----------------------------------------
" 無駄に背景透過する
"----------------------------------------
" focusすると不透明を濃く、focusを外すと薄く
autocmd FocusGained * set transparency=245
autocmd FocusLost * set transparency=210

"----------------------------------------
" Tab、行末の半角スペースをの色指定
"----------------------------------------
highlight SpecialKey guifg=LightRed

"----------------------------------------
" カレント行をハイライト
"----------------------------------------
set cursorline
highlight CursorLine  guifg=NONE guibg=#282828
"highlight CursorLine term=reverse cterm=reverse

set cursorcolumn
highlight CursorColumn guibg=#282828


