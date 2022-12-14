rem vimŠÖ˜A
mklink %HOMEPATH%"\.vimrc" %HOMEPATH%"\dotfiles\.vimrc"
mklink %HOMEPATH%"\.gvimrc" %HOMEPATH%"\dotfiles\.gvimrc"
mklink %HOMEPATH%"\.NERDTreeBookmarks" %HOMEPATH%"\dotfiles\.vim\.NERDTreeBookmarks"
mklink /D %HOMEPATH%"\.vim" %HOMEPATH%"\dotfiles\.vim"

rem git,SSH
mklink %HOMEPATH%"\.gitconfig" %HOMEPATH%"\dotfiles\.gitconfig"
mklink /D %HOMEPATH%"\.ssh" %HOMEPATH%"\dotfiles\.ssh"

rem bash
mklink %HOMEPATH%"\.bashrc" %HOMEPATH%"\dotfiles\.bashrc"
