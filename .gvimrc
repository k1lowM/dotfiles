"==========================================
" 表示設定
"==========================================
"----------------------------------------
" カラースキーム
"----------------------------------------
colorscheme badwolf
syntax on
set t_Co=256

"----------------------------------------
" フォント
"----------------------------------------
set guifont=Consolas:h9,Lucida_Console:h9:w5
set guifontwide=MS_Gothic:h9

" (メニュー文字化け対策)
source $VIMRUNTIME/delmenu.vim
set langmenu=ja_jp.utf-8
source $VIMRUNTIME/menu.vim

"----------------------------------------
" 無駄に背景透過する
"----------------------------------------
" focusすると不透明を濃く、focusを外すと薄く
autocmd FocusGained * set transparency=255
autocmd FocusLost * set transparency=210

"----------------------------------------
" ハイライト
"----------------------------------------
" Tab、行末の半角スペースをの色指定
" highlight SpecialKey guifg=#84474e

" カレント行
set cursorline
highlight CursorLine guifg=NONE guibg=#282828

" カレント列
set cursorcolumn
highlight CursorColumn guibg=#282828

" 行番号
hi CursorLineNr term=bold ctermfg=6 gui=bold guifg=Yellow

" 括弧
hi MatchParen ctermfg=255 ctermbg=29 guifg=#ffffff guibg=#00875f
