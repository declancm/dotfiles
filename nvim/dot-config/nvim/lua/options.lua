-- OPTIONS:

vim.o.undofile = true
vim.o.relativenumber = true
vim.o.number = true
vim.o.signcolumn = 'yes'
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.wrap = false
vim.o.virtualedit = 'block'
vim.o.scrolloff = 8
vim.opt.backspace:append('nostop')
vim.o.updatetime = 1000
vim.o.timeoutlen = 300
vim.o.spell = true
vim.o.spelllang = 'en_us'
vim.o.modeline = false
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.opt.sessionoptions:remove('blank')
vim.o.pumheight = 8
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.showmode = false
vim.o.ruler = false
vim.opt.clipboard:append('unnamedplus')
vim.opt.completeopt = {
  'menu',
  'menuone',
  'preview',
  'noinsert',
  'noselect',
}

-- VARIABLES:

vim.g.mapleader = ' '
vim.g.persistoptions = {
  'makeprg',
  'errorformat',
  'tabstop',
  'softtabstop',
  'shiftwidth',
  'expandtab',
}
