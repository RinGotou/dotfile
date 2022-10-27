set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'ycm-core/YouCompleteMe'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" For vim-ruby
let g:ruby_indent_access_modifier_style = 'indent'

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
