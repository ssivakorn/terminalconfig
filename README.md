<h1>TerminalConfig</h1>
My simple terminal configurations for Mac and Linux environment includes:

<h2>Tmux Configuration</h2>
Basic tmux configuration:

```shell
$ cd tmux
$ ./setup.sh
```
<h2>Fish shell</h2>

```sh
$ cd fish_shell
$ ./setup
```
<h2>Bash shell</h2>
Basic bash shell 256 (8-bit) color configure:

* **Mac**
save .bash_profile into home directory: /home/user/.bash_profile
* **Linux**
save .bashrc into home directory: /home/user/.bashrc

**Terminal colors can be picked from:**
* (4-bit colors) http://ciembor.github.io/4bit/
* (8-bit colors) http://vim.wikia.com/wiki/Xterm256_color_names_for_console_Vim
* http://misc.flogisoft.com/bash/tip_colors_and_formatting

Below terminal colors stolen from: http://misc.flogisoft.com/bash/tip_colors_and_formatting

* Foreground Text Color
```
[38;5;<ColorNumber>m
```
![alt text](http://misc.flogisoft.com/_media/bash/colors_format/256_colors_fg.png "Foreground Text")


* Background Text Color
```
[48;5;<ColorNumber>m
```
![alt text](http://misc.flogisoft.com/_media/bash/colors_format/256_colors_bg.png "Background Text")

* Combine foreground and background
```
[38;5<ForegroundColorNumber>;48;5<BackgroundColorNumber>m
```

* Display all terminal colors
```shell
$ ./colors.sh
```

use this script to show full colors
```shell
$ ./fullcolors.py
```


<h2>Terminal Color Theme</h2>
Themes of iterm2 terminal color for Mac OS: http://iterm2colorschemes.com/

<h2>Fancy Man Page</h2>
Give some colors to manual pages on Debian-based OS

```shell
$ sudo apt-get install most
```

```shell
$ export PAGER="most"
or
$ export PAGER="/usr/bin/most -s"
```
