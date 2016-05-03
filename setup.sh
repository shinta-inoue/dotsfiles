#!/bin/bash
DOT_FILES=(.zshrc .atom)

mkdir $HOME/dotfiles.bk

for file in ${DOT_FILES[@]}
do
  mv $HOME/$file $HOME/dotfiles.bk/$file
  ln -s $HOME/dotfiles/$file $HOME/$file
done

