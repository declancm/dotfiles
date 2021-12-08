syntax on

" for the :find command
set path+=**
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=**/coverage/*
set wildignore+=**/node_modules/*
set wildignore+=**/android/*
set wildignore+=**/ios/*
set wildignore+=**/.git/*

" setting up vim plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" pre plugin commands
lua vim.g.kommentary_create_default_mappings = false
set background=dark

let g:python3_host_prog = '/bin/python3'
let g:python_host_prog = '/bin/python2'

call plug#begin('~/.vim/plugged')
" telescope requirements
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
"Plug 'nvim-telescope/telescope-fzy-native.nvim'
" lsp
Plug 'neovim/nvim-lspconfig'
" Plug 'nvim-lua/lsp_extensions.nvim'
" snippets
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'rafamadriz/friendly-snippets'
Plug 'tami5/lspsaga.nvim'
" completion
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'onsails/lspkind-nvim'
Plug 'tzachar/cmp-tabnine', { 'do': './install.sh' }
" commenting
Plug 'b3nj5m1n/kommentary'
" treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'
Plug 'simrat39/symbols-outline.nvim'
" undo tree
Plug 'mbbill/undotree'
" git
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'f-person/git-blame.nvim'
" theme and colors
Plug 'navarasu/onedark.nvim'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'tiagovla/tokyodark.nvim'
Plug 'Mofiqul/dracula.nvim'
Plug 'marko-cerovac/material.nvim'
" Plug 'christianchiarulli/nvcode-color-schemes.vim'
Plug 'hoob3rt/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'p00f/nvim-ts-rainbow'
Plug 'folke/todo-comments.nvim'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'folke/lsp-colors.nvim'
" debugging
" Plug 'puremourning/vimspector'
" miscellaneous
Plug 'szw/vim-maximizer'
Plug 'unblevable/quick-scope'
Plug 'tpope/vim-obsession'
Plug 'folke/trouble.nvim'
Plug 'dkarter/bullets.vim'
Plug 'tpope/vim-surround'
" Plug 'tpope/vim-rails'
Plug 'tpope/vim-dispatch'
" Plug 'ThePrimeagen/refactoring.nvim"
" Plug 'ThePrimeagen/vim-be-good'
call plug#end()

source $HOME/.config/nvim/plug-config/autocmd.vim
source $HOME/.config/nvim/plug-config/keymaps.vim
source $HOME/.config/nvim/plug-config/git.vim
source $HOME/.config/nvim/plug-config/quickscope.vim
luafile $HOME/.config/nvim/plug-config/lspconfig.lua
source $HOME/.config/nvim/plug-config/lspconfig.vim
source $HOME/.config/nvim/plug-config/design.vim
luafile $HOME/.config/nvim/plug-config/treesitter.lua
source $HOME/.config/nvim/plug-config/treesitter.vim
luafile $HOME/.config/nvim/plug-config/telescope.lua
source $HOME/.config/nvim/plug-config/telescope.vim
" luafile $HOME/.config/nvim/plug-config/refactoring.lua
luafile $HOME/.config/nvim/plug-config/cmp.lua
luafile $HOME/.config/nvim/plug-config/lspkind.lua
luafile $HOME/.config/nvim/plug-config/lspsaga.lua
source $HOME/.config/nvim/plug-config/lspsaga.vim
luafile $HOME/.config/nvim/plug-config/symbols.lua
source $HOME/.config/nvim/plug-config/symbols.vim
luafile $HOME/.config/nvim/plug-config/trouble.lua
luafile $HOME/.config/nvim/plug-config/lualine.lua
luafile $HOME/.config/nvim/plug-config/kommentary.lua
luafile $HOME/.config/nvim/plug-config/lspcolors.lua
" luafile $HOME/.config/nvim/plug-config/todo.lua

lua require'colorizer'.setup()

set wildmode=longest,list,full
set wildmenu
set backspace=indent,eol,start
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
set completeopt=menuone,noinsert,noselect
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
