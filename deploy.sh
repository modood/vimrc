#!/usr/bin/env bash

# check git and npm
(command -v git >/dev/null 2>&1 && command -v npm >/dev/null 2>&1) || {
  echo >&2 "You first need to have git and npm installed. Aborting.";
  exit 1;
}

vundle=~/.vim/bundle/Vundle.vim

# Download "VundleVim/Vundle.vim" Vim Plugin Manager
if [ ! -d "$vundle" ]; then
  git clone https://github.com/VundleVim/Vundle.vim.git "$vundle"
fi

cp .vimrc ~/

# PluginInstall: "VundleVim/Vundle.vim" plugin's install command.
vim +PluginInstall +qall

cp -rf snippets/* ~/.vim/bundle/snipmate.vim/snippets

# install npm dependencies
command -v eslint >/dev/null 2>&1 || npm install -g eslint eslint-config-airbnb eslint-plugin-import eslint-plugin-jsx-a11y eslint-plugin-react
command -v instant-markdown-d >/dev/null 2>&1 || npm install -g instant-markdown-d

