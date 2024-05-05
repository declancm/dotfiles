return {
  -- LSP:

  'neovim/nvim-lspconfig',               -- collection of lsp configurations
  {
    'williamboman/mason-lspconfig.nvim', -- automatic LSP
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

  'ibhagwan/fzf-lua',

  {
    'nvim-telescope/telescope.nvim', -- fuzzy finder
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
    'nvim-treesitter/nvim-treesitter', -- tree-sitter in neovim
    build = ':TSUpdate',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects' -- syntax aware text-objects
    }
  },

  -- VISUALS:

  {
    'folke/tokyonight.nvim', -- colorscheme
    lazy = false,
    priority = 1000
  },
  {
    'hoob3rt/lualine.nvim', -- better status line
    dependencies = 'nvim-tree/nvim-web-devicons'
  },
  {
    'lewis6991/gitsigns.nvim', -- git column icons
    tag = 'release'
  },
  'folke/zen-mode.nvim',

  -- MISC:

  -- 'chaoren/vim-wordmotion', -- camel case, snake case etc. become separate words
  'tpope/vim-surround',    -- change surrounding chars
  'tpope/vim-fugitive',    -- Git wrapper
  'tpope/vim-abolish',     -- word coercion, better substitution and better abbreviation
  'numToStr/Comment.nvim', -- comments
  {
    'stevearc/oil.nvim',   -- file explorer
    dependencies = 'nvim-tree/nvim-web-devicons'
  },
  'folke/which-key.nvim',
  {
    'declancm/printf.nvim',
    dependencies = 'nvim-treesitter/nvim-treesitter'
  },
}
