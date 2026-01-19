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
set fencs=utf-8,gbk,gb2312,gb18030    " fileencodings
set pt=<F3>                   " pastetoggle
set mouse=a                   " mouse
set ff=unix                   " fileformat
set mmp=10240                 " maxmempattern

" Number
set nu                        " number
set rnu                       " relativenumber
autocmd InsertEnter * :set nornu
autocmd InsertLeave * :set rnu

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

" Turn backup off
set nobk                      " nobackup
set nowb                      " nowritebackup
set noswf                     " noswapfile

" Filetype
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
autocmd BufNewFile,BufReadPost * if &filetype == "" | setlocal filetype=text | endif

" Set tabstop shiftwidth expandtab listchars
autocmd FileType * set ts=2 | set sw=2 | set et | set lcs=tab:▒░ | set list
autocmd FileType go,make set noet | set nolist
autocmd FileType go,make,proto,markdown set ts=4 | set sw=4 | :syntax sync fromstart

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
autocmd Syntax * call matchadd('Todo',  '\W\zs\(TODO\|DONE\|BUG\)')

" Highlight
hi Search       cterm=reverse ctermfg=yellow ctermbg=black
hi Visual       cterm=reverse ctermfg=white ctermbg=black
hi QuickFixLine cterm=reverse

" Use tab to indent
nmap <tab> v>
nmap <s-tab> v<
vmap <tab> >gv
vmap <s-tab> <gv

" Autocompletion
set sb " splitbelow
set cot+=popuphidden " completeopt
autocmd FileType go inoremap <expr> <c-b> pumvisible() ? '<C-n>' : '<C-x><C-o>'

" Leader
let mapleader = "\<Space>"
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>

nnoremap <leader>z :read ! git log -8 --pretty=\%B<CR>

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

" =========================================================
set rtp+=~/.vim/bundle/Vundle.vim         " set the runtime path to include Vundle and initialize
call vundle#begin('~/.vim/bundle')        " Specify a directory for plugins: begin('~/some/path/here')

Plugin 'VundleVim/Vundle.vim'             " let Vundle manage Vundle, required
Plugin 'scrooloose/nerdtree'              " A tree explorer plugin for vim.
Plugin 'msanders/snipmate.vim'            " implements some of TextMate's snippets features in Vim.
Plugin 'ctrlpvim/ctrlp.vim'               " Fuzzy file, buffer, mru, tag, etc finder.
Plugin 'mhinz/vim-signify'                " Show a diff via Vim sign column.
Plugin 'instant-markdown/vim-instant-markdown' " Instant Markdown previews from VIm!
Plugin 'mzlogin/vim-markdown-toc'         " Generate table of contents for Markdown files
Plugin 'terryma/vim-expand-region'        " Select increasingly larger regions of text
Plugin 'easymotion/vim-easymotion'        " Vim motions on speed
Plugin 'mg979/vim-visual-multi'           " Multiple cursors plugin for vim/neovim
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
Plugin 'hotoo/pangu.vim'                  " Chinese copywriting guidelines for better written communication
Plugin 'github/copilot.vim'               " Neovim plugin for GitHub Copilot
Plugin 'madox2/vim-ai'                    " AI-powered code assistant for Vim

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
" Configuration: mg979/vim-visual-multi
let g:VM_theme = 'purplegray'
let g:VM_quit_after_leaving_insert_mode = 1
let g:VM_maps = {}
let g:VM_maps['Find Under'] = '<C-g>'
let g:VM_maps['Find Subword Under'] = '<C-g>'
let g:VM_maps['Skip Region'] = '<C-x>'
let g:VM_maps['Remove Region'] = '<C-e>'
let g:VM_maps['Exit'] = '<Esc><Esc><Esc><Esc>'
let g:VM_silent_exit = 1

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

hi goDiagnosticError cterm=reverse ctermfg=Red
hi goDiagnosticWarning cterm=reverse ctermfg=Brown

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
let g:instant_markdown_mermaid = 1

" =========================================================
" Configuration: mzlogin/vim-markdown-toc
au FileType markdown nmap <leader>o :GenTocGFM<cr>

" =========================================================
" Configuration: hotoo/pangu.vim
au FileType markdown,text nmap <leader>y :PanguAll<cr>

" =========================================================
" Configuration madox2/vim-ai
let g:vim_ai_token_file_path = '~/.config/vim-ai/ai.token'
let g:vim_ai_roles_config_file = '~/.config/vim-ai/roles.ini'
vmap ? :AIChat /wtf<cr>
nmap <leader>a :AIChat<cr>

function! s:get_go_context_with_hole(before, after) abort
  let lnum = line('.')

  let before_lines = getline(max([1, lnum - a:before]), lnum - 1)
  let after_lines  = getline(lnum, min([line('$'), lnum + a:after]))

  return {
  \ 'before': join(before_lines, "\n"),
  \ 'after':  join(after_lines, "\n")
  \ }
endfunction

function! s:go_hole_prompt(ctx, intent) abort
  let extra = empty(a:intent)
        \ ? ''
        \ : "\nAdditional intent:\n" . a:intent . "\n"

  return join([
  \ 'You are a Go code completion engine.',
  \ '',
  \ 'Rules:',
  \ '- You MUST fill in the missing code at <CURSOR>.',
  \ '- DO NOT repeat, remove, or modify any existing code.',
  \ '- The code before and after <CURSOR> must remain unchanged.',
  \ '- Output ONLY the code that belongs at <CURSOR> and DO NOT wrap it in markdown code block.',
  \ '- Keep it short and idiomatic Go.',
  \ '',
  \ extra,
  \ 'Code:',
  \ '```go',
  \ a:ctx.before,
  \ '<CURSOR>',
  \ a:ctx.after,
  \ '```',
  \ '',
  \ 'Fill in the code at <CURSOR>.'
  \ ], "\n")
endfunction

function! s:run_ai_completion(prompt) abort
  let curbuf = bufnr('%')

  execute 'AI ' . shellescape(a:prompt)

  let max_tries = 20
  let interval = 100

  for _ in range(max_tries)
    for buf in getbufinfo()
      if buf.name =~# 'AI'
        let lines = getbufline(buf.bufnr, 1, '$')
        execute 'buffer ' . curbuf
        return join(lines, "\n")
      endif
    endfor

    execute 'sleep ' . interval . 'm'
  endfor

  return ''
endfunction

function! s:go_ai_complete(intent) abort
  let ctx = s:get_go_context_with_hole(30, 10)
  let prompt = s:go_hole_prompt(ctx, a:intent)
  let result = s:run_ai_completion(prompt)

  if empty(result)
    echo "AI returned nothing"
    return
  endif

  call append(line('.') - 1, split(result, "\n"))
endfunction

command! -nargs=* AIGoComplete call s:go_ai_complete(<q-args>)
imap <Leader>s <esc>:AIGoComplete

" =========================================================
" Configuration github/copilot.vim
let g:copilot_filetypes = {
      \ '*': v:false,
      \ 'markdown': v:true,
      \ 'go': v:true,
      \ 'gitcommit': v:true,
      \ }
