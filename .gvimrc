"==========================================
" �\���ݒ�
"==========================================
"----------------------------------------
" �J���[�X�L�[��
"----------------------------------------
" colorscheme desert
" colorscheme molokai
colorscheme badwolf
syntax on
set t_Co=256

"----------------------------------------
" �t�H���g
"----------------------------------------
set guifont=Consolas:h9,Lucida_Console:h9:w5
set guifontwide=MS_Gothic:h9
set encoding=utf-8
set fileencodings=utf-8,euc-jp,sjis
set linespace=0

" (���j���[���������΍�)
source $VIMRUNTIME/delmenu.vim
set langmenu=ja_jp.utf-8
source $VIMRUNTIME/menu.vim

"----------------------------------------
" ���ʂɔw�i���߂���
"----------------------------------------
" focus����ƕs������Z���Afocus���O���Ɣ���
autocmd FocusGained * set transparency=245
autocmd FocusLost * set transparency=210

"----------------------------------------
" Tab�A�s���̔��p�X�y�[�X���̐F�w��
"----------------------------------------
highlight SpecialKey guifg=LightRed

"----------------------------------------
" �J�����g�s���n�C���C�g
"----------------------------------------
set cursorline
highlight CursorLine  guifg=NONE guibg=#282828
"highlight CursorLine term=reverse cterm=reverse

set cursorcolumn
highlight CursorColumn guibg=#282828


