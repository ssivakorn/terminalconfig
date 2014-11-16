vim configuration
====================
my simple .vimrc configuration for linux and mac includes:
* **vim-pathogen** plugin managing plugin
    https://github.com/tpope/vim-pathogen
* **vim-airline** nice and light status line with pure vim script
    https://github.com/bling/vim-airline
* **vim-taglist** listing all functions in the code
    http://vim-taglist.sourceforge.net/

vim configuration
--------------------
save .vimrc into home directory: /home/user/.vimrc

vim colorscheme
--------------------
save colorscheme (vim theme) file into home directory: /home/user/.vim/colors/

colorschemes including:
* harlequin
* 256-jungle

Easy Install
--------------------
```shell
$ chmod +x vcf_installer.sh
$ sh vcf_installer.sh
```

Ctag must be installed to enable taglist:
* Debian / Ubuntu
```shell
$ sudo apt-get install exuberant-ctags
```
* RedHat, Fedora, CentOS
```shell
sudo yum install ctags
```
* Mac OS
```shell
$ brew install ctags
$ alias ctags="`brew --prefix`/bin/ctags"
```

