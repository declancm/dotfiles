-- stylua: ignore start
local fn = vim.fn
local install_path = fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system { 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path, }
end
-- stylua: ignore end

return require('packer').startup(function()
  use 'wbthomason/packer.nvim'

  -- DEPENDENCIES:
  use 'nvim-lua/plenary.nvim'
  use 'kyazdani42/nvim-web-devicons'

  -- LSP:
  use 'neovim/nvim-lspconfig'
  use {
    'ms-jpq/coq_nvim',
    branch = 'coq',
    requires = { 'ms-jpq/coq.artifacts', branch = 'artifacts' },
  }
  use 'jose-elias-alvarez/null-ls.nvim'
  use 'tami5/lspsaga.nvim'
  use 'folke/lsp-colors.nvim'

  -- DEBUGGING:
  use 'folke/trouble.nvim'
  use 'mfussenegger/nvim-dap'
  use 'mbbill/undotree'
  use {
    'iamcco/markdown-preview.nvim',
    run = 'cd app && yarn install',
  }

  -- TELESCOPE:
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
      'jvgrootveld/telescope-zoxide',
    },
  }

  -- TREESITTER:
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'ThePrimeagen/refactoring.nvim'

  -- TERMINAL:
  use 'akinsho/toggleterm.nvim'

  -- VISUALS:
  use 'folke/tokyonight.nvim'
  use 'navarasu/onedark.nvim'
  use 'hoob3rt/lualine.nvim'
  use {
    'ms-jpq/chadtree',
    branch = 'chad',
    run = 'python3 -m chadtree deps',
  }
  use {
    'folke/todo-comments.nvim',
    config = function()
      require('todo-comments').setup()
    end,
  }
  use {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require('colorizer').setup()
    end,
  }

  -- INSERT:
  use 'dkarter/bullets.vim'
  use 'b3nj5m1n/kommentary'

  -- GIT:
  use {
    'lewis6991/gitsigns.nvim',
    tag = 'release',
    config = function()
      require('gitsigns').setup {
        signs = {
          add = { text = '+' },
          change = { text = '~' },
          changedelete = { hl = 'GitSignsDelete', numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn' },
        },
      }
    end,
  }
  use {
    'tpope/vim-fugitive',
    requires = { 'tpope/vim-rhubarb', 'junegunn/gv.vim', 'tpope/git-bump' },
  }

  -- MOVEMENT:
  use 'machakann/vim-sandwich'
  use {
    'unblevable/quick-scope',
    config = function()
      vim.g.qs_highlight_on_keys = { 'f', 'F', 't', 'T' }
      vim.g.qs_max_chars = 160
    end,
  }
  use 'chaoren/vim-wordmotion'

  -- MISCELLANEOUS:
  use 'tpope/vim-abolish'
  use 'tpope/vim-obsession'

  -- MY_PLUGINS:
  use {
    '~/Git/cinnamon-scroll',
    requires = 'tpope/vim-repeat',
  }
  use '~/Git/vim2vscode'
  use '~/Git/git-scripts.nvim'
end)
