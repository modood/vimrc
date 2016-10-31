#!/usr/bin/env bash

# check git and npm
(command -v git >/dev/null 2>&1 && command -v npm >/dev/null 2>&1) || {
  echo >&2 "You first need to have git and npm installed. Aborting.";
  exit 1;
}

vundle=~/.vim/bundle/Vundle.vim

if [ ! -d "$vundle" ]; then
  git clone https://github.com/VundleVim/Vundle.vim.git "$vundle"
fi

cp .vimrc ~/
vim +PluginInstall +qall

cp -rf snippets/* ~/.vim/bundle/snipmate.vim/snippets

# install npm dependencies
command -v standard >/dev/null 2>&1 || sudo npm install -g standard
command -v instant-markdown-d >/dev/null 2>&1 || sudo npm install -g instant-markdown-d

