set nocompatible              " be iMproved, required
filetype off                  " required
syntax on                     " syntax highlighing

" Basic configuration
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

" Turn backup off
set nobackup
set nowb
set noswapfile

" Statusline
set statusline=%F%m%r%h%w\ \[%v,%l]\ \[%p%%]\%{strftime(\"\ %Y-%m-%d\ %H:%M\")}
set laststatus=2

" Smart way to move
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Automatic double quotes,parenthesis etc
inoremap ( ()<ESC>i
inoremap [ []<ESC>i
inoremap { {}<ESC>i
inoremap < <><ESC>i
inoremap " ""<ESC>i
inoremap ' ''<ESC>i

" Filetype
autocmd BufRead,BufNewFile *.vue set filetype=html

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Keep Plugin commands between vundle#begin/end.
Plugin 'pangloss/vim-javascript'
Plugin 'scrooloose/nerdtree'
Plugin 'msanders/snipmate.vim'
Plugin 'ctrlpvim/ctrlp.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

" Put your non-Plugin stuff after this line

" Configuration: nerdtree
" How can I open a NERDTree automatically when vim starts up?
autocmd vimenter * NERDTree
" How can I map a specific key or shortcut to open NERDTree?
map <C-n> :NERDTreeToggle<CR>

" Configuration: ctrlp.vim
" switch to filename only search instead of full path
let g:ctrlp_by_filename = 1
" switch to regexp mode.
let g:ctrlp_regexp = 0
" set working path
let g:ctrlp_working_path_mode = 'r'
" exclude files and directories
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.git|node_modules|logs)$',
  \ 'file': '\v\.(log|swp|zip|png|jpg|ico)$',
  \ }
