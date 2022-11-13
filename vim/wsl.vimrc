call plug#begin()
Plug 'ycm-core/YouCompleteMe'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

" For vim-airline
let g:airline_theme = 'xtermlight'
let g:airline_section_z = '%l/%L, %P'

set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set autoindent
set cindent
set smartindent
syntax on
set nu!
filetype on

" For mysterious behavior about deleting a blank line on macOS
set backspace=indent,eol,start

nnoremap j <Up>
nnoremap k <Down>
nmap <C-s> :w<cr>

let g:mouse_toggle = 0

function ToggleMouse()
  if !g:mouse_toggle
    set mouse=a
    let g:mouse_toggle = 1
    echom "Mouse input enabled."
  else
    set mouse=
    let g:mouse_toggle = 0
    echom "Mouse input disabled."
  endif
endfunction

nnoremap q :call ToggleMouse()<Enter>

" For Windows Terminal shortcuts confliction.
nnoremap <C-A-v> <C-v>

" for Windows Terminal mouse scrolling
" set mouse=ni
" nnoremap <ScrollWheelUp> <Up>
" nnoremap <ScrollWheelDown> <Down>

let g:ycm_enable_diagnostic_highlighting = 0
