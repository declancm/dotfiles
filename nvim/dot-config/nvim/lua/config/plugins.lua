return {
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
    build = ':TSUpdate',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects'
    }
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

  -- 'chaoren/vim-wordmotion',
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
}
