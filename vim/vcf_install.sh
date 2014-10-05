#!/bin/bash

_vim_dir=".vim"
_colors_dir="colors"
_syntax_dir="syntax"
_plugin_dir="plugin"

echo "[>] Installing vim config ..."
cp vimrc ~/.vimrc

echo "[>] Installing color and syntax ..."
mkdir -p ~/${_vim_dir}
cp -rf "$_colors_dir"  ~/"$_vim_dir"/.
cp -rf "$_syntax_dir"  ~/"$_vim_dir"/.

echo "[>] Installing plugin ..."
cp -rf "$_plugin_dir" ~/"$_vim_dir"/.
