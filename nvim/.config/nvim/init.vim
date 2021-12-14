syntax on

" for the :find command
" set path+=**
" set wildignore+=*.pyc
" set wildignore+=*_build/*
" set wildignore+=**/coverage/*
" set wildignore+=**/node_modules/*
" set wildignore+=**/android/*
" set wildignore+=**/ios/*
" set wildignore+=**/.git/*

" pre plugin commands
lua vim.g.kommentary_create_default_mappings = false
set background=dark
set completeopt=menuone,noinsert,noselect

let g:python3_host_prog = '/bin/python3'
let g:python_host_prog = '/bin/python2'

packadd packer.nvim

lua require('plugins')

source $HOME/.config/nvim/plug-config/autocmd.vim
source $HOME/.config/nvim/plug-config/keymaps.vim
source $HOME/.config/nvim/plug-config/git.vim
source $HOME/.config/nvim/plug-config/quickscope.vim
luafile $HOME/.config/nvim/plug-config/lspconfig.lua
source $HOME/.config/nvim/plug-config/lspconfig.vim
luafile $HOME/.config/nvim/plug-config/treesitter.lua
source $HOME/.config/nvim/plug-config/treesitter.vim
luafile $HOME/.config/nvim/plug-config/telescope.lua
source $HOME/.config/nvim/plug-config/telescope.vim
" luafile $HOME/.config/nvim/plug-config/refactoring.lua
luafile $HOME/.config/nvim/plug-config/lspsaga.lua
source $HOME/.config/nvim/plug-config/lspsaga.vim
luafile $HOME/.config/nvim/plug-config/cmp.lua
" source $HOME/.config/nvim/plug-config/coc.vim
" source $HOME/.config/nvim/plug-config/coc-ultisnips.vim
luafile $HOME/.config/nvim/plug-config/symbols.lua
source $HOME/.config/nvim/plug-config/symbols.vim
luafile $HOME/.config/nvim/plug-config/trouble.lua
luafile $HOME/.config/nvim/plug-config/lualine.lua
luafile $HOME/.config/nvim/plug-config/kommentary.lua
source $HOME/.config/nvim/plug-config/design.vim
" luafile $HOME/.config/nvim/plug-config/lspcolors.lua

lua require'colorizer'.setup()

" set wildmode=longest,list,full
" set wildmenu
" set backspace=indent,eol,start
set relativenumber
set nu
set nohlsearch
set hidden
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set termguicolors
set scrolloff=8
set showmode
set signcolumn=yes
set textwidth=0
set wrapmargin=0
set cmdheight=2
set updatetime=50
set shortmess+=c
set modifiable
set splitbelow
set splitright
set pastetoggle=<F9>
