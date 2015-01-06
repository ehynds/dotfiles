set nocompatible
filetype off

" Vundle
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

" Bundles
Bundle 'gmarik/Vundle.vim'
Bundle 'ctrlpvim/ctrlp.vim'
Bundle 'mbbill/undotree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'sickill/vim-pasta'
Bundle 'kshenoy/vim-signature'
Bundle 'gregsexton/MatchTag'
Bundle 'Raimondi/delimitMate'
Bundle 'bling/vim-airline'
Bundle 'editorconfig/editorconfig-vim'
Bundle 'junegunn/vim-easy-align'
Bundle 'Shougo/neosnippet'
Bundle 'Shougo/neocomplete'
Bundle 'mileszs/ack.vim'
Bundle 'marijnh/tern_for_vim'
Bundle 'matchit.zip'
Bundle 'BufOnly.vim'
Bundle 'Rename2'

" Language bundles
Bundle 'ehynds/vim-javascript'
Bundle 'jelera/vim-javascript-syntax'
Bundle 'mustache/vim-mustache-handlebars'
Bundle 'othree/html5.vim'
Bundle 'tpope/vim-haml'
Bundle 'ap/vim-css-color'
Bundle 'groenewege/vim-less'
Bundle 'nelstrom/vim-markdown-folding'
Bundle 'plasticboy/vim-markdown'
" Bundle 'digitaltoad/vim-jade'

" Colorschemes
Bundle 'nanotech/jellybeans.vim'
Bundle 'ajh17/Spacegray.vim'
Bundle 'altercation/vim-colors-solarized'

" Turn this back on after all bundles have been loaded
call vundle#end()
filetype plugin indent on

" =============================================================================
" Syntax/colorscheme
" =============================================================================

syntax on
set background=light
let g:solarized_termcolors=256
let g:solarized_visibility="low"

if has("gui_running")
  colorscheme solarized
  " colorscheme spacegray
else
  colorscheme jellybeans
endif

" =============================================================================
" History / Undo
" =============================================================================

set history=1000    " Increase history from 20
set undofile        " Persistent unto
set undolevels=5000 " Number of changes that can be undone
set backup          " Backup the file during writes
set noswapfile      " Don't create swap files
set backupdir=~/.vim/tmp/backups
set undodir=~/.vim/tmp/undo

" Make those folders automatically if they don't already exist.
if !isdirectory(expand(&undodir))
  call mkdir(expand(&undodir), "p")
endif
if !isdirectory(expand(&backupdir))
  call mkdir(expand(&backupdir), "p")
endif

" =============================================================================
" Basic settings
" =============================================================================

let mapleader = ","

set ignorecase                 " Ignore case in searches set smartcase " ...unless a capitol letter is used
set backspace=indent,eol,start " Intuitive backspacing in insert mode
set encoding=utf-8 nobomb      " Disable that bom
set incsearch                  " Highlight dynamically as pattern is typed.
set hlsearch                   " highlight all occurrences of a search
set laststatus=2               " Always show status line
set noshowmode                 " Hide the default mode text (e.g. -- INSERT -- below the statusline)
set nowrap                     " Do not wrap lines.
set title                      " Show the filename in the window titlebar.
set scrolloff=3                " Start scrolling when within 3 lines near the top/bottom
set sidescrolloff=10           " Start scrolling X lines before vertical border of window
set showmode                   " show the current mode
set showcmd                    " show the command being executed
set hidden                     " When a buffer is brought to foreground remember marks/undo history
set relativenumber             " use relative line numbers
set visualbell                 " Use visual bell instead of audible
set cursorline                 " Highlight current line
set ttyfast                    " Send more chars at a given time
set ruler                      " Show the cursor position
set number                     " Enable line numbers
set shortmess=atI              " Don't show intro message when starting Vim
set lsp=4                      " more line spacing
set synmaxcol=256              " Don't try to highlight lines >256 chars
set colorcolumn=81             " Visually show a line at the 81st column

" Diff
set diffopt=filler  " Add vertical spaces to keep right and left aligned
set diffopt+=iwhite " Ignore whitespace changes (focus on code changes)

" Wildmenu completion
set completeopt=longest,menuone
set wildmenu                                                                     " Enhance command line completion
set wildmode=list:longest                                                        " Complete until the point of ambiguity
set wildignore+=*.ico,*.jpg,*.bmp,*.gif,*.png,*.jpeg,*.psd                       " Images
set wildignore+=*.zip,*.exe                                                      " Binaries
set wildignore+=.git,.svn                                                        " SCM
set wildignore+=.tmp,.trash,.orig,.DS_Store
set wildignore+=*node_modules/*,.sass-cache,*bower_components/*,*.min.js,*dist/* " Front-end stuff
set wildignore+=*.pbxproj,*.xcodeproj/**,*.xcassets/**                           " XCode

" white space / tab options
set list
set listchars=tab:▸\ ,trail:·
set autoindent    " retain indentation on next line
set expandtab     " expand tab to spaces
set smarttab      " use shiftwidth setting instead of tabstop setting when pressing tab on the beginning of a new line
set shiftwidth=2  " auto-indent amount when using cindent, >>, << and stuff like that
set softtabstop=2 " when hitting tab or backspace, how many spaces should a tab be (see expandtab)
set copyindent    " copy the structure of the existing lines indent when autocompleting a new line
set shiftround    " round indent as a multiple of shiftwidth
set nojoinspaces  " Use only 1 space after "." when joining lines instead of 2
set breakindent   " TODO

" Delete comment character when joining commented lines
set formatoptions+=j

" slam the j and k keys in any order to GTFO
inoremap jk <Esc>
inoremap kj <Esc>
inoremap jj <Esc>
inoremap kk <Esc>

" Don't move on *
nnoremap * *<c-o>

" Keep movements in the middle of the window
nnoremap g; g;zz " Jump backwards through changes
nnoremap g, g,zz " Jump forwards through changes
nnoremap <c-i> <c-i>zz
nnoremap <c-o> <c-o>zz

" Resize splits when the window is resized
au VimResized * :wincmd =

" Code folding
set foldmethod=indent
set foldlevel=99
set nofoldenable " disable folding on file open
nnoremap <space> za " space to toggle folds
vnoremap <space> zf " space to toggle folds

" Insert a new line and return to normal mode on enter
nnoremap <CR> o<Esc>

" Disable ex mode
nnoremap Q <Nop>

" Easier tab movement in linux
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

" Work with splits a bit easier
set splitbelow " open split horizontal windows below current window
set splitright " open split vertical windows to the right of the current window
" nnoremap <leader>ws <C-w>v<C-w>l " new vertical
" nnoremap <leader>wh <C-w>s<C-w>l " new horizontal
nnoremap <leader>wq <C-w>q<C-w>l " quit window

" Create a split on the given side.
" From http://technotales.wordpress.com/2010/04/29/vim-splits-a-guide-to-doing-exactly-what-you-want/ via joakimk.
nmap <leader><left>   :leftabove  vsp<CR>
nmap <leader><right>  :rightbelow vsp<CR>
nmap <leader><up>     :leftabove  sp<CR>
nmap <leader><down>   :rightbelow sp<CR>

" Jump around splits with the arrow keys
nnoremap <silent> <Right> <c-w>l
nnoremap <silent> <Left> <c-w>h
nnoremap <silent> <Up> <c-w>k
nnoremap <silent> <Down> <c-w>j

" Use ,d (or ,dd or ,dj or 20,dd) to delete a line without adding it to the
" yanked stack (also, in visual mode)
nnoremap <silent> <leader>d "_d
vnoremap <silent> <leader>d "_d

" better key movement
noremap j gj
noremap k gk

" Yank from cursor to end of line
nnoremap Y y$

" Restore cursor position upon reopening files
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

" ,bc to close the current buffer, but keep the window open
nnoremap <leader>bc :bprevious<CR>:bdelete #<CR>

" Sudo write (,W)
noremap <leader>W :w !sudo tee %<CR>

" Clean trailing whitespace
nnoremap <leader>w mz:%s/\s\+$//<cr>:let @/=''<cr>`z

" Command typos
command! -bang E e<bang>
command! -bang Q q<bang>
command! -bang W w<bang>
command! -bang QA qa<bang>
command! -bang Qa qa<bang>
command! -bang Wa wa<bang>
command! -bang WA wa<bang>
command! -bang Wq wq<bang>
command! -bang WQ wq<bang>

" Clear the last search
nnoremap <silent> <leader>c :noh<CR>

" =============================================================================
" Plugin settings
" =============================================================================

" Ack
nnoremap <leader>a :Ack!

" Easy motion
let g:EasyMotion_smartcase = 1

" Bufonly
nnoremap <leader>bo :BufOnly<CR>

" Delimitmate
let delimitMate_expand_cr = 1
let delimitMate_balance_matchpairs = 1

" Neosnippet
let g:neosnippet#enable_snipmate_compatibility = 1
let g:neosnippet#snippets_directory='~/.vim/snippets'
let g:neosnippet#disable_runtime_snippets = { '_' : 1 }
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
      \ "\<Plug>(neosnippet_expand_or_jump)"
      \: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
      \ "\<Plug>(neosnippet_expand_or_jump)"
      \: "\<TAB>"

" Neocomplete
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 0
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#enable_auto_select = 1
let g:neocomplete#disable_auto_complete = 1
let g:neocomplete#enable_refresh_always = 1
if !exists('g:neocomplete#keyword_patterns')
  let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Indent guides
let g:indent_guides_color_change_percent = 2
let g:indent_guides_auto_colors = 1
nmap <Leader>ie :IndentGuidesEnable<CR>
nmap <Leader>id :IndentGuidesDisable<CR>
if has("gui_running")
  let g:indent_guides_enable_on_vim_startup = 1
endif

" NERDCommenter
let NERDSpaceDelims=1
let NERDCompactSexyComs=1

" NERDTree
nnoremap <Leader>nf :NERDTreeFind<CR> " open a tree with the current file as context
let NERDTreeQuitOnOpen=1          " quit once opening a file
let NERDTreeHighlightCursorline=1 " highlight the selected entry in the tree
let NERDTreeShowHidden=1          " show hidden files
if has("unix")
  nnoremap <silent> <c-n> :NERDTreeToggle<CR>
endif

" Undotree
nnoremap <F7> :UndotreeToggle<CR>

" Easy align
vnoremap <silent> <Enter> :EasyAlign<Enter>

" Airline
let g:airline_theme = 'powerlineish'
let g:airline#extensions#hunks#enabled = 0
let g:airline#extensions#branch#empty_message = "No SCM"
if(has("gui_running"))
  let g:airline_powerline_fonts = 1
endif

" vim-javascript
let g:html_indent_inctags = "body,head,tbody,embed"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"

" Ctrl+p
nnoremap <leader>t :CtrlP<CR>
nnoremap <leader>m :CtrlPMRUFiles<CR>
nnoremap <leader>bl :CtrlPBuffer<CR>
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_jump_to_buffer = 0
let g:ctrlp_show_hidden = 1
let g:ctrlp_max_height = 25
let g:ctrlp_prompt_mappings = {
  \ 'AcceptSelection("h")': ['<c-h>'],
  \}

" =============================================================================
" Filetype settings
" =============================================================================

" Markdown/text files
au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn,txt} setf markdown
au FileType markdown setlocal wrap spell linebreak formatoptions=t1 textwidth=80

" Commit message editing
au BufNewFile,BufRead COMMIT_EDITMSG set spell

" JSON
au BufRead,BufNewFile *.json setf javascript

" ZSH
au BufRead,BufNewFile .zsh_rc,.functions,.commonrc setf zsh

" JavaScript-specific code folding
au FileType javascript setlocal foldmethod=marker
au FileType javascript setlocal foldmarker={,}
au FileType javascript setlocal omnifunc=tern#Complete

" =============================================================================
" Functions
" =============================================================================

" Blink current match, and keep the movement in the middle of the window
" https://github.com/noahfrederick/dots/blob/83f0fbbed475769324d3c39e87e54aae1bba60fc/vim/plugin/blink_search.vim
nnoremap <silent> n nzzzv:call <SID>BlinkCurrentMatch()<CR>
nnoremap <silent> N Nzzzv:call <SID>BlinkCurrentMatch()<CR>
function! s:BlinkCurrentMatch()
  let target = '\c\%#'.@/
  let match = matchadd('IncSearch', target)
  redraw
  sleep 100m
  call matchdelete(match)
  redraw
endfunction

" HTML tag closing
" inserts the appropriate closing HTML tag; used for the \hc operation defined
" above;
" requires ignorecase to be set, or to type HTML tags in exactly the same case
" that I do;
" doesn't treat <P> as something that needs closing;
" clobbers register z and mark z
" by Smylers  http://www.stripey.com/vim/ 2000 May 3
inoremap <C-_> <space><bs><esc>:call InsertCloseTag()<cr>a
function! InsertCloseTag()

    " list of tags which shouldn't be closed:
    let UnaryTags = ' Area Base Br DD DT HR Img Input LI Link Meta P Param '

    " remember current position:
    normal mz

    " loop backwards looking for tags:
    let Found = 0
    while Found == 0
      " find the previous <, then go forwards one character and grab the first
      " character plus the entire word:
      execute "normal ?\<LT>\<CR>l"
      normal "zyl
      let Tag = expand('<cword>')

      " if this is a closing tag, skip back to its matching opening tag:
      if @z == '/'
        execute "normal ?\<LT>" . Tag . "\<CR>"

      " if this is a unary tag, then position the cursor for the next
      " iteration:
      elseif match(UnaryTags, ' ' . Tag . ' ') > 0
        normal h

      " otherwise this is the tag that needs closing:
      else
        let Found = 1

      endif
    endwhile " not yet found match

    " create the closing tag and insert it:
    let @z = '</' . Tag . '>'
    normal `z"zp==
endfunction " InsertCloseTag()
