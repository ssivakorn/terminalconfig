" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" TODO: this may not be in the correct place. It is intended to allow overriding <Leader>.
" source ~/.vimrc.before if it exists.
if filereadable(expand("~/.vimrc.before"))
  source ~/.vimrc.before
endif

" =============== Pathogen Initialization ===============
" This loads all the plugins in ~/.vim/plugins
" Use tpope's pathogen plugin to manage all other plugins

"  runtime plugins/tpope-vim-pathogen/autoload/pathogen.vim
" call pathogen#infect()
" call pathogen#helptags()

" ================ General Config ====================

set number                      "Line numbers are good
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
set gcr=a:blinkon0              "Disable cursor blink
set visualbell                  "No sounds
set autoread                    "Reload files changed outside vim
set colorcolumn=80
set cinoptions=t0
" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden

" enable full color supported
if $COLORTERM == 'gnome-terminal'
      set t_Co=256
endif
"turn on syntax highlighting
syntax on

"background light/dark
set background=dark


"color theme
colorscheme harlequin

"highlight line number
highlight LineNr ctermfg=DarkGray

"selected code color (visual)
hi Visual ctermbg=White ctermfg=Black

"highlight column color
highlight ColorColumn ctermbg=DarkRed

" ================ Search Settings  =================

set incsearch        "Find the next match as we type the search
set nohlsearch         "Hilight searches by default
set viminfo='100,f1  "Save up to 100 marks, enable capital marks

" ================ Turn Off Swap Files ==============

set noswapfile
set nobackup
set nowb

" ================ Persistent Undo ==================
" Keep undo history across sessions, by storing in file.
" Only works all the time.

silent !mkdir ~/.vim/backups > /dev/null 2>&1
set undodir=~/.vim/backups
set undofile

" ================ Indentation ======================

set autoindent
set smartindent
set smarttab
set shiftwidth=4
set softtabstop=4
set tabstop=4
"set expandtab
set ts=4
set cindent

filetype plugin on
filetype indent on

" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·

set nowrap       "Don't wrap lines
set linebreak    "Wrap lines at convenient points

" ================ Folds ============================

set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default

" ================ Completion =======================

set wildmode=list:longest
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

"

" ================ Scrolling ========================

set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

"Setting makefiles with tabs, not spaces
autocmd FileType make setlocal noexpandtab

set grepprg=grep\ -nH\ $*
let g:tex_flavor='latex'

set clipboard=unnamedplus

"taglist options
"let Tlist_Display_Prototype=1
"let Tlist_Exit_OnlyWindow=1
"let Tlist_WinWidth=50
"let Tlist_Auto_Open=1
"autocmd BufWritePost *.cpp :TlistUpdate
"autocmd BufWritePost *.c :TlistUpdate

" Restore cursor position to where it was before
augroup JumpCursorOnEdit
	au!
	autocmd BufReadPost *
		\ if expand("<afile>:p:h") !=? $TEMP |
		\   if line("'\"") > 1 && line("'\"") <= line("$") |
		\     let JumpCursorOnEdit_foo = line("'\"") |
		\     let b:doopenfold = 1 |
		\     if (foldlevel(JumpCursorOnEdit_foo) > foldlevel(JumpCursorOnEdit_foo - 1)) |
		\        let JumpCursorOnEdit_foo = JumpCursorOnEdit_foo - 1 |
		\        let b:doopenfold = 2 |
		\     endif |
		\     exe JumpCursorOnEdit_foo |
		\   endif |
		\ endif
	" Need to postpone using "zv" until after reading the modelines.
	autocmd BufWinEnter *
		\ if exists("b:doopenfold") |
		\   exe "normal zv" |
		\   if(b:doopenfold > 1) |
		\       exe  "+".1 |
		\   endif |
		\   unlet b:doopenfold |
		\ endif
augroup END

"enable mouse control
"set mouse=a

"set status line
set noruler
set laststatus=2
set statusline+=%1*\ %t\                        "File name
set statusline+=%2*\ %m\                        "Modify?
set statusline+=%3*\ %=\ line:%l/%L\ (%03p%%)\  "Rownumber/total (%)
set statusline+=%4*\ col:%03c\                  "Colnr
hi StatusLine ctermfg=Black ctermbg=Gray
hi User1 ctermfg=White  ctermbg=DarkRed
hi User2 ctermfg=Black  ctermbg=Yellow
hi User3 ctermfg=White  ctermbg=Black
hi User4 ctermfg=Black  ctermbg=Yellow
