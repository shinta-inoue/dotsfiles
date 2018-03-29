#!/bin/bash
set -eu

DOTPATH=~/.dotfiles

GITHUB_URL="https://github.com/banri-tokoroten/dotfiles.git"
DOWNLOAD_URL="https://github.com/banri-tokoroten/dotfiles/archive/master.tar.gz"

exist_cmd() {
  which "$1" > /dev/null 2>&1
  return $?
}

# Download dotfiles using git, curl or wget
download() {
  if exist_cmd "git"; then
    git clone --recursive "$GITHUB_URL" "$DOTPATH"
  
  elif exist_cmd "curl"; then
    curl -L "$DOWNLOAD_URL" | tar xvz

  elif exist_cmd "wget"; then
    wget -O - "$DOWNLOAD_URL" | tar xvz

  else
    echo "git, curl or wget is required"
    exit 1
  fi
  
  if [ -d dotfiles-master ]; then
    command mv -f dotfiles-master "$DOTPATH"
  fi
}

# Deploy dotfiles
deploy() {
  cd "$DOTPATH" && make deploy
}

# Initialize environment
initialize() {
  cd "$DOTPATH" && make init
}

# Download, Deploy and Initialize
echo "Install dotfiles..."
download && deploy && initialize
echo "Complete!"

