function fish_prompt --description 'Write out the prompt'

    # Disable virtualenv
    if not set -q VIRTUAL_ENV_DISABLE_PROMPT
        set -g VIRTUAL_ENV_DISABLE_PROMPT true
    end

    set -l home_escaped (echo -n $HOME | sed 's/\//\\\\\//g')
    set -l pwd (echo -n $PWD | sed "s/^$home_escaped/~/" | sed 's/ /%20/g')
    set -l prompt_symbol ''
    switch $USER
        case root toor; set prompt_symbol '$'
        case '*';  set prompt_symbol '$'
    end

    printf "\n"
    # virtualenv
    if test $VIRTUAL_ENV
        printf "%s %s %s" (set_color -b 222222 ebebeb) (basename $VIRTUAL_ENV) (set_color normal)
        printf " "
    end

    # user@hostname
    printf "%s%s%s" (set_color 5fd700 --bold) $USER (set_color normal)
    printf "%s@%s"  (set_color 5fd700 --bold) (set_color normal)
    printf "%s%s%s" (set_color 5fd700 --bold) (hostname -s) (set_color normal)
    printf "%s:%s"  (set_color 5fd700 --bold) (set_color normal)

    # current directory
    printf "%s%s%s" (set_color 6c6c6c) $pwd (set_color normal)

    # version control system (git, svn)
    printf "%s%s%s" (set_color b8860b) (__fish_vcs_prompt) (set_color normal)

    # prompt symbol
    printf " "
    printf "%s%s%s" (set_color efefef --bold) $prompt_symbol (set_color normal)
    printf " "

end
