set go-=T " Hide toolbar on launch

set guifont=Monaco\ for\ Powerline:h13

" make the alt key behave as a meta key.
" this enables you to remap the alt key
set invmmta

" Command-t to open a new tab
macmenu &File.New\ Tab key=<nop>
map <D-t> :tabnew<CR>

" Remap <Cmd-P>
macmenu &File.Print key=<nop>
map <D-p> :GFiles<CR>

" Remap <Cmd-B>
macmenu &File.New\ Window key=<nop>
nmap <D-b> :NERDTreeToggle<CR>
nmap <D-n> :NERDTreeToggle<CR>

" Command-arrow to move between tabs;
nnoremap <D-right> :tabnext<CR>
nnoremap <D-left> :tabprevious<CR>

" Fullscreen takes up entire screen
set fuoptions=maxhorz,maxvert

" Command-Return for fullscreen
macmenu Window.Toggle\ Full\ Screen\ Mode key=<D-CR>
