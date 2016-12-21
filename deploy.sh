#!/usr/bin/env bash

# check git and npm
(command -v git >/dev/null 2>&1 && command -v npm >/dev/null 2>&1 && command -v curl >/dev/null 2>&1) || {
  echo >&2 "You first need to have git, curl and npm installed. Aborting.";
  exit 1;
}

plug=~/.vim/autoload/plug.vim
vundle=~/.vim/bundle/Vundle.vim

# Download "junegunn/vim-plug" Vim Plugin Manager
if [ ! -f "$plug" ]; then
  curl -fLo "$plug" --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi
# Download "VundleVim/Vundle.vim" Vim Plugin Manager
if [ ! -d "$vundle" ]; then
  git clone https://github.com/VundleVim/Vundle.vim.git "$vundle"
fi

cp .vimrc ~/

# PlugInstall: "junegunn/vim-plug" plugin's install command.
# PluginInstall: "VundleVim/Vundle.vim" plugin's install command.
# GoInstallBinaries: "fatih/vim-go" plugin's install command.
vim +PlugInstall +PluginInstall +GoInstallBinaries +qall

cp -rf snippets/* ~/.vim/bundle/snipmate.vim/snippets

# install npm dependencies
command -v eslint >/dev/null 2>&1 || sudo npm install -g eslint eslint-config-standard eslint-plugin-promise eslint-plugin-standard
command -v instant-markdown-d >/dev/null 2>&1 || sudo npm install -g instant-markdown-d

