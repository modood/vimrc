syntax on                     " syntax highlighing
filetype plugin indent on     " required

" Basic configuration
" set acd                     " autochdir
set nocp                      " nocompatible
set ru                        " ruler
set hls                       " hlsearch
set nowrap                    " nowrap
set ww=h,l                    " whichwrap
set enc=utf-8                 " encoding
set pt=<F3>                   " pastetoggle
set mouse=a                   " mouse
set ff=dos                    " fileformat

" Number
set nu                        " number
set rnu                       " relativenumber
autocmd InsertEnter * :set nornu
autocmd InsertLeave * :set rnu
function! NumberToggle()
  if(&relativenumber == 1)
    set nornu
  else
    set rnu
  endif
endfunc
nnoremap <C-c>c :call NumberToggle()<cr>

" http://stackoverflow.com/questions/13194428/is-better-way-to-zoom-windows-in-vim-than-zoomwin
" Zoom / Restore window.
function! s:ZoomToggle() abort
    if exists('t:zoomed') && t:zoomed
        execute t:zoom_winrestcmd
        let t:zoomed = 0
    else
        let t:zoom_winrestcmd = winrestcmd()
        resize
        vertical resize
        let t:zoomed = 1
    endif
endfunction
command! ZoomToggle call s:ZoomToggle()
nnoremap <silent> <C-c>z :ZoomToggle<CR>

" Cursor
"set cul                      " cursorline
"set cuc                      " cursorcolumn

" set t_ti= t_te=

" Folding
" type: manual, indent, expr, syntax, diff, marker
set foldenable
set foldmethod=indent
set foldlevel=99
nmap <C-c>fc za<cr>
nmap <C-c>ff :call ToggleFold()<cr>
let g:FoldMethod = 0
fun! ToggleFold()
    if g:FoldMethod == 0
        exe "normal! zM"
        let g:FoldMethod = 1
    else
        exe "normal! zR"
        let g:FoldMethod = 0
    endif
endfun

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
autocmd BufRead,BufNewFile *.vue set filetype=xhtml
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" Set tabstop shiftwidth expandtab
autocmd FileType *  set ts=2 | set sw=2 | set et
autocmd FileType go set ts=4 | set sw=4 | set noet

" Leave the cursor at center of window
nnoremap n nzz
map <C-d> <C-d>zz
map <C-u> <C-u>zz
map <C-o> <C-o>zz

" Smart way to move
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" New tab
nmap <C-t> :tabnew<CR>
nmap <C-c>n :tabnext<cr>

" Select, Copy and Paste, gvim is needed.
map <C-a> <Esc>ggvG$
vmap <C-c> "+y
imap <C-v> <Esc>"+p

" w!! to sudo & write a file
cmap w!! w !sudo tee >/dev/null %

" remap U to <C-r> for easier redo
nnoremap U <C-r>

" Highlight TODO, DONE, BUG, etc.
if has("autocmd")
  if v:version > 701
    autocmd Syntax * call matchadd('Todo',  '\W\zs\(TODO\|DONE\|BUG\)')
  endif
endif

" Use tab to indent
nmap <tab> V>
nmap <s-tab> V<
vmap <tab> >gv
vmap <s-tab> <gv

" Convenient ESC
inoremap jj <Esc>

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
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>qq :NERDTreeClose<CR>:wq<CR>

" turn to next or previous errors, after open location list
nmap <leader>j :lnext<CR>
nmap <leader>k :lprevious<CR>

" turn to next or previous errors, after open quickfix list
nmap <leader>l :cnext<CR>
nmap <leader>h :cprevious<CR>

" reset all error checking: Stop the highlighting, close locationlist, reset syntastic
noremap <esc><esc><esc><esc> :nohl<cr>:lclose<cr>:SyntasticReset<cr>

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
Plugin 'suan/vim-instant-markdown'        " Instant Markdown previews from VIm!
Plugin 'tpope/vim-markdown'               " Vim Markdown runtime files
Plugin 'terryma/vim-expand-region'        " Select increasingly larger regions of text
Plugin 'easymotion/vim-easymotion'        " Vim motions on speed
Plugin 'scrooloose/nerdcommenter'         " Vim plugin for intensely orgasmic commenting
Plugin 'terryma/vim-multiple-cursors'     " True Sublime Text style multiple selections for Vim
Plugin 'vim-scripts/ShowTrailingWhitespace' " Detect unwanted whitespace at the end of lines.
Plugin 'christoomey/vim-tmux-navigator'   " Seamless navigation between tmux panes and vim splits
Plugin 'mileszs/ack.vim'                  " Vim plugin for the Perl module / CLI script 'ack'
Plugin 'fatih/vim-go'                     " Go development plugin for Vim
Plugin 'majutsushi/tagbar'                " Vim plugin that displays tags in a window, ordered by scope
Plugin 'severin-lemaignan/vim-minimap'    " A Sublime-like minimap for VIM
Plugin 'Shougo/vimproc.vim'               " Interactive command execution in Vim
Plugin 'Shougo/vimshell.vim'              " Powerful shell implemented by vim
Plugin 'sebdah/vim-delve'                 " Vim integration for Delve

call vundle#end()                         " All of your Plugins must be added before this line

" =========================================================
" Configuration: nerdtree
" How can I open NERDTree automatically when vim starts up on opening a directory?
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
" How can I map a specific key or shortcut to open NERDTree?
map <C-n> :NERDTreeToggle<CR>
map <C-f> :NERDTreeFind<CR>

" =========================================================
" Configuration: ctrlp.vim
" switch to filename only search instead of full path
let g:ctrlp_by_filename = 1
" switch to show hidden files
let g:ctrlp_show_hidden = 1
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
" xnmap <leader>e :Errors<CR>
" check also when just write the file
let g:syntastic_check_on_wq = 1
let g:syntastic_check_on_open = 0
" automatically opened when errors are detected, and closed when none are detected
let g:syntastic_auto_loc_list = 1
" syntastic checker for javascript
let g:syntastic_javascript_checkers = ['eslint']
" don't put icons on the sign column (it hides the vcs status icons of signify)
let g:syntastic_enable_signs = 1
" custom icons (enable them if you use a patched font, and enable the previous setting)
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_style_error_symbol = '✗'
let g:syntastic_style_warning_symbol = '⚠'
" Error highlighting
highlight SyntasticError ctermbg=Red ctermfg=White
highlight SyntasticWarning ctermbg=Yellow ctermfg=Blue

" =========================================================
" Configuration: terryma/vim-expand-region
vmap v <Plug>(expand_region_expand)
vmap <s-v> <Plug>(expand_region_shrink)

" =========================================================
" Configuration: easymotion/vim-easymotion
" s{char} to move to {char}
map  s <Plug>(easymotion-bd-f)
nmap s <Plug>(easymotion-overwin-f)

" =========================================================
" Configuration: terryma/vim-multiple-cursors
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-g>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

" =========================================================
" Configuration: mileszs/ack.vim
" Just like |:Ack| but instead of the |quickfix| list,
" matches are placed in the current |location-list|.
nnoremap <C-c><C-c> :LAck!<Space>

" =========================================================
" Configuration: vim-go
" commands
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>d <Plug>(go-def)
" disable <C-t> https://github.com/fatih/vim-go/issues/1202
let g:go_def_mapping_enabled = 0
" auto |:GoMetaLinter| on save
let g:go_metalinter_autosave = 1
" [quickfix vs location list](https://github.com/fatih/vim-go/issues/696)
let g:go_list_type = 'locationlist'
" syntax-highlighting for Functions, Methods and Structs
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
" auto fmt on save
let g:go_fmt_autosave = 1
" Enable goimports to automatically insert import paths instead of gofmt
let g:go_fmt_command = "goimports"
" Use this option to define the command to be used for |:GoDef|. By default
" `guru` is being used as it covers all edge cases. But one might also use
" `godef` as it's faster. Current valid options are: `[guru, godef]` >
let g:go_def_mode = 'godef'

" =========================================================
" Configuration: majutsushi/tagbar
nmap <C-b> :TagbarToggle<CR>
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }

" =========================================================
" Configuration: severin-lemaignan/vim-minimap
let g:minimap_toggle='<C-c>mm'
" prevent the default bindings
let g:minimap_show='<Nop>'
let g:minimap_update='<Nop>'
let g:minimap_close='<Nop>'
