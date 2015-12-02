terminalconfig
====================
simple terminal configurations for Mac / Linux environment includes:

terminal colors
--------------------
* **Mac**
save .bash_profile into home directory: /home/user/.bash_profile

* **Linux**
save .bashrc into home directory: /home/user/.bashrc

**Terminal colors can be picked from:**
* (4-bit colors) http://ciembor.github.io/4bit/
* (8-bit colors) http://vim.wikia.com/wiki/Xterm256_color_names_for_console_Vim
* http://misc.flogisoft.com/bash/tip_colors_and_formatting

Below terminal colors stolen from:
> http://misc.flogisoft.com/bash/tip_colors_and_formatting

* Foreground Text Color
```
[38;5;ColorNumberm
```
![alt text](http://misc.flogisoft.com/_media/bash/colors_format/256_colors_fg.png "Foreground Text")

bashrc generator: http://bashrcgenerator.com/

* Background Text Color
```
[48;5;ColorNumberm
```
![alt text](http://misc.flogisoft.com/_media/bash/colors_format/256_colors_bg.png "Background Text")

* Display all terminal colors
```shell
$ ./colors.sh
```

use this script to show full colors
```shell
$ ./fullcolors.py
```

terminal preset color theme
--------------------
themes of iterm2 terminal color for mac os: http://iterm2colorschemes.com/

fancy your man page 
--------------------
```shell
$ sudo apt-get install most
```

```shell
$ export PAGER="most"
or
$ export PAGER="/usr/bin/most -s"
```

vim configuration
--------------------
see https://github.com/ssivakorn/vimconfig for simple and light vim configuration.
* vim configuration (.vimrc)
* vim colorschemes
* vim plugins e.g. vim-pathogen, vim-airline, ctag, and vim-tlist
