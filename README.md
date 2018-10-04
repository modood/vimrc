# vimrc
A shell script to deploy my vim configuration

## install
The installation will overwrite your `.vimrc` file, be sure to backup your existing vim configuration.

```
$ git clone https://github.com/modood/vimrc.git
$ cd vimrc
$ ./deploy.sh
```

## keyboard shortcuts overview

### Normal

| key | description | plugin |
|:----|:------------|:-------|
| `<esc><esc><esc><esc>` | reset all error checking: <br/>1.  stop the highlighting<br/>2.  close locationlist<br/>3.  reset syntastic | - |
| `:w!!` | sudo & write a file | - |
| `<v>` | expand region expand | vim-expand-region |
| `<s>` | s{char} to move to {char} | vim-easymotion |

### Ctrl

| key | description | plugin |
|:----|:------------|:-------|
| `<C-q>` | - | - |
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
| `<C-c>` | [N] Use as a prefix key<br/>[V] Copy selected text | -<br/>gvim |
| `<C-v>` | [N] Switch to [VB] mode<br/>[I] Paste | -<br/>gvim |
| `<C-b>` | Toggle tagbar | tagbar |
| `<C-n>` | Toggle Terdtree | nerdtree |
| `<C-m>` | `<cr>` | **do not edit** |
| `<C-;>` | Show clipboard | Ubuntu |

### Ctrl + c

| key | description | plugin |
|:----|:------------|:-------|
| `<C-c><C-c>` | Open Ack | ack.vim |
| `<C-c>c` | toggle rnu or nornu | - |
| `<C-c>z` | toggle zoom or restore window | - |
| `<C-c>ff` | toggle close or open all fold | - |
| `<C-c>fc` | toggle close or open a fold | - |
| `<C-c>db` | toggle (add or remove) a breakpoint | vim-delve |
| `<C-c>dc` | clear all the breakpoints and tracepoints | vim-delve |
| `<C-c>dt` | debug non-main packages | vim-delve |
| `<C-c>dd` | debug main package | vim-delve |
| `<C-c>n` | tabnext | - |
| `<C-c>mm` | toggle the minimap | vim-minimap |

### Leader

| key | description | plugin |
|:----|:------------|:-------|
| `<Leader>q` | Exit | - |
| `<Leader>qq` | Write the current file and exit vim | - |
| `<Leader>w` | Write the current file | - |
| `<Leader>e` | - | - |
| `<Leader>r` | Build and run current main package | vim-go |
| `<Leader>t` | Alternates between the implementation and test code | vim-go |
| `<Leader>tt`| Formatting existing content into a table | vim-table-mode |
| `<Leader>tm`| enable / disable table mode | vim-table-mode |
| `<Leader>yu` | - | - |
| `<Leader>i` | implementing an interface | vim-go |
| `<Leader>o` | Show declarations for the current file | vim-go |
| `<Leader>p` | Show declarations for the current directory<br/>markdown preview | vim-go<br/>vim-instant-markdown |
| `<Leader>a` | - | - |
| `<Leader>s` | Show A list of possible call targets | vim-go |
| `<Leader>d` | Go to symbol/declaration | vim-go |
| `<Leader>f` | Shows identifiers that refer to the same object | vim-go |
| `<Leader>g` | A list of interfaces for the type that implements | vim-go |
| `<Leader>hl`  | Turn to previous/next of quickfix list | - |
| `<Leader>kj`  | Turn to previous/next of location list | - |
| `<Leader>zx`  | - | - |
| `[count]<leader>c<space>` | Toggles the comment state | nerdcommenter |
| `[count]<leader>cs` | Comments out the selected lines | nerdcommenter |
| `<Leader>v`  | - | - |
| `<Leader>b`  | Git blame | vim-fugitive |
| `<Leader>nm` | - | - |

### Plugin: nerdtree

| key | description |
|:----|:------------|
| `?`   | Got help |
| `<I>` | Show hidden files |
| `<A>` | Zoom the nerdtree window |

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
