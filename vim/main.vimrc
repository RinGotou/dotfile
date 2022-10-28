" Basic configuration
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

" Keymapping
nnoremap j <Up>
nnoremap k <Down>
nmap <C-s> :w<cr>
nnoremap q <Nop>
