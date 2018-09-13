" .vimrc

" set the runtime path to include Vundle and initialize
" set rtp+=~/.vim/bundle/Vundle.vim
" call vundle#begin()

set encoding=utf-8 fileencodings=
syntax on

" let Vundle manage Vundle, required
" Plugin 'VundleVim/Vundle.vim'

" plungin vim-sensible
" Plugin 'tpope/vim-sensible'


" All of your Plugins must be added before the following line
" call vundle#end()            " required
" filetype plugin indent on    " required for plugins

" configure tab to be 2 spaces
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

set number
set mouse=a

" to automatically include "#!/bin/sh" in .sh files
autocmd BufNewFile *.sh norm i#!/bin/sh

" to automatically include "#include <stdio.h> and a empty main with return 0" for .c files
autocmd BufNewFile *c norm i#include <stdio.h>\nint main(void)\n{\nreturn 0;\n}\n

"Use TAB to complete when typing words, else inserts TABs as usual.
"Uses dictionary and source files to find matching words to complete.
function! Tab_Or_Complete()
  if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
    return "\<C-N>"
  else
    return "\<Tab>"
  endif
endfunction
:inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>
:set dictionary="/usr/dict/words"

" to respect EPITA coding style
set cc=80
set list listchars=tab:»·,trail:·
