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

# Copy dotfiles
dotfiles=(
  .vimrc
)
if [[ -L "$0" ]]; then
  for i in ${dotfiles[@]}; do cp $i $HOME/$i; done
else
  for i in ${dotfiles[@]}; do curl -L $repo/$i > $HOME/$i; done
fi

# PluginInstall: "VundleVim/Vundle.vim" plugin's install command.
vim +PluginInstall +PluginUpdate +GoInstallBinaries +GoUpdateBinaries +qall < /dev/tty

# Compile "Shougo/vimproc.vim" manually
if [ ! -f $bundle/vimproc.vim/lib/*.so ]; then
  CURRENT_DIR=$PWD
  cd $bundle/vimproc.vim && make > /dev/null
  cd $CURRENT_DIR
fi

# Copy snippets
snippets=(
  snippets/_.snippets
  snippets/go.snippets
)
if [[ -L "$0" ]]; then
  for i in ${snippets[@]}; do cp $i $bundle/snipmate.vim/$i; done
  cp plugins/yank_mapping.vim $bundle/nerdtree/nerdtree_plugin/yank_mapping.vim
else
  for i in ${snippets[@]}; do curl -L $repo/$i > $bundle/snipmate.vim/$i; done
  curl -L $repo/plugins/yank_mapping.vim > $bundle/nerdtree/nerdtree_plugin/yank_mapping.vim
fi

# install npm dependencies
command -v instant-markdown-d >/dev/null 2>&1 || npm install -g instant-markdown-d

