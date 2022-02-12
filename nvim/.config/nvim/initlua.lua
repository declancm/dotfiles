vim.cmd("syntax on")

-- PRE_PLUGIN_COMMANDS:
vim.g.mapleader = "<BS>"
vim.opt.background = "dark"
vim.opt.completeopt = "menuone,noinsert,noselect"

vim.g.python3_host_prog = "/pin/python3"
vim.g.python_host_prog = "/pin/python2"

-- PACKER:
require("plugins")

-- PRE_PLUGIN_CONFIGS:
vim.cmd("source $HOME/.config/nvim/config/autocmd.vim")

require("lspconfig")
vim.cmd("source $HOME/.config/nvim/config/gitblame.vim")
require("coq")
require("treesitter")
require("telescope")
vim.cmd("source $HOME/.config/nvim/config/telescope.vim")
require("refactoring")
require("lspsaga")
require("trouble")
require("lualine")
require("kommentary")
require("toggleterm")
require("null-ls")
vim.cmd("source $HOME/.config/nvim/config/design.vim")
require("lspcolors")

-- POST_PLUGIN_CONFIGS:
vim.cmd("source $HOME/.config/nvim/config/keymaps.vim")
vim.cmd("source $HOME/.config/nvim/config/function-keymaps.vim")
vim.cmd("source $HOME/.config/nvim/config/plugin-keymaps.vim")

-- OPTIONS:
vim.opt.iskeyword -= '_'
vim.opt.backspace = 'indent,eol,start,nostop'
vim.opt.relativenumber = true
vim.opt.nu = true
vim.opt.nohlsearch = true
vim.opt.hidden = true
vim.opt.noerrorbells = true
vmi.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true -- or vim.opt.cindent = true
vim.opt.nowrap = true
vim.opt.smartcase = true
vim.opt.noswapfile = true
vim.opt.nobackup = true
vim.opt.undodir = "$HOME/.vim/undodir"
vim.opt.undofile = true
vim.opt.incsearch = true
vim.opt.termguicolors = true
vim.opt.scrolloff = '8'
vim.opt.showmode = true
vim.opt.signcolumn = 'yes'
vim.opt.textwidth = '0'
vim.opt.wrapmargin = '0'
vim.opt.cmdheight



-- " OPTIONS:
-- set iskeyword-=_ " add underscore as word delimiter
-- set backspace=indent,eol,start,nostop
-- set relativenumber
-- set nu " add line number to the current line
-- set nohlsearch
-- set hidden
-- set noerrorbells " silent
-- " set tabstop=4 softtabstop=4
-- " set shiftwidth=4
-- set expandtab
-- set autoindent
-- set smartindent " or 'set cindent'
-- set nowrap
-- set smartcase
-- set noswapfile
-- set nobackup
-- set undodir=~/.vim/undodir
-- set undofile
-- set incsearch " incremental search
-- set termguicolors " support true colors
-- set scrolloff=8
-- " set scrolloff=999
-- set showmode
-- set signcolumn=yes
-- set textwidth=0
-- set wrapmargin=0
-- set cmdheight=2 " space to show two messages
-- set updatetime=50
-- set shortmess+=ac
-- set modifiable
-- set splitbelow
-- set splitright
-- set pastetoggle=<F9>
-- set timeoutlen=500
-- set mouse=nvi " scrolling in normal, visual and insert modes
-- " set autoread

-- " for the :find command
-- set path+=**
-- set wildmode=longest,list,full
-- set wildmenu
-- set wildignore+=*.pyc
-- set wildignore+=*_build/*
-- set wildignore+=**/coverage/*
-- set wildignore+=**/node_modules/*
-- set wildignore+=**/android/*
-- set wildignore+=**/ios/*
-- set wildignore+=**/.git/*
