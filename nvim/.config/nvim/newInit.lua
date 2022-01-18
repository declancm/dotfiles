syntax on

-- pre plugin commands
set background=dark
set completeopt=menuone,noinsert,noselect

require('plugins')

vim.g.python3_host_prog = '/bin/python3'
vim.g.python_host_prog = '/bin/python2'

vim.o.backspace="indent,eol,start,nostop"
vim.o.relativenumber
vim.o.nu
vim.o.nohlsearch
vim.o.hidden
vim.o.noerrorbells
vim.o.tabstop=4 softtabstop=4
vim.o.shiftwidth=4
vim.o.expandtab
vim.o.smartindent
vim.o.nowrap
vim.o.smartcase
vim.o.noswapfile
vim.o.nobackup
vim.o.undodir=~/.vim/undodir
vim.o.undofile
vim.o.incsearch
vim.o.termguicolors
vim.o.scrolloff=8
vim.o.showmode
vim.o.signcolumn=yes
vim.o.textwidth=0
vim.o.wrapmargin=0
vim.o.cmdheight=2
vim.o.updatetime=50
vim.o.shortmess+=c
vim.o.modifiable
vim.o.splitbelow
vim.o.splitright
vim.o.pastetoggle=<F9>
vim.o.timeoutlen=500
