#!/bin/bash
COLOR="colors"
SYNTAX="syntax"
PLUGIN="plugin"
BUNDLE="bundle"
AUTOLOAD="autoload"

VIM_PATH="$HOME/.vim"
COLOR_PATH="${VIM_PATH}/${COLOR}"
SYNTAX_PATH="${VIM_PATH}/${SYNTAX}"
PLUGIN_PATH="${VIM_PATH}/${PLUGIN}"
BUNDLE_PATH="${VIM_PATH}/${BUNDLE}"
AUTOLOAD_PATH="${VIM_PATH}/${AUTOLOAD}"

echo "[>] Installing vim config ..."
cp vimrc ~/.vimrc

echo "[>] Installing syntax ..."
mkdir -p "${VIM_PATH}"
cp -rf ${SYNTAX}  "${VIM_PATH}/."


echo "[>] Installing colorschemes ..."
mkdir -p "${COLOR_PATH}"
curl -LSso "${COLOR_PATH}/luna-term.vim" https://raw.githubusercontent.com/Pychimp/vim-luna/master/colors/luna-term.vim
curl -LSso "${COLOR_PATH}/molokai.vim" https://raw.githubusercontent.com/tomasr/molokai/master/colors/molokai.vim
curl -LSso "${COLOR_PATH}/256-jungle.vim" https://raw.githubusercontent.com/vim-scripts/256-jungle/master/colors/256-jungle.vim
curl -LSso "${COLOR_PATH}/harlequin.vim" https://raw.githubusercontent.com/nielsmadan/harlequin/master/colors/harlequin.vim


echo "[>] Installing plugins and bundles ..."
echo "\t[+] vim-pathogen"
mkdir -p ${AUTOLOAD_PATH}
mkdir -p ${BUNDLE_PATH}
curl -LSso "${AUTOLOAD_PATH}/pathogen.vim" https://tpo.pe/pathogen.vim

echo "\t[+] vim-airline"
airline="${BUNDLE_PATH}/vim-airline"
rm -rf ${airline}
git clone https://github.com/bling/vim-airline ${airline}

echo "\t[+] vim-airlineish"
airlineish="${BUNDLE_PATH}/vim-airlineish"
rm -rf ${airlineish}
git clone https://github.com/paranoida/vim-airlineish.git ${airlineish}
