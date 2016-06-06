# Save this file to .bash_profile in home directory to enable terminal color
# Author: Suphannee Sivakorn (https://github.com/ssivakorn)

# Enable color for listing directory >> $ ls
export TERM=xterm-256color
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagaced

source ~/.promptrc
PROMPT_COMMAND='set_promptcmd "green"' # select color from .promptrc

# bin path
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"

# personal bin path /home/user/bin
export PATH="~/bin:$PATH" # personal bin path /home/user/bin
