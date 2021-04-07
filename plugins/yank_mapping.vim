" ~/.vim/bundle/nerdtree/nerdtree_plugin/yank_mapping.vim
call NERDTreeAddKeyMap({
        \ 'key': 'yy',
        \ 'callback': 'NERDTreeYankCurrentNode',
        \ 'quickhelpText': 'put full path of current node into the "+ register' })

function! NERDTreeYankCurrentNode()
    let n = g:NERDTreeFileNode.GetSelected()
    if n != {}
        call setreg('+', n.path.str())
        call setreg('"', n.path.str())
    endif
endfunction
