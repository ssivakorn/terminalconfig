#!/bin/bash

# Prompt setup
cp fish_prompt.fish ~/.config/fish/functions/.
cp fish_right_prompt.fish ~/.config/fish/functions/.

# Color
fish basic_config.fish
fish color_config.fish
