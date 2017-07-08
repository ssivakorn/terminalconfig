function  fish_prompt
    #set -l home_escaped (echo -n $HOME | sed 's/\//\\\\\//g')
    #set -l pwd (echo -n $PWD | sed "s/^$home_escaped/~/" | sed 's/ /%20/g')
    set -l pwd (prompt_pwd)
    set -l prompt_user_color

    switch $USER
        case root toor
            set prompt_user_color 'red'
        case '*'
            set prompt_user_color 'normal'
    end

    echo
    set_color grey
    echo $pwd
    set_color $prompt_user_color
    echo -n $USER@(prompt_hostname)' ❯❯❯ '
    set_color normal

    #printf "\n%s%s\n%s%s@%s ❯❯❯%s " (set_color grey) $pwd \
    #        (set_color $prompt_user_color) $USER (prompt_hostname) (set_color normal)

end
