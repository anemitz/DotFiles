set nocompatible
syntax on
"set guifont=-misc-fixed-medium-r-semicondensed-*-*-120-*-*-c-*-koi8-r
set guifont=Monospace\ 8
set ruler
set backspace=indent,eol,start
set showcmd
set incsearch
set hlsearch
set laststatus=2
set autoread
set wrap
set showcmd
set suffixes=.bak,~,.swp,.o
"set showbreak=+
augroup cprog
"autocmd BufRead *.c,*.cpp,*.h,*.rc,*.pc,*.m set cindent et tabstop=2 shiftwidth=2
autocmd BufRead,BufNewFile *.hs,*.sql,*.rc,*.pc,*.py,*.css,*.js,*.html,*.php set tabstop=4 shiftwidth=4 expandtab
autocmd BufRead,BufNewFile *.jomp,*.java,*.c,*.cc,*.cpp,*.hh,*.h,*.m,*.mm set cindent tabstop=4 shiftwidth=4 expandtab
autocmd BufRead,BufNewFile *.jomp set syntax=java
augroup END
"set statusline=%<%f\ %h%m%r%=off=%-5o\ dec=%-3b\ hex=%-4(0x%B%)\ pos=%3P
"set statusline=%<%f\ %h%m%r%=c=%c%V\ l=%l/%L\ o=%o\ d=%b\ x=0x%B\ %P
set statusline=%<%f\ %h%m%r%=%l/%L,%c%V%12([%3b\ 0x%2B]%)%5P
highlight statusLine term=bold cterm=bold ctermfg=white ctermbg=red
highlight statusLineNC ctermfg=black ctermbg=grey  cterm=NONE
"map ^X :set noautoindent nocindent<RETURN>
set fileencoding=utf8
set fileencodings=utf8
"set encoding=utf8
set termencoding=latin1

" from http://fugal.net/vim/colors/
"colors desert
set background=dark
set mouse=a
set ttymouse=xterm
set nocindent noautoindent

augroup vala
au!
au! BufRead,BufNewFile *.vala set filetype=vala cindent tabstop=4 shiftwidth=4 expandtab
au! Syntax vala source /usr/share/vim/vim70/syntax/cs.vim
augroup END

set go-=T
"set transp=8

set backup
set backupdir=~/.vim/backup
set directory=~/.vim/tmp

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Open NERDTree by default
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"au VimEnter * NERDTreeFind
"autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p

autocmd WinEnter * call s:CloseIfOnlyNerdTreeLeft()

" Close all open buffers on entering a window if the only
" buffer that's left is the NERDTree buffer
function! s:CloseIfOnlyNerdTreeLeft()
  if exists("t:NERDTreeBufName")
    if bufwinnr(t:NERDTreeBufName) != -1
      if winnr("$") == 1
        q
      endif
    endif
  endif
endfunction

"""""""""""""""
" super tab completions 
"""""""""""""""
let g:SuperTabDefaultCompletionType = "context"
