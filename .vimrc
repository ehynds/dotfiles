set nocompatible

" pathogen
filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
filetype plugin indent on

" set syntax highlighting options
set background=light
set t_Co=256
let g:solarized_termcolors=256 " for terminal vim
let g:solarized_visibility="low"
syntax on
colorscheme solarized

" remap leader
let mapleader = ","

" slam the j and k keys in any order to GTFO
inoremap jk <Esc>
inoremap kj <Esc>

" ignore case in searches
set ignorecase
set smartcase

" history / backup
set history=1000 " Increase history from 20 
set undofile
set undolevels=500
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
set scrolloff=3 " start scrolling when within 3 lines near the top/bottom
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
set linespace=1

" status line
set statusline=%<%f\ %h%w%m%r%y%=L:%l/%L\ (%p%%)\ C:%c%V\ B:%o
set statusline+=%#warningmsg#
set statusline+=%*

" white space / tab options
set list
set listchars=tab:▸\ ,trail:.
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab " expand tab to spaces
set smarttab
set autoindent
set copyindent

" Local dirs
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
set undodir=~/.vim/undo

" indent guides
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_color_change_percent = 2
nmap <Leader>ie :IndentGuidesEnable<CR>
nmap <Leader>id :IndentGuidesDisable<CR>

" Fix indent guides when used in the terminal.
" https://github.com/nathanaelkane/vim-indent-guides/issues/24
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=black
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=darkgrey

" code folding
set foldmethod=indent " fold based on indent
set foldnestmax=10 " deepest fold is 10 levels
set nofoldenable " don't fold by default

" set relative line numbers
set relativenumber " Use relative line numbers. Current line is still in status bar.
au BufReadPost * set relativenumber

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

" Gundo
nnoremap <F7> :GundoToggle<CR>

" Ack
map <leader>a :Ack! 

" work with windows a bit easier
nnoremap <leader>ws <C-w>v<C-w>l " new vertical
nnoremap <leader>wh <C-w>s<C-w>l " new horizontal
nnoremap <leader>wq <C-w>q<C-w>l " quit window 
nnoremap <leader>ww <C-w>w<CR> " switch between windows
set splitright " open split vertial windows to the right of the current window
set splitbelow " ditto for horizontals
noremap <C-h> <C-w>h " jump around splits with ctrl+hjkl
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" JSON
au BufRead,BufNewFile *.json set ft=json syntax=javascript

" buffers - explore/next/previous: Alt-F12, F12, Shift-F12.
" in vim for win/linux, use function keys to move buffers.
" I'll use the command+arrow keys in macvim
if !has("mac")
  nnoremap <F10> :BufExplorer<CR>
  nnoremap <F11> :bp<CR>
  nnoremap <F12> :bn<CR>
endif

" show marks
let g:showmarks_include="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ."
nmap <Leader>mc :ShowMarksClearAll<CR>
nmap <Leader>md :ShowMarksClearMark<CR>
" let g:wokmarks_do_maps=0
" nmap <Leader>mm <Plug>ToggleMarkWok :DoShowMarks<CR> " set a mark and refresh (or show) the marks bar 
" nmap <Leader>md <Plug>KillMarksWok :DoShowMarks<CR> " remove all marks, toggle marks bar
" nmap <F5> <Plug>PrevMarkWok
" nmap <F6> <Plug>NextMarkWok

" tag list
map <F8> :TlistToggle<CR>
let Tlist_Use_Right_Window=1 
let Tlist_GainFocus_On_ToggleOpen=1
let list_Show_One_File = 1

" Avoid accidental hits of <F1> while aiming for <Esc>
map! <F1> <Esc>

" Use ,d (or ,dd or ,dj or 20,dd) to delete a line without adding it to the
" yanked stack (also, in visual mode)
nmap <silent> <leader>d "_d
vmap <silent> <leader>d "_d

" better movement
noremap j gj
noremap k gk

" Restore cursor position upon reopening files
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

" ,bc to close the current buffer, but keep the window open
nmap <Leader>bc :Bclose<CR>
nmap <Leader>bc! :Bclose!<CR>

" Faster split resizing (+,-)
if bufwinnr(1)
  map + <C-W>+
  map - <C-W>-
endif

" Sudo write (,W)
noremap <leader>W :w !sudo tee %<CR>

" Remap :W to :w
command W w

" double tap esc to clear last search
nnoremap <silent> <Esc> :noh<CR><Esc>

" Fix page up and down
map <PageUp> <C-U>
map <PageDown> <C-D>
imap <PageUp> <C-O><C-U>
imap <PageDown> <C-O><C-D>

" move a line of text using ALT+[jk], indent with ALT+[hl]
nnoremap <A-j> :m+<CR>
nnoremap <A-k> :m-2<CR>
nnoremap <A-h> <<
nnoremap <A-l> >>
inoremap <A-j> <Esc>:m+<CR>==gi
inoremap <A-k> <Esc>:m-2<CR>==gi
inoremap <A-h> <Esc><<`]a
inoremap <A-l> <Esc>>>`]a
vnoremap <A-j> :m'>+<CR>gv=gv
vnoremap <A-k> :m-2<CR>gv=gv
vnoremap <A-h> <gv
vnoremap <A-l> >gv

" auto reload vimrc when editing
autocmd! BufWritePost .vimrc source %
