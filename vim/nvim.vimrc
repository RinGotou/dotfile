set encoding=utf8

call plug#begin()
Plug 'nvim-lua/plenary.nvim'
Plug 'Shatur/neovim-session-manager'
Plug 'nvim-tree/nvim-tree.lua'
Plug 'feline-nvim/feline.nvim'
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'MunifTanjim/nui.nvim'
Plug 'VonHeikemen/fine-cmdline.nvim'
Plug 'nvim-zh/colorful-winsep.nvim'
Plug 'nvim-tree/nvim-web-devicons'
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
  update_focused_file = {
    enable = true,
    update_root = true,
  },
})

require("colorful-winsep").setup({
  -- highlight for Window separator
  highlight = {
    bg = "#EFF1F5",
    fg = "#4C4F69",
  },
  -- timer refresh rate
  interval = 30,
  -- This plugin will not be activated for filetype in the following table.
  no_exec_files = { "packer", "TelescopePrompt", "mason", "CompetiTest", "NvimTree" },
  -- Symbols for separator lines, the order: horizontal, vertical, top left, top right, bottom left, bottom right.
  symbols = { "━", "┃", "┏", "┓", "┗", "┛" },
  close_event = function()
    -- Executed after closing the window separator
  end,
  create_event = function()
    -- Executed after creating the window separator
  end,
})

local function open_nvim_tree()

  -- open the tree
  require("nvim-tree.api").tree.open()
end

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
vim.api.nvim_set_keymap('n', ':', '<cmd>FineCmdline<CR>', {noremap = true})
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
nnoremap <F2> :NvimTreeToggle<cr>
nnoremap <F3> :SessionManager load_session<cr>
nnoremap <F4> :SessionManager delete_session<cr>
nnoremap <C-A-Q> :q<cr>
nnoremap <A-`> <C-w>w
nnoremap <A-1> :NvimTreeToggle<cr>
nnoremap <A-2> :SessionManager load_session<cr>
nnoremap <A-3> :SessionManager delete_session<cr>
nnoremap <A-4> :set hlsearch!<cr>
nnoremap <A-0> i
inoremap <A-0> <Esc>
noremap <A-Left> <C-w>>
noremap <A-Right> <C-w><
noremap <A-Up> <C-w>-
noremap <A-Down> <C-w>+
nnoremap <A-/> :tabnew<cr>
nnoremap <A-,> gT
nnoremap <A-.> gt
nnoremap <A-'> :tabclose<cr>

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

" nnoremap q :call ToggleMouse()<Enter>
nnoremap q <Nop>
vnoremap q <Nop>
" nnoremap <2-LeftMouse> i

set completeopt=menu,menuone
let g:ycm_add_preview_to_completeopt=0
let g:ycm_confirm_extra_conf=0

highlight PMenu ctermfg=0 ctermbg=69 guifg=black guibg=LightCyan
highlight PMenuSel ctermfg=15 ctermbg=8 guifg=white guibg=grey

function! s:disable_italic()
  let his = ''
  redir => his
  silent hi
  redir END
  let his = substitute(his, '\n\s\+', ' ', 'g')
  for line in split(his, "\n")
    if line !~ ' links to ' && line !~ ' cleared$'
      exe 'hi' substitute(substitute(line, ' xxx ', ' ', ''), 'italic', 'none', 'g')
    endif
  endfor
endfunction

if has('win32')
  call s:disable_italic()
endif
