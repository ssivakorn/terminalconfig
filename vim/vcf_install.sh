#!/bin/bash

_vim_dir=".vim"
_colors_dir="colors"
_syntax_dir="syntax"
_plugin_dir="plugin"
_bundle_dir="bundle"
_autoload_dir="autoload"

echo "[>] Installing vim config ..."
cp vimrc ~/.vimrc

echo "[>] Installing color and syntax ..."
mkdir -p ~/${_vim_dir}
cp -rf "$_colors_dir"  ~/"$_vim_dir"/.
cp -rf "$_syntax_dir"  ~/"$_vim_dir"/.

echo "[>] Installing plugins and bundles ..."
cp -rf "$_plugin_dir" ~/"$_vim_dir"/.
cp -rf "$_autoload_dir" ~/"$_vim_dir"/.
cp -rf "$_bundle_dir" ~/"$_vim_dir"/.

