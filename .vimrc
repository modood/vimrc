syntax on                     " syntax highlighing
filetype plugin indent on     " required

" Python only
au BufNewFile,BufRead *.py set tabstop=4 softtabstop=4 shiftwidth=4 expandtab smarttab autoindent

" Basic configuration
" set acd                     " autochdir
set nocp                      " nocompatible
set ru                        " ruler
set hls                       " hlsearch
set nowrap                    " nowrap
set ww=h,l                    " whichwrap
set enc=utf-8                 " encoding
set fencs=utf-8,gbk,gb2312,gb18030    " fileencodings
set pt=<F3>                   " pastetoggle
set mouse=a                   " mouse
set ff=dos                    " fileformat
set mmp=10240                 " maxmempattern

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
nnoremap M :call NumberToggle()<cr>

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
nnoremap <silent> Z :ZoomToggle<CR>

" Cursor
"set cul                      " cursorline
"set cuc                      " cursorcolumn

" The screen is not cleared when your exit
" set t_ti= t_te=

" Turn backup off
set nobk                      " nobackup
set nowb                      " nowritebackup
set noswf                     " noswapfile

" Filetype
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
autocmd BufNewFile,BufReadPost * if &filetype == "" | setlocal filetype=text | endif

" Set tabstop shiftwidth expandtab listchars
autocmd FileType * set ts=2 | set sw=2 | set et | set lcs=tab:▒░ | set list | call s:UpdateReadingMode()
autocmd FileType go,make set noet | set nolist
autocmd FileType go,make,proto,markdown set ts=4 | set sw=4

" Leave the cursor at center of window
nmap n nzz
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

" Select, Copy and Paste, gvim is needed.
map <C-a> <Esc>ggvG$
vmap <C-c> "+y
imap <C-v> <Esc>"+p

" w!! to sudo & write a file
cmap w!! w !sudo tee >/dev/null %

" Highlight TODO, DONE, BUG, etc.
if has("autocmd")
  if v:version > 701
    autocmd Syntax * call matchadd('Todo',  '\W\zs\(TODO\|DONE\|BUG\)')
  endif
endif

" Use tab to indent
nmap <tab> v>
nmap <s-tab> v<
vmap <tab> >gv
vmap <s-tab> <gv

" Autocompletion
set sb " splitbelow
set cot=longest,menuone " completeopt
autocmd FileType go inoremap <expr> <tab> pumvisible() ? '<C-n>' : '<C-x><C-o>'
autocmd FileType go inoremap <expr> <s-tab> pumvisible() ? '<C-p>' : '<C-x><C-o>'

" Leader
let mapleader = "\<Space>"
nnoremap <leader>w :w<CR>
nnoremap <leader>q :FloatermKill<CR>:q<CR>

nnoremap <leader>z :read ! git log -3 --pretty=\%B<CR>

" turn to next or previous errors, after open location list
nmap <leader>j :lnext<CR>
nmap <leader>k :lprevious<CR>

" turn to next or previous errors, after open quickfix list
nmap <leader>l :cnext<CR>
nmap <leader>h :cprevious<CR>
nmap <leader>- :vertical resize -2<CR>
nmap <leader>= :vertical resize +2<CR>

" reset all error checking: Stop the highlighting, close locationlist
noremap <esc><esc><esc><esc> :nohl<cr>:lclose<cr>

" reading mode
function! s:UpdateReadingMode()
    if exists('t:reading') && t:reading
        set nolist
    else
        set list
    endif
endfunc
function! s:ToggleReadingMode()
    if exists('t:reading') && t:reading
        let t:reading = 0
    else
        let t:reading = 1
    endif
    call s:UpdateReadingMode()
endfunc
command! ToggleReadingMode call s:ToggleReadingMode()
noremap <space><space><space><space> :ToggleReadingMode<CR>

" =========================================================
set rtp+=~/.vim/bundle/Vundle.vim         " set the runtime path to include Vundle and initialize
call vundle#begin('~/.vim/bundle')        " Specify a directory for plugins: begin('~/some/path/here')

Plugin 'VundleVim/Vundle.vim'             " let Vundle manage Vundle, required
Plugin 'scrooloose/nerdtree'              " A tree explorer plugin for vim.
Plugin 'msanders/snipmate.vim'            " implements some of TextMate's snippets features in Vim.
Plugin 'ctrlpvim/ctrlp.vim'               " Fuzzy file, buffer, mru, tag, etc finder.
Plugin 'mhinz/vim-signify'                " Show a diff via Vim sign column.
Plugin 'suan/vim-instant-markdown'        " Instant Markdown previews from VIm!
Plugin 'mzlogin/vim-markdown-toc'         " Generate table of contents for Markdown files
Plugin 'terryma/vim-expand-region'        " Select increasingly larger regions of text
Plugin 'easymotion/vim-easymotion'        " Vim motions on speed
Plugin 'scrooloose/nerdcommenter'         " Vim plugin for intensely orgasmic commenting
Plugin 'terryma/vim-multiple-cursors'     " True Sublime Text style multiple selections for Vim
Plugin 'vim-scripts/ShowTrailingWhitespace' " Detect unwanted whitespace at the end of lines.
Plugin 'christoomey/vim-tmux-navigator'   " Seamless navigation between tmux panes and vim splits
Plugin 'mileszs/ack.vim'                  " Vim plugin for the Perl module / CLI script 'ack'
Plugin 'fatih/vim-go'                     " Go development plugin for Vim
Plugin 'majutsushi/tagbar'                " Vim plugin that displays tags in a window, ordered by scope
Plugin 'Shougo/vimproc.vim'               " Interactive command execution in Vim
Plugin 'Shougo/vimshell.vim'              " Powerful shell implemented by vim
Plugin 'sebdah/vim-delve'                 " Vim integration for Delve
Plugin 'tpope/vim-fugitive'               " A Git wrapper
Plugin 'vim-airline/vim-airline'          " lean & mean status/tabline for vim that's light as air
Plugin 'vim-airline/vim-airline-themes'   " A collection of themes for vim-airline
Plugin 'dhruvasagar/vim-table-mode'       " VIM Table Mode for instant table creation
Plugin 'rhysd/clever-f.vim'               " Extended f, F, t and T key mappings for Vim
Plugin 'voldikss/vim-floaterm'            " Terminal manager for (neo)vim
Plugin 'ivalkeen/vim-ctrlp-tjump'         " CtrlP extension for fuzzy-search in tag matches (:tjump replacement).
Plugin 'pangloss/vim-javascript'          " JavaScript bundle for vim, this bundle provides syntax highlighting and improved indentation.
Plugin 'vim-python/python-syntax'         " Python syntax highlighting

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
let g:multi_cursor_exit_from_insert_mode=1
let g:multi_cursor_exit_from_visual_mode=1
let g:multi_cursor_next_key='<C-g>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_prev_key='<C-e>'
let g:multi_cursor_quit_key='<Esc>'

" =========================================================
" Configuration: vim-scripts/ShowTrailingWhitespace
command! -bar ShowTrailingWhitespaceOn  call ShowTrailingWhitespace#Set(1,1)
command! -bar ShowTrailingWhitespaceOff call ShowTrailingWhitespace#Set(0,1)

" =========================================================
" Configuration: mileszs/ack.vim
" Just like |:Ack| but instead of the |quickfix| list,
" matches are placed in the current |location-list|.
nnoremap <Leader>; :LAck!<Space>

" =========================================================
" Configuration: vim-go
" commands
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>s <Plug>(go-callees)
au FileType go nmap <leader>d <Plug>(go-def)
au FileType go nmap <leader>f <Plug>(go-referrers)
au FileType go nmap <leader>g <Plug>(go-implements)
au FileType go nmap <leader>m <Plug>(go-metalinter)
au FileType go nmap <leader>i :GoImpl<cr>
au FileType go nmap <leader>o :GoDecls<cr>
au FileType go nmap <leader>p :GoDeclsDir<cr>
au FileType go nmap <leader>v :GoFillStruct<cr>
au FileType go nmap <leader>e :GoDiagnostics!<cr>
au FileType go nmap <leader>n :GoRemoveTags<CR>:GoAddTags json<CR>

" disable <C-t> https://github.com/fatih/vim-go/issues/1202
let g:go_def_mapping_enabled = 0

" Specifies the `gopls` diagnostics level. Valid values are 0, 1, and 2. 0
" ignores `gopls` diagnostics, 1 is for errors only, and 2 is for errors and
" warnings. By default it is 0.
let g:go_diagnostics_level = 2

" auto |:GoMetaLinter| on save
let g:go_metalinter_autosave = 0

" the command to be executed when |:GoMetaLinter| is called
let g:go_metalinter_command = "golangci-lint"
" Specifies the enabled linters for auto |:GoMetaLinter| on save. By
" default it's using `vet` and `golint`.
let g:go_metalinter_autosave_enabled = ['unconvert', 'megacheck', 'structcheck', 'gas', 'dupl', 'misspell', 'unparam', 'varcheck', 'typecheck', 'ineffassign', 'varcheck', 'gochecknoinits', 'gocritic', 'gofmt', 'gofumpt', 'goimports' ]
" Specifies the linters to enable for the |:GoMetaLinter| command. By default
" it's using `vet`, `golint` and `errcheck`.
let g:go_metalinter_enabled = ['unconvert', 'megacheck', 'structcheck', 'gas', 'dupl', 'misspell', 'unparam', 'varcheck', 'typecheck', 'ineffassign', 'varcheck', 'gochecknoinits', 'gocritic', 'gofmt', 'gofumpt', 'goimports' ]
" Sets go_guru_scope to the entire workspace
let g:go_guru_scope = []

" [quickfix vs location list](https://github.com/fatih/vim-go/issues/696)
let g:go_list_type = 'locationlist'
" syntax-highlighting for Functions, Methods and Structs
let g:go_highlight_function_calls = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_variable_assignments = 1
let g:go_highlight_format_strings = 1

" auto fmt on save
let g:go_fmt_autosave = 1
" Enable goimports to automatically insert import paths instead of gofmt
let g:go_fmt_command = "goimports"
" Use this option to define the command to be used for |:GoDef|. By default
" `guru` is being used as it covers all edge cases. But one might also use
" `godef` as it's faster. Current valid options are: `[guru, godef]` >
let g:go_def_mode = 'gopls'

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

let g:tagbar_type_markdown = {
        \ 'ctagstype' : 'markdown',
        \ 'kinds' : [
                \ 'h:headings',
        \ ],
    \ 'sort' : 0
\ }

" =========================================================
" Configuration: Shougo/vimshell.vim
" disable some default keys
autocmd FileType vimshell call s:on_vimshell()
function! s:on_vimshell()
  unmap <buffer> q
  unmap <buffer> <C-l>
  unmap <buffer> <C-n>
endfunction

" =========================================================
" Configuration: sebdah/vim-delve
nmap <Leader>tb :DlvToggleBreakpoint<cr>
nmap <Leader>tc :DlvClearAll<cr>
nmap <Leader>tt :DlvTest<cr>
nmap <Leader>tr :DlvDebug --<space>

" =========================================================
" Configuration: tpope/vim-fugitive
nmap <leader>b :Git blame<CR>

" =========================================================
" Configuration: vim-airline/vim-airline-themes
let g:airline_theme='term'

" =========================================================
" Configuration: dhruvasagar/vim-table-mode
let g:table_mode_corner='|'
let g:table_mode_disable_tableize_mappings = 1

" =========================================================
" Configuration: suan/vim-instant-markdown
let g:instant_markdown_autostart = 0
au FileType markdown nmap <leader>p :InstantMarkdownPreview<cr>

" =========================================================
" Configuration: mzlogin/vim-markdown-toc
au FileType markdown nmap <leader>o :GenTocGFM<cr>

" =========================================================
" Configuration: hotoo/pangu.vim
au FileType markdown nmap <leader>y :Pangu<cr>

" =========================================================
" Configuration floaterm
nnoremap <C-q> :silent! FloatermToggle<CR>
tnoremap <C-q> <C-\><C-n>:FloatermToggle<CR>

" =========================================================
" Configuration ivalkeen/vim-ctrlp-tjump
" python jump to definition
command! Stjump execute 'stjump' expand('<cword>')
au FileType python nmap <leader>m :!ctags --languages=Python -R -f ./tags $(pipenv --venv) .<CR>
au FileType python nmap <leader>s :Stjump<CR>
au FileType python nmap <leader>d :CtrlPtjump<CR>

