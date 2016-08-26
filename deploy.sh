#!/usr/bin/env bash

vundle=~/.vim/bundle/Vundle.vim

if [ ! -d "$vundle" ]; then
  git clone https://github.com/VundleVim/Vundle.vim.git "$vundle"
fi

cp .vimrc ~/
vim +PluginInstall +qall

cp -rf snippets/* ~/.vim/bundle/snipmate.vim/snippets
