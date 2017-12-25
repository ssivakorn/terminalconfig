#!/bin/bash
rm -rf ~/.tmux/plugins/tpm
git clone -q https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

cp tmux.conf ~/.tmux.conf
