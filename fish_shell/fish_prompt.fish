function fish_prompt --description 'Write out the prompt'
	set -l home_escaped (echo -n $HOME | sed 's/\//\\\\\//g')
   set -l pwd (echo -n $PWD | sed "s/^$home_escaped/~/" | sed 's/ /%20/g')
   set -l prompt_symbol ''
   switch $USER
       case root toor; set prompt_symbol '>'
       case '*';  set prompt_symbol '>'
   end
   printf "\n%s%s@%s%s:%s%s%s\n%s " (set_color 00FF00) $USER (hostname -s) (set_color normal) \
				    (set_color 6c6c6c) $pwd (set_color normal) $prompt_symbol
end
