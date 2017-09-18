function fish_prompt --description 'Write out the prompt'
    set -l home_escaped (echo -n $HOME | sed 's/\//\\\\\//g')
    set -l pwd (echo -n $PWD | sed "s/^$home_escaped/~/" | sed 's/ /%20/g')
    set -l prompt_symbol ''
    switch $USER
        case root toor; set prompt_symbol '$'
        case '*';  set prompt_symbol '$'
    end

    printf "\n"
    printf "%s%s%s" (set_color 5fd700 --bold) $USER (set_color normal)
    printf "%s@%s"  (set_color 5fd700 --bold) (set_color normal)
    printf "%s%s%s" (set_color 5fd700 --bold) (hostname -s) (set_color normal)
    printf "%s:%s"  (set_color 5fd700 --bold) (set_color normal)
    printf "%s%s%s" (set_color 6c6c6c) $pwd (set_color normal)
    printf " "
    printf "%s%s%s" (set_color efefef --bold) $prompt_symbol (set_color normal)
    printf " "

end
