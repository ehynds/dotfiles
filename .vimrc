set nocompatible

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

" ignore case in searches
set ignorecase
set smartcase

" history / backup
set history=1000 " Increase history from 20 default to 1000
set undofile
set undolevels=1000
set backup

" set a bunch of random stuff
set backspace=indent,eol,start " Intuitive backspacing in insert mode
set encoding=utf-8
set incsearch " Highlight dynamically as pattern is typed.
set hlsearch " highlight all occurrances of a search
set laststatus=2 " Always show status line
set modelines=0
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
set number
set guifont=Consolas
set linespace=3

" status line
set statusline=%<%f\ %h%w%m%r%y%=L:%l/%L\ (%p%%)\ C:%c%V\ B:%o

" white space options
set list
set listchars=tab:>-,trail:.
set tabstop=2
set shiftwidth=2
set expandtab " expand tab to spaces
set softtabstop=2
set smarttab

" set relative line numbers
set relativenumber " Use relative line numbers. Current line is still in status bar.
au BufReadPost * set relativenumber

" remap leader
let mapleader = ","

" insert a new line and return to normal mode on enter
" backspace deletes current char in normal mode
nnoremap <CR> o<Esc>
nnoremap <BS> x

" NERD Commenter
let NERDSpaceDelims=1
let NERDCompactSexyComs=1

" NERDTree
nmap <silent> <c-n> :NERDTreeToggle<CR> " map open to ctrl+n
nmap <Leader>nf :NERDTreeFind<CR> " open a tree with the current file as context
let NERDTreeShowBookmarks=1 " always show bookmarks on open
let NERDTreeQuitOnOpen=1 " quit once opening a file
let NERDTreeHighlightCursorline=1 " highlight the selected entry in the tree

" work with windows a bit easier
nnoremap <leader>ws <C-w>v<C-w>l " new vertical
nnoremap <leader>wh <C-w>s<C-w>l " new horizontal
nnoremap <leader>wq <C-w>q<C-w>l " quit window 
nnoremap <leader>ww <C-w>w<C-w>l " switch between windows
set splitright " open split vertial windows to the right of the current window

" JSON
au BufRead,BufNewFile *.json set ft=json syntax=javascript

" buffers - explore/next/previous: Alt-F12, F12, Shift-F12.
nnoremap <silent> <F10> :BufExplorer<CR>
nnoremap <silent> <F11> :bp<CR>
nnoremap <silent> <F12> :bn<CR>

" local dirs
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

" Avoid accidental hits of <F1> while aiming for <Esc>
map! <F1> <Esc>

" Use ,d (or ,dd or ,dj or 20,dd) to delete a line without adding it to the
" yanked stack (also, in visual mode)
nmap <silent> <leader>d "_d
vmap <silent> <leader>d "_d

" Restore cursor position upon reopening files
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

" ,bc to close the current buffer, but keep the window open
nmap <Leader>bc :Bclose<CR>
