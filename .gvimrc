set go-=T " Hide toolbar on launch
set background=light
set guifont=Monaco:h12

" macvim only
if has("gui_macvim")

  " command-t
  macmenu &File.New\ Tab key=<nop>
  map <D-t> :CommandT<CR>

 " Fullscreen takes up entire screen
  set fuoptions=maxhorz,maxvert
 
  " Command-Return for fullscreen
  macmenu Window.Toggle\ Full\ Screen\ Mode key=<D-CR>
  
  " Command-arrow to move between buffers
  nnoremap <D-right> :bn<CR>
  nnoremap <D-left> :bp<CR>
  nnoremap <D-down> :BufExplorer<CR>

  " NERD tree. Command-n to open
  macmenu &File.New\ Window key=<nop>
  nmap <D-n> :NERDTreeToggle<CR>
endif
