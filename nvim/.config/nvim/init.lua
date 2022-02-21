vim.opt.syntax = "on"

-- Python.
vim.g.python3_host_prog = "/bin/python3"
vim.g.python_host_prog = "/bin/python2"

-- Mapping the <leader> key for all keymaps.
vim.cmd([[let mapleader = "\<BS>"]])

-- Autocommands.
vim.cmd([[source $HOME/.config/nvim/vimscript/autocmd.vim]])

-- Packer.
require("configs.packer")

-- PLUGIN_CONFIGS:
require("configs.lsp")
require("configs.treesitter")
require("configs.telescope")
require("configs.refactoring")
require("configs.trouble")
require("configs.kommentary")
require("configs.toggleterm")
require("configs.null-ls")
require("configs.design")
require("configs.my-plugins")

-- KEYMAPS:
require("configs.keymaps")
require("configs.function-keymaps")
require("configs.plugin-keymaps")

-- OPTIONS:
vim.opt.iskeyword = vim.opt.iskeyword - "_"
vim.opt.backspace = { "indent", "eol", "start", "nostop" }
vim.opt.relativenumber = true
vim.opt.nu = true
vim.opt.hlsearch = false
vim.opt.hidden = true
vim.opt.errorbells = false
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
-- vim.opt.cindent = true
vim.opt.wrap = false
vim.opt.smartcase = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = vim.fn.stdpath("config") .. "/undodir"
vim.opt.undofile = true
vim.opt.incsearch = true
vim.opt.termguicolors = true
vim.opt.scrolloff = 8
-- vim.opt.scrolloff = 999
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

-- The ':find' command.
vim.opt.path = vim.opt.path + "**"
vim.opt.wildmode = { "longest", "list", "full" }
vim.opt.wildmenu = true
vim.opt.wildignore = {
  "*.pyc",
  "*_build/*",
  "**/coverage/*",
  "**/node_modules/*",
  "**/android/*",
  "**/ios/*",
  "**/.git/*",
}
