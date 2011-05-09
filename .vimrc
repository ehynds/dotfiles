set nocompatible
set guifont=Consolas
set linespace=3

" pathogen
filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
filetype plugin indent on

" set syntax highlighting options
set t_Co=256
set background=light
let g:solarized_visibility="low"
syntax on
colorscheme solarized

" tabs
set tabstop=4
set shiftwidth=4
set softtabstop=4

" ignore case in searches
set ignorecase
set smartcase

" set a bunch of random stuff
set backspace=indent,eol,start " Intuitive backspacing in insert mode
set encoding=utf-8
set incsearch " Highlight dynamically as pattern is typed.
set hlsearch " highlight all occurrances of a search
set laststatus=2 " Always show status line
set modelines=0
set history=1000 " Increase history from 20 default to 1000
set nowrap " Do not wrap lines.
set title " Show the filename in the window titlebar.
set scrolloff=3
set autoindent
set copyindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set undofile
set number

" status line
set statusline=%<%f\ %h%w%m%r%y%=L:%l/%L\ (%p%%)\ C:%c%V\ B:%o

" white space options
set list
set listchars=tab:>-,trail:.

" set relative line numbers
set relativenumber " Use relative line numbers. Current line is still in status bar.
au BufReadPost * set relativenumber

" remap leader
let mapleader = ","

" NERD Commenter/Tree
let NERDSpaceDelims=1
let NERDCompactSexyComs=1
let NERDTreeShowBookmarks=1 " always show bookmarks on open
nmap <silent> <c-n> :NERDTreeToggle<CR> " map open to ctrl+n

" JSON
au BufRead,BufNewFile *.json set ft=json syntax=javascript

" buffers - explore/next/previous: Alt-F12, F12, Shift-F12.
nnoremap <silent> <F10> :BufExplorer<CR>
nnoremap <silent> <F11> :bp<CR>
nnoremap <silent> <F12> :bn<CR>

" backup
set backup
set backupdir=~/.vim/tmp
set directory=~/.vim/tmp
set undodir=~/.vim/tmp

" yeah yeah...
source $VIMRUNTIME/mswin.vim
behave mswin

" show marks / mark wok plugins
nmap <Leader>ms :DoShowMarks<CR>
nmap <Leader>mh :NoShowMarks<CR>
nmap <Leader>mm <Plug>ToggleMarkWok :DoShowMarks<CR>
nmap <Leader>md <Plug>KillMarksWok :DoShowMarks<CR>
nnoremap <silent> <Leader>ml :marks abcdefghijklmnopqrstuvwxyz<CR>
let g:showmarks_marks = "abcdefghijklmnopqrstuvqxyz"
let g:wokmarks_do_maps=0

" misc remappings
nmap <Leader>bc :Bclose<CR>
