#!/usr/bin/env bash

# check git, curl and npm
(command -v git >/dev/null 2>&1 && command -v curl >/dev/null 2>&1&& command -v npm >/dev/null 2>&1) || {
  echo >&2 "You first need to have git, curl and npm installed. Aborting.";
  exit 1;
}

bundle=$HOME/.vim/bundle
vundle=$bundle/Vundle.vim

repo=https://github.com/modood/vimrc/raw/master

# Download "VundleVim/Vundle.vim" Vim Plugin Manager
if [ ! -d $vundle ]; then
  git clone https://github.com/VundleVim/Vundle.vim.git $vundle
fi

# Compile "Shougo/vimproc.vim" manually
if [ ! -f $bundle/vimproc.vim/lib/*.so ]; then
  CURRENT_DIR=$PWD
  cd $bundle/vimproc.vim && make > /dev/null
  cd $CURRENT_DIR
fi

# Copy dotfiles
dotfiles=(
  .vimrc
  .eslintrc.js
)
for i in ${dotfiles[@]}; do curl -L $repo/$i > $HOME/$i; done

# PluginInstall: "VundleVim/Vundle.vim" plugin's install command.
vim +PluginInstall +GoInstallBinaries +qall

# Copy snippets
snippets=(
  snippets/_.snippets
  snippets/go.snippets
  snippets/javascript.snippets
)
for i in ${snippets[@]}; do curl -L $repo/$i > $bundle/snipmate.vim/$i; done

# install npm dependencies
command -v eslint >/dev/null 2>&1 || npm install -g eslint eslint-config-standard eslint-plugin-import eslint-plugin-node eslint-plugin-promise eslint-plugin-standard
command -v instant-markdown-d >/dev/null 2>&1 || npm install -g https://github.com/mwnf/instant-markdown-d.git

