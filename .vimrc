set nocompatible              " be iMproved, required
filetype off                  " required
syntax on                     " syntax highlighing

" basic configuration
" about: http://edyfox.codecarver.org/html/_vimrc_for_beginners.html
set nocp
set ru
set nu
set hls
set whichwrap=h,l
set encoding=utf-8
set nowrap
set et
set sw=2
set ts=2
set nobackup

set statusline=%F%m%r%h%w\ \[%v,%l]\ \[%p%%]\%{strftime(\"\ %Y-%m-%d\ %H:%M\")}
set laststatus=2

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Keep Plugin commands between vundle#begin/end.
Plugin 'pangloss/vim-javascript'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

" Put your non-Plugin stuff after this line
