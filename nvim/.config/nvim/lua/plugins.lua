return require('packer').startup(function()

  use 'wbthomason/packer.nvim'
  -- telescope requirements
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'}
  use 'nvim-telescope/telescope.nvim'
  -- "Plug 'nvim-telescope/telescope-fzy-native.nvim'
  -- lsp
  use 'neovim/nvim-lspconfig'
  -- " Plug 'nvim-lua/lsp_extensions.nvim'
  use 'tami5/lspsaga.nvim'
  -- " snippets

  -- cmp completion
  -- use {
  --   'saadparwaiz1/cmp_luasnip',
  --   requires = {'L3MON4D3/LuaSnip', 'rafamadriz/friendly-snippets'}
  -- }
  -- use 'hrsh7th/cmp-nvim-lsp'
  -- use 'hrsh7th/cmp-buffer'
  -- use 'hrsh7th/cmp-path'
  -- use 'hrsh7th/cmp-cmdline'
  -- use 'hrsh7th/nvim-cmp'
  -- use 'onsails/lspkind-nvim'
  -- use {'tzachar/cmp-tabnine', run = './install.sh'}

  -- coc completion
  -- use {
  --   'neoclide/coc.nvim',
  --   branch = 'master',
  --   run = 'yarn install --frozen-lockfile'
  -- }
  -- -- use 'wellle/tmux-complete.vim'

  -- coq completion
  use {'ms-jpg/coq_nvim', branch = 'coq'}
  use {'ms-jpg/coq.artifacts', branch = 'artifacts'}
  use {'ms-jpg/coq.thirdparty', branch = '3p'}

  -- commenting
  use 'b3nj5m1n/kommentary'
  -- treesitter
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
  use 'nvim-treesitter/playground'
  use 'simrat39/symbols-outline.nvim'
  -- undo tree
  use 'mbbill/undotree'
  -- git
  use 'tpope/vim-fugitive'
  use 'tpope/vim-rhubarb'
  use 'f-person/git-blame.nvim'
  -- theme and colors
  use 'navarasu/onedark.nvim'
  -- Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
  -- Plug 'tiagovla/tokyodark.nvim'
  use 'Mofiqul/dracula.nvim'
  -- Plug 'marko-cerovac/material.nvim'
  -- " Plug 'christianchiarulli/nvcode-color-schemes.vim'
  use 'hoob3rt/lualine.nvim'
  use 'kyazdani42/nvim-web-devicons'
  use 'p00f/nvim-ts-rainbow'
  -- " Plug 'folke/todo-comments.nvim'
  use 'norcalli/nvim-colorizer.lua'
  -- " Plug 'folke/lsp-colors.nvim'
  -- debugging
  -- " Plug 'puremourning/vimspector'
  -- miscellaneous
  use 'szw/vim-maximizer'
  use 'unblevable/quick-scope'
  use 'tpope/vim-obsession'
  use 'folke/trouble.nvim'
  use 'dkarter/bullets.vim'
  use 'tpope/vim-surround'
  use 'tpope/vim-rails'
  use 'tpope/vim-dispatch'

end)
