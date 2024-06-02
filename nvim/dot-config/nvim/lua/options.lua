-- OPTIONS:

vim.opt.undofile = true
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.signcolumn = 'yes'
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.wrap = false
vim.opt.virtualedit = 'block'
vim.opt.scrolloff = 8
vim.opt.backspace:append('nostop')
vim.opt.updatetime = 1000
vim.opt.timeoutlen = 300
vim.opt.spell = true
vim.opt.spelllang = 'en_us'
vim.opt.modeline = false
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.sessionoptions:remove('blank')
vim.opt.pumheight = 8
vim.opt.showmode = false
vim.opt.ruler = false
vim.opt.clipboard:append('unnamedplus')

-- VARIABLES:

vim.g.mapleader = ' '
vim.g.persistoptions = {
  'makeprg',
  'errorformat',
  'tabstop',
  'softtabstop',
  'shiftwidth',
  'expandtab'
}
