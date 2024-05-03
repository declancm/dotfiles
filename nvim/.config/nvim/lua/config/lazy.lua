-- Bootstrap
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Installing plugins.
require('lazy').setup('config.plugins', {
  dev = {
    path = '~/plugins',
    patterns = { 'declancm' },
    fallback = true,
  },
  install = {
    missing = false,
    colorscheme = { 'tokyonight', 'habamax' }
  }
})
