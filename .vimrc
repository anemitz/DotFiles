set nocompatible
syntax enable
set encoding=utf-8
set showcmd                     " display incomplete commands

"" Whitespace
set nowrap                      " don't wrap lines
set tabstop=2 shiftwidth=2      " a tab is two spaces
set expandtab                   " use spaces, not tabs
set backspace=indent,eol,start  " backspace through everything in insert mode

"" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter

set background=light
set mouse=a
set ttymouse=xterm2
set nocindent noautoindent

set guifont=Monospace\ 8
set ruler
set laststatus=2
set autoread
set suffixes=.bak,~,.swp,.o

set noswapfile
set backup
set backupdir=~/.vim/backup
set directory=~/.vim/tmp

augroup cprog
autocmd BufRead,BufNewFile *.hs,*.sql,*.rc,*.pc,*.py,*.css,*.less,*.js,*.html,*.php set tabstop=4 shiftwidth=4 expandtab
autocmd BufRead,BufNewFile *.jomp,*.java,*.c,*.cc,*.cpp,*.hh,*.h,*.m,*.mm set cindent tabstop=4 shiftwidth=4 expandtab
autocmd BufRead,BufNewFile *.jomp set syntax=java
augroup END

set statusline=%<%f\ %h%m%r%=%l/%L,%c%V%12([%3b\ 0x%2B]%)%5P
highlight statusLine term=bold cterm=bold ctermfg=white ctermbg=red
highlight statusLineNC ctermfg=black ctermbg=grey  cterm=NONE

augroup vala
au!
au! BufRead,BufNewFile *.vala set filetype=vala cindent tabstop=4 shiftwidth=4 expandtab
au! Syntax vala source /usr/share/vim/vim70/syntax/cs.vim
augroup END


"""""""""""""""
" super tab completions 
"""""""""""""""
let g:SuperTabDefaultCompletionType = "context"
set wildmode=longest,list,full
set wildmenu


