syntax on                     " syntax highlighing
filetype plugin indent on     " required

" Basic configuration
set nocp                      " nocompatible
set ru                        " ruler
set nu                        " number
set rnu                       " relativenumber
set acd                       " autochdir
set hls                       " hlsearch
set nowrap                    " nowrap
set ww=h,l                    " whichwrap
set enc=utf-8                 " encoding
set pt=<F3>                   " pastetoggle
set mouse=a                   " mouse

" Cursor
"set cul                      " cursorline
"set cuc                      " cursorcolumn

" Show a tab
"set list lcs=tab:——          " listchars

" Turn backup off
set nobk                      " nobackup
set nowb                      " nowritebackup
set noswf                     " noswapfile

" Statusline
set ls=2                      " laststatus
set stl=%F%m%r%h%w\ \[%v,%l]\ \[%p%%]\%{strftime(\"\ %Y-%m-%d\ %H:%M\")}  "statusline

" Filetype
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" Set tabstop shiftwidth expandtab
autocmd FileType *  set ts=2 | set sw=2 | set et

" Smart way to move
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" New tab
map <C-t> :tabnew<CR>

" Select, Copy and Paste
map <C-a> <Esc>ggvG
vmap <C-c> "+y
map <C-v> <Esc>o<Esc>"+P
imap <C-v> <Esc>"+p

" Use tab to indent
nmap <tab> V>
nmap <s-tab> V<
vmap <tab> >gv
vmap <s-tab> <gv

" Automatic double quotes,parenthesis etc
inoremap ( ()<ESC>i
inoremap [ []<ESC>i
inoremap { {}<ESC>i
inoremap < <><ESC>i
inoremap " ""<ESC>i
inoremap ' ''<ESC>i
inoremap （ （）<ESC>i
inoremap 【 【】<ESC>i

" Leader
let mapleader = "\<Space>"
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>

" =========================================================
set rtp+=~/.vim/bundle/Vundle.vim         " set the runtime path to include Vundle and initialize
call vundle#begin('~/.vim/bundle')        " Specify a directory for plugins: begin('~/some/path/here')

Plugin 'VundleVim/Vundle.vim'             " let Vundle manage Vundle, required
Plugin 'pangloss/vim-javascript'          " Vastly improved Javascript indentation and syntax support in Vim.
Plugin 'scrooloose/nerdtree'              " A tree explorer plugin for vim.
Plugin 'msanders/snipmate.vim'            " implements some of TextMate's snippets features in Vim.
Plugin 'scrooloose/syntastic'             " Syntax checking hacks for vim.
Plugin 'ctrlpvim/ctrlp.vim'               " Fuzzy file, buffer, mru, tag, etc finder.
Plugin 'Shougo/neocomplcache.vim'         " Ultimate auto-completion system for Vim.
Plugin 'mhinz/vim-signify'                " Show a diff via Vim sign column.
Plugin 'editorconfig/editorconfig-vim'    " EditorConfig plugin for Vim.
Plugin 'suan/vim-instant-markdown'        " Instant Markdown previews from VIm!
Plugin 'tpope/vim-markdown'               " Vim Markdown runtime files
Plugin 'terryma/vim-expand-region'        " Select increasingly larger regions of text
Plugin 'easymotion/vim-easymotion'        " Vim motions on speed
Plugin 'scrooloose/nerdcommenter'         " Vim plugin for intensely orgasmic commenting

call vundle#end()                         " All of your Plugins must be added before this line

" =========================================================
" Configuration: nerdtree
" How can I open NERDTree automatically when vim starts up on opening a directory?
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
" How can I map a specific key or shortcut to open NERDTree?
map <C-n> :NERDTreeToggle<CR>
map <C-m> :NERDTreeFind<CR>

" =========================================================
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

" =========================================================
" Configuration: neocomplcache.vim
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1

" =========================================================
" Configuration: syntastic
" show list of errors and warnings on the current file
nmap <leader>e :Errors<CR>
" turn to next or previous errors, after open errors list
nmap <leader>n :lnext<CR>
nmap <leader>p :lprevious<CR>
" check also when just opened the file
let g:syntastic_check_on_open = 0
" syntastic checker for javascript
let g:syntastic_javascript_checkers = ['eslint']
" don't put icons on the sign column (it hides the vcs status icons of signify)
let g:syntastic_enable_signs = 1
" custom icons (enable them if you use a patched font, and enable the previous setting)
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_style_error_symbol = '✗'
let g:syntastic_style_warning_symbol = '⚠'

" =========================================================
" Configuration: terryma/vim-expand-region
vmap v <Plug>(expand_region_expand)
vmap <s-v> <Plug>(expand_region_shrink)

" =========================================================
" Configuration: easymotion/vim-easymotion
" s{char} to move to {char}
map  s <Plug>(easymotion-bd-f)
nmap s <Plug>(easymotion-overwin-f)
