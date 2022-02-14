vim.cmd("syntax on")

-- PRE_PLUGIN_COMMANDS:
vim.g.mapleader = "<BS>"
vim.opt.background = "dark"
vim.opt.completeopt = "menuone,noinsert,noselect"

vim.g.python3_host_prog = "/bin/python3"
vim.g.python_host_prog = "/bin/python2"

-- PACKER:
require("config.packer")

-- PRE_PLUGIN_CONFIGS:
vim.cmd("source $HOME/.config/nvim/config/autocmd.vim")

require("config.lspconfig")
vim.cmd("source $HOME/.config/nvim/config/gitblame.vim")
require("config.treesitter")
require("config.telescope")
vim.cmd("source $HOME/.config/nvim/config/telescope.vim")
require("config.refactoring")
require("config.lspsaga")
require("config.trouble")
require("config.lualine")
require("config.kommentary")
require("config.toggleterm")
require("config.null-ls")
vim.cmd("source $HOME/.config/nvim/config/design.vim")
require("config.lspcolors")

-- POST_PLUGIN_CONFIGS:
vim.cmd("source $HOME/.config/nvim/config/keymaps.vim")
vim.cmd("source $HOME/.config/nvim/config/function-keymaps.vim")
vim.cmd("source $HOME/.config/nvim/config/plugin-keymaps.vim")

-- OPTIONS:
vim.opt.iskeyword = vim.opt.iskeyword - "_"
vim.opt.backspace = "indent,eol,start,nostop"
vim.opt.relativenumber = true
vim.opt.nu = true
-- vim.opt.nohlsearch = true
vim.opt.hlsearch = false
vim.opt.hidden = true
vim.opt.errorbells = false
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true -- or vim.opt.cindent = true
vim.opt.wrap = false
vim.opt.smartcase = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = "$HOME/.vim/undodir"
vim.opt.undofile = true
vim.opt.incsearch = true
vim.opt.termguicolors = true
vim.opt.scrolloff = 8
vim.opt.showmode = true
vim.opt.signcolumn = "yes"
vim.opt.textwidth = 0
vim.opt.wrapmargin = 0
vim.opt.cmdheight = 2
vim.opt.updatetime = 50
vim.opt.shortmess = vim.opt.shortmess + "ac"
vim.opt.modifiable = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.pastetoggle = "<F9>"
vim.opt.timeoutlen = 500
vim.opt.mouse = "nvi"

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
