-- PLUGIN MANAGER:

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
require('lazy').setup({
  -- LSP:

  'neovim/nvim-lspconfig',
  {
    'williamboman/mason-lspconfig.nvim',
    dependencies = { 'williamboman/mason.nvim' },
  },
  'stevearc/conform.nvim',

  -- TELESCOPE:

  -- {
  --   'nvim-telescope/telescope.nvim',
  --   -- branch = '0.1.x', -- Latest release doesn't have the <c-r><c-w> mapping yet.
  --   dependencies = {
  --     'nvim-lua/plenary.nvim',
  --     {
  --       'nvim-telescope/telescope-fzf-native.nvim',
  --       build = 'make',
  --     },
  --   },
  -- },
  {
    'ibhagwan/fzf-lua',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
  },

  -- TREESITTER:

  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
  },

  -- VISUALS:

  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    config = function()
      vim.cmd.colorscheme('catppuccin')
    end,
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { { 'nvim-tree/nvim-web-devicons', config = true } },
  },
  {
    'lewis6991/gitsigns.nvim',
    tag = 'release',
  },

  -- MISC:

  'github/copilot.vim', -- Need to run `:Copilot setup` after installation.
  'akinsho/toggleterm.nvim',
  'kylechui/nvim-surround',
  {
    'stevearc/oil.nvim',
    dependencies = { { 'nvim-tree/nvim-web-devicons', config = true } },
  },
  'folke/which-key.nvim',
  'folke/flash.nvim',
  {
    'declancm/printf.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
  },
  'declancm/maximize.nvim',
  'declancm/cinnamon.nvim',
}, {
  dev = {
    path = '~/plugins',
    patterns = { 'declancm' },
    fallback = true,
  },
})

-- PLUGIN CONFIGS:

require('configs.lsp')
-- require('configs.telescope')
require('configs.fzf')
require('configs.treesitter')
require('configs.visuals')
require('configs.misc')
