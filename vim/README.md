vim configuration
====================
my simple .vimrc configuration for linux and mac.

vim configuration
--------------------
save .vimrc into home directory: /home/user/.vimrc

vim colorscheme
--------------------
save colorscheme (vim theme) file into home directory: /home/user/.vim/colors/

colorschemes including:
* harlequin
* 256-jungle

vim taglist
--------------------
vim taglist plugin for listing all functions in the code.

Easy Install
--------------------
```shell
$ chmod +x vcf_installer.sh
$ ./vcf_installer.sh
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

