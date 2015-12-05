# Save this file to .bash_profile in home directory to enable terminal color
# Credit: Suphannee Sivakorn (https://github.com/ssivakorn)

# Enable color for listing directory >> $ ls
# Color can be picked from http://geoff.greer.fm/lscolors/
export TERM=xterm-256color
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagaced

# Prepare status line and color prompt
let fillsize=${COLUMNS}-11
fill=""
while [ "$fillsize" -gt "0" ]
do
    fill="—${fill}" # fill
    let fillsize=${fillsize}-1
done

reset_style="\[\033[00m\]"
status_line="${reset_style}\[\033[0;90m\]${fill} [\t]\n"
prompt_line="${reset_style}\[\033[38;5;34m\]\u@\h${reset_style}:\w\$ "
command_style="${reset_style}" # \[\033[1;29m\]" # bold black

# Set up prompt >> your_name@your_computer_name:directory $
#export PS1='\[\e[01;32m\]\u@\[\e[0m\]\[\e[01;32m\]\h\[\e[0m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
export PS1="${status_line}${prompt_line}${command_style}"

# bin path
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
# personal bin path /home/user/bin
export PATH="~/bin:$PATH" # personal bin path /home/user/bin
