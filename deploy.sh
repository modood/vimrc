#!/usr/bin/env bash

# check git and npm
(command -v git >/dev/null 2>&1 && command -v npm >/dev/null 2>&1) || {
  echo >&2 "You first need to have git and npm installed. Aborting.";
  exit 1;
}

bundle=$HOME/.vim/bundle
vundle=$bundle/Vundle.vim

# Download "VundleVim/Vundle.vim" Vim Plugin Manager
if [ ! -d "$vundle" ]; then
  git clone https://github.com/VundleVim/Vundle.vim.git "$vundle"
fi

cp .vimrc $HOME
cp .eslintrc.js $HOME
cp .tern-project $HOME

# PluginInstall: "VundleVim/Vundle.vim" plugin's install command.
vim +PluginInstall +GoInstallBinaries +qall

cp -rf snippets/* $bundle/snipmate.vim/snippets

# install npm dependencies
if [ ! -d "$bundle/tern_for_vim/node_modules" ]; then
  cd $bundle/tern_for_vim && npm install
fi
command -v eslint >/dev/null 2>&1 || npm install -g eslint eslint-config-standard eslint-plugin-import eslint-plugin-node eslint-plugin-promise eslint-plugin-standard
command -v instant-markdown-d >/dev/null 2>&1 || npm install -g instant-markdown-d

