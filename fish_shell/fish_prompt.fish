function fish_prompt --description 'Write out the prompt'
    set -l home_escaped (echo -n $HOME | sed 's/\//\\\\\//g')
    set -l pwd (echo -n $PWD | sed "s/^$home_escaped/~/" | sed 's/ /%20/g')
    set -l prompt_symbol ''
    switch $USER
        case root toor; set prompt_symbol '$'
        case '*';  set prompt_symbol '$'
    end

    printf "\n%s%s@%s%s:%s%s%s\n%s%s%s " \
        (set_color 00FF00 --bold) $USER (hostname -s) (set_color normal) \
		(set_color 6c6c6c --bold) $pwd (set_color normal) \
        (set_color efefef --bold) $prompt_symbol (set_color normal)
end
