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
    dependencies = {
      'williamboman/mason.nvim'
    }
  },

  -- COMPLETION:

  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'neovim/nvim-lspconfig',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip'
    }
  },

  -- TELESCOPE:

  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make'
      },
      'debugloop/telescope-undo.nvim'
    },
  },

  -- TREESITTER:

  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate'
  },

  -- VISUALS:

  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000
  },
  {
    'hoob3rt/lualine.nvim',
    dependencies = 'nvim-tree/nvim-web-devicons'
  },
  {
    'lewis6991/gitsigns.nvim',
    tag = 'release'
  },

  -- MISC:

  'tpope/vim-surround',
  'tpope/vim-fugitive',
  -- 'tpope/vim-abolish',
  {
    'stevearc/oil.nvim',
    dependencies = 'nvim-tree/nvim-web-devicons'
  },
  'folke/which-key.nvim',
  {
    'declancm/printf.nvim',
    dependencies = 'nvim-treesitter/nvim-treesitter'
  },
}, {
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

-- PLUGIN CONFIGS:

require('configs.lsp')
require('configs.telescope')
require('configs.treesitter')
require('configs.visuals')
require('configs.misc')
