#!/bin/bash


echo "\$TERM=${TERM}"
echo "\$COLORTERM=${COLORTERM}"

export TERM=xterm-256color
export COLORTERM=truecolor

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/gawin/bash-colors-256/master/colors)"
