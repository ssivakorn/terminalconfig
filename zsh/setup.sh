#!/bin/bash

path=$(pwd)

# Install omz
# https://github.com/ohmyzsh/ohmyzsh
rm -rf $HOME/.oh-my-zsh
curl https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh | sh
ln -f -s $path/zshrc $HOME/.zshrc


# Install/update plugins
ZSH_CUSTOM=$HOME/.oh-my-zsh/custom

git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
