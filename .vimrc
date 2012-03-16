set nocompatible

" pathogen
filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
filetype plugin indent on

" set syntax highlighting options
syntax on
set t_Co=256
let g:solarized_termcolors=256
let g:solarized_visibility="low"
colorscheme jellybeans

" remap leader
let mapleader = ","

" slam the j and k keys in any order to GTFO
inoremap jk <Esc>
inoremap kj <Esc>

" Keep search matches in the middle of the window and pulse the line
" when moving to them.
nnoremap n nzzzv
nnoremap N Nzzzv

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
set wildignore+=*.ico,*.jpg,*.bmp,*.gif,*.png,*.jpeg,*.zip,.git
set visualbell
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set number
set linespace=1
set shortmess=a

" status line (if powerline is not available)
set statusline=%<%f\ %y" file name and type
set statusline+=%h%w%m%r " flags
set statusline+=[%{strlen(&fenc)?&fenc:'none'}] " encoding
set statusline+=%=L:%l/%L " right align; current line/total lines
set statusline+=\ (%p%%) " percent complete
set statusline+=\ C:%c%V " character
set statusline+=\ %{fugitive#statusline()}
set statusline+=%* " switch to normal status line

" white space / tab options
set list
set listchars=tab:▸\ ,trail:·
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
let g:indent_guides_color_change_percent = 2
let g:indent_guides_auto_colors = 1
nmap <Leader>ie :IndentGuidesEnable<CR>
nmap <Leader>id :IndentGuidesDisable<CR>
if has("gui_running")
  let g:indent_guides_enable_on_vim_startup = 1
endif

" code folding
set foldmethod=indent
set foldnestmax=2
nnoremap <space> za
vnoremap <space> zf
set nofoldenable " disable folding on file open

" set relative line numbers
set relativenumber " Use relative line numbers. Current line is still in status bar.
au BufReadPost * set relativenumber

" insert a new line and return to normal mode on enter
" backspace deletes current char in normal mode
nnoremap <CR> o<Esc>
nnoremap <BS> x

" NERDCommenter
let NERDSpaceDelims=1
let NERDCompactSexyComs=1

" NERDTree
nmap <Leader>nf :NERDTreeFind<CR> " open a tree with the current file as context
let NERDTreeQuitOnOpen=1 " quit once opening a file
let NERDTreeHighlightCursorline=1 " highlight the selected entry in the tree
if has("unix")
  nmap <silent> <c-n> :NERDTreeToggle<CR>
endif

" Sparkup
let g:sparkupNextMapping = '<leader>nt'

" Gundo
nnoremap <F7> :GundoToggle<CR>

" Ack
map <leader>a :Ack! 

" Powerline
if has("unix")
  " assume I'm not using a patched font on linux
  let g:Powerline_symbols = 'unicode'
endif
if has("mac")
  let g:Powerline_symbols = 'fancy'
endif

" show marks
let g:showmarks_include="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ."
nmap <Leader>mc :ShowMarksClearAll<CR>
nmap <Leader>md :ShowMarksClearMark<CR>

" Ctrl+p
let g:ctrlp_map = '<leader>t'
let g:ctrlp_working_path_mode = 0
let g:ctrlp_jump_to_buffer = 0

" buffergator
let g:buffergator_suppress_keymaps=1
let g:buffergator_sort_regime="mru"
if has("unix")
  nnoremap <c-down> :BuffergatorToggle<CR>
endif

" tabs in linux
if has("unix")
  nnoremap <c-right> :tabnext<CR>
  nnoremap <c-left> :tabprev<CR>
  nnoremap <c-t> :tabnew<CR>
endif

" Toggle spell check
nnoremap <silent> <leader>s :set spell!<CR>

" F1 key to display the full pathname of the
" current buffer in all modes
nnoremap <silent> <F1> :echo expand("%:p")<CR>
inoremap <silent> <F1> :echo expand("%:p")<CR>
vnoremap <silent> <F1> :echo expand("%:p")<CR>

" work with splits a bit easier
set splitright " open split vertical windows to the right of the current window
set splitbelow
nnoremap <leader>ws <C-w>v<C-w>l " new vertical
nnoremap <leader>wh <C-w>s<C-w>l " new horizontal
nnoremap <leader>wq <C-w>q<C-w>l " quit window 

" Jump around splits with the arrow keys
nnoremap <silent> <Right> <c-w>l
nnoremap <silent> <Left> <c-w>h
nnoremap <silent> <Up> <c-w>k
nnoremap <silent> <Down> <c-w>j

" set file types
au BufRead,BufNewFile *.json set ft=javascript
au BufRead,BufNewFile *.cfm,*.cfc set ft=html sw=4 ts=4 noexpandtab

" Use ,d (or ,dd or ,dj or 20,dd) to delete a line without adding it to the
" yanked stack (also, in visual mode)
nmap <silent> <leader>d "_d
vmap <silent> <leader>d "_d

" // to search for highlighted text in visual mode
vmap // y/<C-R>"<CR>

" better key movement
noremap j gj
noremap k gk

" Yank from cursor to end of line
nnoremap Y y$

" Restore cursor position upon reopening files
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

" ,bc to close the current buffer, but keep the window open
nmap <leader>bc :bprevious<CR>:bdelete #<CR>
nmap <leader>bo :BufOnly<CR> " close all other buffers but this one

" Sudo write (,W)
noremap <leader>W :w !sudo tee %<CR>

" command abbreviations
ca W w
ca Q q
ca Wq wq
ca Qq qa

" double tap esc to clear last search
nnoremap <silent> <Esc> :noh<CR><Esc>

" auto reload vimrc when editing
autocmd! BufWritePost .vimrc source %

" use 4-space soft tabs for sass files so I can actually read them.
autocmd BufRead,BufNewFile *.sass setlocal shiftwidth=4 tabstop=4 softtabstop=4
