#!/bin/bash

path=$(pwd)

# Install omz
# https://github.com/ohmyzsh/ohmyzsh
rm -rf $HOME/.oh-my-zsh
curl https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh | sh
ln -f -s $path/zshrc $HOME/.zshrc
