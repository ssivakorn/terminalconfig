# save this file to .bash_profile in home directory to enable terminal color

# enable color for listing directory >> $ ls
# color can be picked from http://geoff.greer.fm/lscolors/
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagaced

# set up terminal >> your_name@your_computer_name:
# color can be picked from http://ciembor.github.io/4bit/
export PS1='\[\e[01;32m\]\u@\[\e[0m\]\[\e[01;32m\]\h\[\e[0m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

# http://vim.wikia.com/wiki/Xterm256_color_names_for_console_Vim
