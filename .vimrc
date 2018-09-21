" .vimrc

set encoding=utf-8 fileencodings=
syntax on

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" plugin manager
Plugin 'VundleVim/Vundle.vim'

" plungin vim-sensible
Plugin 'tpope/vim-sensible'

" nerdtree plugin to change and open files inside vim
Plugin 'scrooloose/nerdtree'

" deus colorscheme plugin
Plugin 'ajmwagar/vim-deus'

" autocompletion plugin
Plugin 'Valloric/YouCompleteMe'

" All of your Plugins must be added before the following line
call vundle#end()            " required

colorscheme deus

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

" Automatically add "#!/bin/sh" in shell scripts
autocmd BufNewFile *.sh norm i#!/bin/sh

" Automatically add default libs for C files
autocmd BufNewFile *.c call append(0,"#include <stdio.h>")
autocmd BufNewFile *.c call append(1,"#include <stdlib.h>")

" Automatically add empty header for header files
autocmd BufNewFile *.h call append(0, "# ifndef")
autocmd BufNewFile *.h call append(1, "# define")
autocmd BufNewFile *.h call append(3, "# endif /*   */")

" to respect EPITA coding style
set list listchars=tab:»·,trail:·
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
highlight MaxLength ctermbg=red guibg=red
2mat MaxLength /\%81v./
