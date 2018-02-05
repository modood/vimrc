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

| key | description | plugin |
|:----|:------------|:-------|
| `<C-q>` | - | - |
| `<C-w>hjkl` | moves between Vim viewports | - |
| `<C-e>` | Scroll window [count] lines downwards | - |
| `<C-r>` | Redo changes | - |
| `<C-t>` | New tab | - |
| `<C-y>` | Scroll window [count] lines upwards | - |
| `<C-u>` | Scroll window upwards | - |
| `<C-i>` | - | - |
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
| `<C-c>` | -<br/>[VISUAL] Copy selected text | -<br/>gvim |
| `<C-v>` | Switch to [VISUAL BLOCK] mode<br/>[INSERT] Paste | -<br/>gvim |
| `<C-b>` | Toggle tagbar | tagbar |
| `<C-n>` | Toggle Terdtree | nerdtree |
| `<C-m>` | Jump to the location of error | syntastic |
| `<C-;>` | Show clipboard |

| key | description | plugin |
|:----|:------------|:-------|
| `<Leader>q` | Exit | - |
| `<Leader>qq` | Write the current file and exit vim | - |
| `<Leader>w` | Write the current file | - |
| `<Leader>e`  | - | - |
| `<Leader>r`  | Build and run current main package | vim-go |
| `<Leader>tyuiop`  | - | - |
| `<Leader>a`  | Open Ack | ack.vim |
| `<Leader>s`  | - | - |
| `<Leader>d`  | Go to symbol/declaration | vim-go |
| `<Leader>fgh`  | - | - |
| `<Leader>j`  | Turn to next of location list | - |
| `<Leader>k`  | Turn to previous of location list | - |
| `<Leader>lzx`  | - | - |
| `[count]<leader>c<space>` | Toggles the comment state | nerdcommenter |
| `[count]<leader>cs` | Comments out the selected lines | nerdcommenter |
| `<Leader>vb`  | - | - |
| `<Leader>b`  | Build current package | vim-go |
| `<Leader>nm`  | - | - |
| `<Leader>mm` | Display the minimap | vim-minimap |
| `<Leader>mc` | Close the minimap | vim-minimap |

| key | description |
|:----|:------------|
| `<esc><esc><esc><esc>` | reset all error checking: <br/>1.  stop the highlighting<br/>2.  close locationlist<br/>3.  reset syntastic |

## keyboard shortcuts

*   [syntastic](https://github.com/vim-syntastic/syntastic)

| key | description |
|:----|:------------|
| `<Leader>e`  | Show list of errors and warnings on the current file |
| `<Leader>np` | Turn to next or previous errors, after open errors list |

*   [vim-go](https://github.com/fatih/vim-go)

| key | description |
|:----|:------------|
| `<Leader>r`  | Build and run current main package |
| `<Leader>b`  | Build current package |
| `<Leader>d`  | Go to symbol/declaration |

*   [vim-minimap](https://github.com/severin-lemaignan/vim-minimap)

| key | description |
|:----|:------------|
| `<Leader>mm`  | display the minimap |
| `<Leader>mc`  | close the minimap |

*   [nerdcommenter](https://github.com/scrooloose/nerdcommenter)

| key | description |
|:----|:------------|
| `[count]<leader>cs` | Comments out the selected lines |
| `[count]<leader>c<space>` | Toggles the comment state of the selected line(s) |

*   [nerdtree](https://github.com/scrooloose/nerdtree)

| key | description |
|:----|:------------|
| `<C-n>` | Toggle |
| `<C-f>` | Find the current file in the tree |
| `?`     | Got help |
| `<I>` | Show hidden files |
| `<A>` | Zoom the nerdtree window |

*   [vim-multiple-cursors](https://github.com/terryma/vim-multiple-cursors)

| key | description |
|:----|:------------|
| `<C-g>` | cursor next |
| `<C-x>` | cursor skip |

*   [tagbar](https://github.com/majutsushi/tagbar)

| key | description |
|:----|:------------|
| `<C-b>` | TagbarToggle |

*   [ctrlp.vim](https://github.com/kien/ctrlp.vim)

| key | description |
|:----|:------------|
| `<C-p>`         | Invoke CtrlP in find file mode |
| CtrlP: `<c-fb>` | Cycle between modes |
| CtrlP: `<c-d>`  | switch to filename only search instead of full path |
| CtrlP: `<c-r>`  | switch to regexp mode |
| CtrlP: `<c-jk>` | navigate the result list |
| CtrlP: `<c-t>`  | open the selected entry in a new tab |
| CtrlP: `<c-v>`  | open the selected entry in a new split |
| CtrlP: `<c-x>`  | open the selected entry in a new split |
| CtrlP: `<c-y>`  | create a new file and its parent directories |
| CtrlP: `<c-z>`  | mark/unmark multiple files and <c-o> to open them |
| CtrlP: `<F5>`   | Refresh the match window and purge the cache for the current directory |

*   [vim-expand-region](https://github.com/terryma/vim-expand-region)

| key | description |
|:----|:------------|
| `<v>` | expand region expand |

*   [vim-easymotion](https://github.com/easymotion/vim-easymotion)

| key | description |
|:----|:------------|
| `<s>` | s{char} to move to {char} |

## contributing
1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## license
this repo is released under the [MIT License](http://www.opensource.org/licenses/MIT).
