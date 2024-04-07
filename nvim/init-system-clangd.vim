set encoding=utf8

call plug#begin()
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-tree/nvim-tree.lua'
Plug 'feline-nvim/feline.nvim'
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'MunifTanjim/nui.nvim'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'ycm-core/YouCompleteMe'
call plug#end()

colorscheme catppuccin-latte " catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha

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
  disable_netrw = true,
  hijack_cursor = true,
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
  update_focused_file = {
    enable = true,
    update_root = true,
  },
})


-- local function open_nvim_tree()
-- 
--   -- open the tree
--   require("nvim-tree.api").tree.open()
-- end
-- 
-- vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
-- TODO: Rewrite keymapping to lua
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
nnoremap <C-s> <Esc>:w<cr>
nnoremap <C-A-Q> :q<cr>
nnoremap <A-`> <cmd>FineCmdline<cr>YcmCompleter GoTo
nnoremap <A-1> :NvimTreeToggle<cr>
nnoremap <A-2> :set hlsearch!<cr>
nnoremap <A-3> :set incsearch!<cr>
nnoremap <A-7> :YcmCompleter GoTo<cr>
nnoremap <A-8> :YcmCompleter GoToCallers<cr>
nnoremap <A-9> :YcmCompleter GoToReferences<cr>
noremap <A-Left> <C-w>>
noremap <A-Right> <C-w><
noremap <A-Up> <C-w>-
noremap <A-Down> <C-w>+
nnoremap <A-/> :tabnew<cr>
nnoremap <A-,> gT
nnoremap <A-.> gt
nnoremap <A-;> :tabclose<cr>

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

nnoremap q :call ToggleMouse()<cr>
vnoremap q :call ToggleMouse()<cr>

set completeopt=menu,menuone
let g:ycm_add_preview_to_completeopt=0
let g:ycm_confirm_extra_conf=0
let g:ycm_use_clangd = 1
let g:ycm_clangd_binary_path = '/usr/bin/clangd'
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

highlight PMenu ctermfg=0 ctermbg=69 guifg=black guibg=LightCyan
highlight PMenuSel ctermfg=15 ctermbg=8 guifg=white guibg=grey
