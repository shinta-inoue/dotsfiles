#!/bin/bash
set -eu

DOT_FILES=(.zshrc .atom)
echo "Set up dotfiles -> ${DOT_FILES[@]}"

backupDir=$HOME/dotfiles.bk
if [ -e $backupDir ]; then
  rm -rf $backupDir
fi
mkdir $backupDir

for file in ${DOT_FILES[@]}
do
  actualFile=$HOME/$file
  if [ ! -L $actualFile ]; then
    if [ -e $actualFile ]; then
      echo "move ${actualFile} to backup dir"
      mv $actualFile $backupDir/$file
    fi
    ln -s $HOME/dotfiles/$file $HOME/$file
  fi
done

source $HOME/.zshrc

echo "Complete!"
