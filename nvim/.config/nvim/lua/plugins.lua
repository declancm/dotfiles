-- stylua: ignore start
local packer_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(packer_path)) > 0 then
  PackerBootstrap = vim.fn.system { 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', packer_path, }
end
-- stylua: ignore end

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  -- DEPENDENCIES:

  use 'nvim-lua/plenary.nvim'
  use 'kyazdani42/nvim-web-devicons'

  -- LSP:

  use 'neovim/nvim-lspconfig'
  use 'jose-elias-alvarez/null-ls.nvim'
  use {
    'ms-jpq/coq_nvim',
    branch = 'coq',
    requires = { { 'ms-jpq/coq.artifacts', branch = 'artifacts' } },
  }

  -- DEV:

  use 'mbbill/undotree'
  use 'folke/trouble.nvim'
  -- use 'mfussenegger/nvim-dap'
  use { 'iamcco/markdown-preview.nvim', run = 'cd app && yarn install' }
  use {
    'tpope/vim-fugitive',
    requires = { 'tpope/git-bump', 'junegunn/gv.vim' },
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

  -- VISUALS:

  use 'folke/tokyonight.nvim'
  use 'navarasu/onedark.nvim'
  use 'luisiacc/gruvbox-baby'
  use 'hoob3rt/lualine.nvim'
  use { 'lewis6991/gitsigns.nvim', tag = 'release' }
  use 'folke/todo-comments.nvim'
  use 'norcalli/nvim-colorizer.lua'

  -- SPEED:

  use 'machakann/vim-sandwich'
  use 'unblevable/quick-scope'
  use 'chaoren/vim-wordmotion'
  use 'dkarter/bullets.vim'
  use 'b3nj5m1n/kommentary'
  use 'arthurxavierx/vim-caser'

  -- MISC:

  use { 'ms-jpq/chadtree', branch = 'chad', run = 'python3 -m chadtree deps' }
  use 'tpope/vim-obsession'
  use 'tpope/vim-capslock'

  -- MY_PLUGINS:

  use { '~/Git/cinnamon-scroll', requires = 'tpope/vim-repeat' }
  -- use { 'declancm/cinnamon-scroll', requires = 'tpope/vim-repeat' }
  use '~/Git/vim2vscode'
  -- use 'declancm/vim2vscode'
  use '~/Git/git-scripts.nvim'
  -- use 'declancm/git-scripts.nvim'

  if PackerBootstrap then
    require('packer').sync()
  end
end)
