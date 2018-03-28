#!/bin/bash
set -eu

DOT_FILES=(.zshrc .atom .vimrc)
echo "Set up dotfiles -> ${DOT_FILES[@]}"

for file in ${DOT_FILES[@]}
do
  ln -sf $HOME/dotfiles/$file $HOME
done

VIM_CONFIG=(colors)
echo "Set up vim configs -> ${VIM_CONFIG[@]}"

for dir in ${VIM_CONFIG[@]}
do
  ln -sf $HOME/dotfiles/$dir $HOME/.vim
done

echo "Complete!"
