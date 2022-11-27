set encoding=utf8
:colorscheme shine

call plug#begin()
Plug 'nvim-lua/plenary.nvim'
Plug 'Shatur/neovim-session-manager'
Plug 'nvim-tree/nvim-tree.lua'
Plug 'ycm-core/YouCompleteMe'
Plug 'feline-nvim/feline.nvim'
call plug#end()

lua << EOF
-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

require('feline').setup()
require('feline').winbar.setup()

-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
      },
    },
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})
EOF

set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set autoindent
set cindent
set smartindent
set hlsearch
syntax on
set nu!
filetype on

" For mysterious behavior about deleting a blank line on macOS
set backspace=indent,eol,start

" Keymapping
nnoremap j <Up>
nnoremap k <Down>
nmap <C-s> :w<cr>
nmap <F2> :NvimTreeToggle<cr>
let g:mouse_toggle = 1
set mouse=a

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

set completeopt=menu,menuone
let g:ycm_add_preview_to_completeopt=0
let g:ycm_confirm_extra_conf=0

highlight PMenu ctermfg=0 ctermbg=69 guifg=black guibg=LightCyan
highlight PMenuSel ctermfg=15 ctermbg=8 guifg=white guibg=grey

let g:ycm_semantic_triggers =  {
  \   'c' : ['->', '.'],
  \   'objc' : ['->', '.', 're!\[[_a-zA-Z]+\w*\s', 're!^\s*[^\W\d]\w*\s',
  \             're!\[.*\]\s'],
  \   'ocaml' : ['.', '#'],
  \   'cpp,objcpp' : ['->', '.', '::'],
  \   'perl' : ['->'],
  \   'php' : ['->', '::'],
  \   'cs,java,javascript,typescript,d,python,perl6,scala,vb,elixir,go' : ['.'],
  \   'ruby' : ['.', '::'],
  \   'lua' : ['.', ':'],
  \   'erlang' : [':'],
  \ }

let g:ycm_semantic_triggers =  {
			\ 'c,cpp,rust,python,java,go,erlang,perl': ['re!\w{2}'],
			\ 'cs,lua,javascript': ['re!\w{2}'],
			\ }
