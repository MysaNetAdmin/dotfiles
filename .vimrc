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

filetype plugin indent on

" configure tab to be 2 spaces
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

set smartindent
set autoindent
set cindent
set shiftround
set copyindent

set number
set mouse=a

" Select all text
nmap <C-a> ggVG

" normal copy/paste
vmap <C-c> y<Esc>i
vmap <C-x> d<Esc>i
imap <C-v> <Esc>pi
imap <C-y> <Esc>ddi
map <C-z> <Esc>
imap <C-z> <Esc>ui

" Automatically include "#!/bin/sh" in .sh files
autocmd BufNewFile *.sh norm i#!/bin/sh

" Automatically include default libs and main for .c files
autocmd BufNewFile *c call append(0,"#include <stdio.h>")
autocmd BufNewFile *c call append(1,"#include <stdlib.h>")
autocmd BufNewFile *c call append(2,"")
autocmd BufNewFile *c call append(4,"int main(int argc, char *argv[])")
autocmd BufNewFile *c call append(5,"{")
autocmd BufNewFile *c call append(6,"  return 0;")
autocmd BufNewFile *c call append(7,"}")


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
set list listchars=tab:»·,trail:·
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
highlight MaxLength ctermbg=red guibg=red
2mat MaxLength /\%81v./
