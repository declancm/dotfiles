syntax on

" pre plugin commands
let mapleader = "\<BS>"
set background=dark
set completeopt=menuone,noinsert,noselect

let g:python3_host_prog = '/bin/python3'
let g:python_host_prog = '/bin/python2'

" packadd packer.nvim

lua require('plugins')

" PRE_PLUGIN_CONFIGS:
source $HOME/.config/nvim/config/autocmd.vim

" PLUGIN_CONFIGURATIONS:
source $HOME/.config/nvim/config/gitblame.vim
luafile $HOME/.config/nvim/config/lspconfig.lua
source $HOME/.config/nvim/config/lspconfig.vim
" luafile $HOME/.config/nvim/config/coq.lua
luafile $HOME/.config/nvim/config/treesitter.lua
luafile $HOME/.config/nvim/config/telescope.lua
source $HOME/.config/nvim/config/telescope.vim
" luafile $HOME/.config/nvim/config/refactoring.lua
luafile $HOME/.config/nvim/config/lspsaga.lua
source $HOME/.config/nvim/config/lspsaga.vim
" luafile $HOME/.config/nvim/config/cmp.lua
" source $HOME/.config/nvim/config/coc.vim
luafile $HOME/.config/nvim/config/trouble.lua
luafile $HOME/.config/nvim/config/lualine.lua
luafile $HOME/.config/nvim/config/kommentary.lua
source $HOME/.config/nvim/config/design.vim
" luafile $HOME/.config/nvim/config/lspcolors.lua
luafile $HOME/.config/nvim/config/toggleterm.lua

" POST_PLUGIN_CONFIGS:
source $HOME/.config/nvim/config/keymaps.vim
" source $HOME/.config/nvim/config/commands.vim

" OPTIONS:
set iskeyword-=_ " add underscore as word delimiter
set backspace=indent,eol,start,nostop
set relativenumber
set nu
set nohlsearch
set hidden
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smartindent " or 'set cindent'
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
set timeoutlen=500

" for the :find command
set path+=**
set wildmode=longest,list,full
set wildmenu
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=**/coverage/*
set wildignore+=**/node_modules/*
set wildignore+=**/android/*
set wildignore+=**/ios/*
set wildignore+=**/.git/*

