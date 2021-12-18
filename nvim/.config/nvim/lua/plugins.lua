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
  use {
    'hrsh7th/nvim-cmp',
    config = function() vim.cmd('luafile $HOME/.config/nvim/config/cmp.lua') end,
    requires = {
      'hrsh7th/cmp-nvim-lsp', 'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path', 'hrsh7th/cmp-cmdline',
      'onsails/lspkind-nvim', {'tzachar/cmp-tabnine', run = './install.sh'},
      'saadparwaiz1/cmp_luasnip', 'l3mon4d3/luasnip',
      'rafamadriz/friendly-snippets', 'windwp/nvim-autopairs'
    }
  }

  -- coc completion
  use {
    'neoclide/coc.nvim',
    branch = 'master',
    run = 'yarn install --frozen-lockfile',
    ft = {'ps1', 'markdown', 'cmake'},
    requires = {'SirVer/ultisnips', 'honza/vim-snippets'},
    config = function()
      vim.cmd('source $HOME/.config/nvim/config/coc.vim')
      require('cmp').setup.buffer { enabled = false }
    end
  }
  -- use 'wellle/tmux-complete.vim'

  -- coq completion
  -- use {'ms-jpq/coq_nvim', branch = 'coq'}
  -- use {'ms-jpg/coq.artifacts', branch = 'artifacts'}
  -- -- use {'ms-jpg/coq.thirdparty', branch = '3p'}

  -- file tree
  use {
    'ms-jpq/chadtree',
    branch = 'chad',
    run = 'python3 -m chadtree deps'
  }
  -- commenting
  use {
    'b3nj5m1n/kommentary',
    config = function() vim.g.kommentary_create_default_mappings = false end
  }
  -- treesitter
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
  use 'nvim-treesitter/playground'
  use 'simrat39/symbols-outline.nvim'
  -- undo tree
  use 'mbbill/undotree'
  -- git
  use 'tpope/vim-fugitive'
  use 'tpope/vim-rhubarb'
  use 'junegunn/gv.vim'
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
  use {
    'norcalli/nvim-colorizer.lua',
    config = function() require'colorizer'.setup() end
  }
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
  -- use 'tpope/vim-rails'
  use 'tpope/vim-dispatch'
  use 'vim-utils/vim-man'
  use {
    'iamcco/markdown-preview.nvim',
    run = 'cd app && yarn install',
    -- config = function() vim.g.mkdp_auto_start = 1 end
  }

end)
