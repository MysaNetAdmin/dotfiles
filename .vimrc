" .vimrc
set encoding=utf-8 fileencodings=
syntax on

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/plugged
call plug#begin()

" plugin manager
Plug 'VundleVim/Vundle.vim'

" plungin vim-sensible
Plug 'tpope/vim-sensible'

" nerdtree plugin to change and open files inside vim
Plug 'scrooloose/nerdtree'

" deus colorscheme plugin
Plug 'ajmwagar/vim-deus'

" autocompletion plugin
Plug 'Valloric/YouCompleteMe'

" syntax checking hacks plugin
" Plug 'vim-syntastic/syntastic'

" status bar plugin
Plug 'vim-airline/vim-airline'

" pairs plugin
Plug 'jiangmiao/auto-pairs'

" snippet plugin
Plug 'SirVer/ultisnips'

" basic snippets
Plug 'honza/vim-snippets'

" trailing whitespaces plugin
Plug 'ntpeters/vim-better-whitespace'

" All of your Plugins must be added before the following line
call plug#end()            " required

colorscheme deus

filetype plugin indent on

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-tab>"

" configure tab to be 4 spaces
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

set smartindent
set autoindent
set cindent
set shiftround
set copyindent

set number
set mouse=a

set undofile
set undodir=~/.vim/undodir

" Select all text
nmap <C-a> ggVG

" normal copy/paste
vmap <C-c> y<Esc>i
vmap <C-x> d<Esc>i
imap <C-v> <Esc>pi
imap <C-y> <Esc>ddi
map <C-z> <Esc>
imap <C-z> <Esc>ui

" Automatically add "#!/bin/sh" in shell scripts
autocmd BufNewFile *.sh call append(0, "#!/bin/sh")

" Automatically add default libs for C files
autocmd BufNewFile *.c call append(0,"#include <stdio.h>")
autocmd BufNewFile *.c call append(1,"#include <stdlib.h>")

" Automatically add empty header for header files
autocmd BufNewFile *.h call append(0, "#pragma once")

" to respect EPITA coding style
set cc=81
set list listchars=tab:»·,trail:·
let g:better_whitespace_enabled=1
let g:better_whitespace_verbosity=1
let g:show_spaces_that_precede_tabs=1
highlight ExtraWhitespace ctermbg=red
