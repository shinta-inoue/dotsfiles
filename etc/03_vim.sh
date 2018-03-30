#!/bin/sh
COLORS_DIR="$HOME/.vim/colors"
TMP_DIR="$COLORS_DIR/tmp"

install_colorscheme() {
  git clone --recursive https://github.com/tomasr/molokai "$TMP_DIR"
  mv "$TMP_DIR/colors/molokai.vim" "$COLORS_DIR"
  rm -rf "$TMP_DIR"
}

install_vundlevim() {
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim 
}

install_colorscheme && install_vundlevim
