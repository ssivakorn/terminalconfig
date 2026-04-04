#!/bin/bash

path=$(pwd)

# Ghostty configuration file
$GHOSTTY_CONFIG=$HOME/.config/ghostty
mkdir -p $GHOSTTY_CONFIG
ln -f -s $path/config $GHOSTTY_CONFIG/config
