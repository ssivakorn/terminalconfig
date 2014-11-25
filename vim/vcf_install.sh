#!/bin/bash

_vim_dir=".vim"
_colors_dir="colors"
_syntax_dir="syntax"
_plugin_dir="plugin"
_bundle_dir="bundle"
_autoload_dir="autoload"

echo "[>] Installing vim config ..."
cp vimrc ~/.vimrc

echo "[>] Installing syntax ..."
mkdir -p ~/${_vim_dir}
#cp -rf "$_colors_dir"  ~/"$_vim_dir"/.
cp -rf "$_syntax_dir"  ~/"$_vim_dir"/.


echo "[>] Installing my default colorschemes ..."
mkdir -p ~/${_vim_dir}/${_colors_dir}
curl -LSso ~/.vim/colors/luna-term.vim https://raw.githubusercontent.com/Pychimp/vim-luna/master/colors/luna-term.vim
curl -LSso ~/.vim/colors/luna.vim https://raw.githubusercontent.com/Pychimp/vim-luna/master/colors/luna.vim
curl -LSso ~/.vim/colors/molokai.vim https://raw.githubusercontent.com/tomasr/molokai/master/colors/molokai.vim
curl -LSso ~/.vim/colors/256-jungle.vim https://raw.githubusercontent.com/vim-scripts/256-jungle/master/colors/256-jungle.vim



echo "[>] Installing plugins and bundles ..."
#cp -rf "$_plugin_dir" ~/"$_vim_dir"/.
#cp -rf "$_autoload_dir" ~/"$_vim_dir"/.
#cp -rf "$_bundle_dir" ~/"$_vim_dir"/.

echo "\t[+] vim-pathogen"
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

echo "\t[+] vim-airline"
rm -rf ~/.vim/bundle/vim-airline
git clone https://github.com/bling/vim-airline ~/.vim/bundle/vim-airline

