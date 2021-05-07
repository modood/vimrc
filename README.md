# vimrc
A shell script to deploy my vim configuration

## install
The installation will overwrite your `.vimrc` file, be sure to backup your existing vim configuration.

```
curl -L https://github.com/modood/vimrc/raw/master/install.sh | bash
```

## keyboard shortcuts overview

### Normal

| key | description | plugin |
|:----|:------------|:-------|
| `<esc><esc><esc><esc>` | reset all error checking: <br/>1.  stop the highlighting<br/>2.  close locationlist<br/>3.  reset syntastic | - |
| `<space><space><space><space>` | toggle reading mode | - |
| `:w!!` | sudo & write a file | - |
| `<v>` | expand region expand | vim-expand-region |
| `<s>` | s{char} to move to {char} | vim-easymotion |
| `<Z>` | toggle zoom or restore window | - |
| `<M>` | toggle rnu or nornu | - |

### Ctrl

| key | description | plugin |
|:----|:------------|:-------|
| `<C-q>` | Open or hide the floaterm window | vim-floaterm |
| `<C-w>hjkl` | moves between Vim viewports | - |
| `<C-e>` | Scroll window [count] lines downwards<br/>Cursor previous | -<br/>vim-multiple-cursors |
| `<C-r>` | Redo changes | - |
| `<C-t>` | New tab | - |
| `<C-y>` | Scroll window [count] lines upwards | - |
| `<C-u>` | Scroll window upwards | - |
| `<C-i>` | `<tab>` | **do not edit** |
| `<C-o>` | Jump back to the previous location | - |
| `<C-p>` | Open CtrlP | ctrlp.vim |
| `<C-a>` | Select all contents of the file | - |
| `<C-s>` | Tmux prefix key | tmux |
| `<C-d>` | Scroll window Downwards | - |
| `<C-f>` | Find the current file in the tree | nerdtree |
| `<C-g>` | Cursor next | vim-multiple-cursors |
| `<C-hjkl>` | moves between Vim viewports | vim and tmux |
| `<C-z>` | Suspend | - |
| `<C-x>` | Cursor skip | vim-multiple-cursors |
| `<C-c>` | [V] Copy selected text | gvim |
| `<C-v>` | [N] Switch to [VB] mode<br/>[I] Paste | -<br/>gvim |
| `<C-b>` | Toggle tagbar | tagbar |
| `<C-n>` | Toggle Terdtree | nerdtree |
| `<C-m>` | `<cr>` | **do not edit** |
| `<C-;>` | Show clipboard | Ubuntu |

### Leader

| key | description | plugin |
|:----|:------------|:-------|
| `<Leader>q` | Exit | - |
| `<Leader>w` | Write the current file | - |
| `<Leader>e`  | GoDiagnostics | vim-go |
| `<Leader>r` | Build and run current main package | vim-go |
| `<Leader>tr` | debug main package | vim-delve |
| `<Leader>tt` | debug non-main packages | vim-delve |
| `<Leader>tb` | toggle (add or remove) a breakpoint | vim-delve |
| `<Leader>tc` | clear all the breakpoints and tracepoints | vim-delve |
| `<Leader>tm`| enable / disable table mode | vim-table-mode |
| `<Leader>y` | Chinese copywriting guidelines for better written communication | hotoo/pangu.vim |
| `<Leader>u` | - | - |
| `<Leader>i` | implementing an interface | vim-go |
| `<Leader>o` | Show declarations for the current file<br/>Generate table of contents for markdown | vim-go<br/>vim-markdown-toc |
| `<Leader>p` | Show declarations for the current directory<br/>markdown preview | vim-go<br/>vim-instant-markdown |
| `<Leader>a` | - | - |
| `<Leader>s` | Show the call targets for the type under the cursor | vim-go |
| `<Leader>d` | Go to symbol/declaration | vim-go |
| `<Leader>f` | Shows identifiers that refer to the same object | vim-go |
| `<Leader>g` | A list of interfaces for the type that implements | vim-go |
| `<Leader>hl`  | Turn to previous/next of quickfix list | - |
| `<Leader>kj`  | Turn to previous/next of location list | - |
| `<Leader>-=`  | Resize the width of the current window | - |
| `<Leader>z`  | read git commit message | - |
| `<Leader>x`  | - | - |
| `<Leader>n` | GoRemoveTags and GoAddTags | vim-go |
| `[count]<leader>c<space>` | Toggles the comment state | nerdcommenter |
| `[count]<leader>cs` | Comments out the selected lines | nerdcommenter |
| `<Leader>v`  | GoFillStruct | vim-go |
| `<Leader>b`  | Git blame | vim-fugitive |
| `<Leader>n` | GoRemoveTags and GoAddTags | vim-go |
| `<Leader>m` | GoMetaLinter | vim-go |
| `<Leader>;` | Open Ack | ack.vim |

### Plugin: nerdtree

| key | description |
|:----|:------------|
| `?`   | Got help |
| `<I>` | Show hidden files |
| `<A>` | Zoom the nerdtree window |
| `yy`  | yak full path of current node |

### Plugin: ctrlp.vim

| key | description |
|:----|:------------|
| `<c-fb>` | Cycle between modes |
| `<c-d>`  | switch to filename only search instead of full path |
| `<c-r>`  | switch to regexp mode |
| `<c-jk>` | navigate the result list |
| `<c-t>`  | open the selected entry in a new tab |
| `<c-v>`  | open the selected entry in a new split |
| `<c-x>`  | open the selected entry in a new split |
| `<c-y>`  | create a new file and its parent directories |
| `<c-z>`  | mark/unmark multiple files and <c-o> to open them |
| `<F5>`   | Refresh the match window and purge the cache for the current directory |

## contributing
1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## license
this repo is released under the [MIT License](http://www.opensource.org/licenses/MIT).
