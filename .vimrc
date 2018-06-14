"==========================================
" プラグインマネージャ
"==========================================
"----------------------------------------
" Vundle
"----------------------------------------
set nocompatible
filetype off

if has('vim_starting')
    " 初回起動時のみruntimepathにvundleのパスを指定する
    set rtp+=~/.vim/bundle/Vundle.vim "vundleのインストール先
endif

call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

" 導入したいプラグインを以下に列挙
" Plugin '[Github Author]/[Github repo]' の形式で記入
" Bundle~とかいうのは昔の名残だから使わないでね
" 追加したら:source ~/.vimrc | :PluginInstallを実行

Plugin 'fholgado/minibufexpl.vim'

Plugin 'sjl/badwolf'
Plugin 'chriskempson/vim-tomorrow-theme'

" unite.vim関連
Plugin 'Shougo/unite.vim'
Plugin 'Shougo/neomru.vim'
Plugin 'Shougo/neoyank.vim'
Plugin 'ujihisa/unite-colorscheme'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

Plugin 'scrooloose/nerdtree'

call vundle#end()
filetype plugin indent on


" この後は、好きな設定を入れる
"==========================================
" システム設定
"==========================================
"----------------------------------------
" 勝手に作るファイルを無効にする。(作らなくする)
"----------------------------------------
set nobackup
set noundofile

"----------------------------------------
" 自動改行抑止
"----------------------------------------
set tw=0

" クリップボードを共有
set clipboard+=unnamed

"----------------------------------------
" ファイルを開いたら前回のカーソル位置へ移動
" $VIMRUNTIME/vimrc_example.vim
"----------------------------------------
augroup vimrcEx
    autocmd!
    autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line('$') | exe "normal! g`\"" | endif
augroup END

" 保存されていないファイルがあるときでも別のファイルを開くことが出来る
set hidden

"==========================================
" 表示設定
"==========================================
"----------------------------------------
" エンコード
"----------------------------------------
set encoding=utf-8
" set fileencodings=ucs-bom,utf-16le,iso-2022-jp,utf-8,utf-16be,euc-jp
set linespace=0

" 文字コードの自動認識
" 注意:BOM無しUnicodeは「:e ++enc=utf-16le」で読み込んでね
if &encoding !=# 'utf-8'
  set encoding=japan
  set fileencoding=japan
endif
if has('iconv')
  let s:enc_euc = 'euc-jp'
  let s:enc_jis = 'iso-2022-jp'
  " iconvがeucJP-msに対応しているかをチェック
  if iconv("\x87\x64\x87\x6a", 'cp932', 'eucjp-ms') ==# "\xad\xc5\xad\xcb"
    let s:enc_euc = 'eucjp-ms'
    let s:enc_jis = 'iso-2022-jp-3'
  " iconvがJISX0213に対応しているかをチェック
  elseif iconv("\x87\x64\x87\x6a", 'cp932', 'euc-jisx0213') ==# "\xad\xc5\xad\xcb"
    let s:enc_euc = 'euc-jisx0213'
    let s:enc_jis = 'iso-2022-jp-3'
  endif
  " fileencodingsを構築
  if &encoding ==# 'utf-8'
    let s:fileencodings_default = &fileencodings
    let &fileencodings = s:enc_jis .','. s:enc_euc .',cp932'
    let &fileencodings = &fileencodings .','. s:fileencodings_default
    unlet s:fileencodings_default
  else
    let &fileencodings = &fileencodings .','. s:enc_jis
    set fileencodings+=utf-8,ucs-2le,ucs-2
    if &encoding =~# '^\(euc-jp\|euc-jisx0213\|eucjp-ms\)$'
      set fileencodings+=cp932
      set fileencodings-=euc-jp
      set fileencodings-=euc-jisx0213
      set fileencodings-=eucjp-ms
      let &encoding = s:enc_euc
      let &fileencoding = s:enc_euc
    else
      let &fileencodings = &fileencodings .','. s:enc_euc
    endif
  endif
  " 定数を処分
  unlet s:enc_euc
  unlet s:enc_jis
endif
" 日本語を含まない場合は fileencoding に encoding を使うようにする
if has('autocmd')
  function! AU_ReCheck_FENC()
    if &fileencoding =~# 'iso-2022-jp' && search("[^\x01-\x7e]", 'n') == 0
      let &fileencoding=&encoding
    endif
  endfunction
  autocmd BufReadPost * call AU_ReCheck_FENC()
endif
" 改行コードの自動認識
set fileformats=unix,dos,mac
" □とか○の文字があってもカーソル位置がずれないようにする
if exists('&ambiwidth')
  set ambiwidth=double
endif

"----------------------------------------
" Tab、行末の半角スペースを明示的に表示する
"----------------------------------------
set list
set listchars=tab:>.,trail:-
highlight SpecialKey guifg=#006600

" 行折返し設定
set wrap

" 行番号表示
set number

" 行頭以外のTab文字の表示幅（スペースいくつ分）
set tabstop=4

" 行頭でのTab文字の表示幅
set shiftwidth=4

"----------------------------------------
" Tab、行末の半角スペースを明示的に表示する
"----------------------------------------
set list
set listchars=tab:>.,trail:-

"----------------------------------------
" 全角スペースを表示
"----------------------------------------
function! ZenkakuSpace()
    "highlight ZenkakuSpace cterm=reverse ctermfg=DarkMagenta gui=reverse guifg=DarkMagenta
    highlight ZenkakuSpace cterm=underline ctermfg=darkgrey gui=underline guifg=darkgrey
endfunction

if has('syntax')
    augroup ZenkakuSpace
        autocmd!
        autocmd ColorScheme       * call ZenkakuSpace()
        autocmd VimEnter,WinEnter * match ZenkakuSpace /　/
    augroup END
    call ZenkakuSpace()
endif

"==========================================
" キーマッピング
"==========================================
" 普通のエディタのように使用する
" nnoremap <F9> :source $VIMRUNTIME/evim.vim<CR>

" バッファ切替
map <silent>    <F2>    :bp<cr>
map <silent>    <F3>    :bn<cr>
" nnoremap <silent> <C-j> :bprev<CR>
" nnoremap <silent> <C-k> :bnext<CR>

" 強制全保存終了を無効化
nnoremap ZZ <Nop>

" ESC連打でハイライト解除
nmap <Esc><Esc> :nohlsearch<CR><Esc>

"----------------------------------------
"縦に連番を入力する
"----------------------------------------
nnoremap <silent> co :ContinuousNumber <C-a><CR>
vnoremap <silent> co :ContinuousNumber <C-a><CR>
command! -count -nargs=1 ContinuousNumber let c = col('.')|for n in range(1, <count>?<count>-line('.'):1)|exec 'normal! j' . n . <q-args>|call cursor('.', c)|endfor

"ビジュアルモードでは <C-a> や <C-x> に割り当てる
vnoremap <silent> <C-a>   :ContinuousNumber <C-a><CR>
vnoremap <silent> <C-x>   :ContinuousNumber <C-x><CR>


"==========================================
" 各種プラグイン設定
"==========================================
"----------------------------------------
" vim-airline
"----------------------------------------
" Smarter tab line有効化
let g:airline#extensions#tabline#enabled = 1

" 空白エラーの検出を無効にする
let g:airline#extensions#whitespace#enabled = 0

" vim-airline-themes
" その場で確認するときは、:AirlineTheme {theme-name}
let g:airline_theme = 'durant'

" タブに番号を表示
let g:airline#extensions#tabline#buffer_idx_mode = 1

"----------------------------------------
" MiniBufExpl
"----------------------------------------
" ハイライトがうまく使えないので無効化
let g:miniBufExplorerAutoStart = 0

"let g:miniBufExplTabWrap = 1                " make tabs show complete (no broken on two lines)
"let g:miniBufExplModSelTarget = 1           " try to always use right window for buffer
"let g:did_minibufexplorer_syntax_inits = 1  " prevent override of color settingshi link MBENormal Comment
"
"hi link MBEChanged Special
"hi link MBEVisibleNormal SpecialKey
"hi link MBEVisibleChanged Title
"hi link MBEVisibleActiveNormal StatusLine
"hi link MBEVisibleActiveChanged Error

"----------------------------------------
" NERDTree
"----------------------------------------
" 隠しファイルの表示(キーコマンドでは「I」)
let g:NERDTreeShowHidden = 1
