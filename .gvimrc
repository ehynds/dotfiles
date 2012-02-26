set go-=T " Hide toolbar on launch

set background=light
colorscheme solarized

" macvim options
if has("mac")
  set guifont=Monaco:h12

  " make the alt key behave as a meta key.
  " this enables you to remap the alt key
  set invmmta

  " command-t
  macmenu &File.New\ Tab key=<nop>

  " Command-t to open a new tab
  map <D-t> :tabnew<CR>

 " Fullscreen takes up entire screen
  set fuoptions=maxhorz,maxvert
 
  " Command-Return for fullscreen
  macmenu Window.Toggle\ Full\ Screen\ Mode key=<D-CR>
  
  " Command-arrow to move between tabs;
  " Command-down to open bufexplorer
  nnoremap <D-right> :tabnext<CR>
  nnoremap <D-left> :tabprevious<CR>
  nnoremap <D-down> :BuffergatorToggle<CR><CR>

  " NERD tree. Command-n to open
  macmenu &File.New\ Window key=<nop>
  nmap <D-n> :NERDTreeToggle<CR>

" linux options
elseif has("unix")
  set guifont="consolas 11"
  set clipboard=unnamed " allow copy/paste from system clipboard
  set lsp=3 " needs moar line spacing
endif
