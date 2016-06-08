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
export PATH="~/.bin:$PATH" # personal bin path /home/user/bin

# grep option color
export GREP_OPTIONS='--color=auto'

# auto complete ssh hosts
# stolen from https://www.shocm.com/2011/01/ssh-autocomplete-on-osx/
_complete_ssh_hosts ()
{
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    comp_ssh_hosts=`cat ~/.ssh/known_hosts | \
        cut -f 1 -d ' ' | \
        sed -e s/,.*//g | \
        grep -v ^# | \
        uniq | \
        grep -v "\[" ;
    cat ~/.ssh/config | \
        grep "^Host " | \
        awk '{print $2}'
    `
    COMPREPLY=( $(compgen -W "${comp_ssh_hosts}" -- $cur))
    return 0
}
complete -F _complete_ssh_hosts ssh



