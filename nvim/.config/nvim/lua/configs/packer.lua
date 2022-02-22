local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
end

return require("packer").startup(function()
  use("wbthomason/packer.nvim")

  -- DEPENDENCIES:
  use("neovim/nvim-lspconfig")
  use("nvim-lua/plenary.nvim")
  use("kyazdani42/nvim-web-devicons")

  -- LSP:
  use("jose-elias-alvarez/null-ls.nvim")
  use("tami5/lspsaga.nvim")
  use("folke/lsp-colors.nvim")

  -- COQ_COMPLETION:
  use({
    "ms-jpq/coq_nvim",
    branch = "coq",
    requires = { "ms-jpq/coq.artifacts", branch = "artifacts" },
  })

  -- TELESCOPE:
  use({
    "nvim-telescope/telescope.nvim",
    requires = {
      { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
      "jvgrootveld/telescope-zoxide",
    },
  })

  -- TREESITTER:
  use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
  -- use("nvim-treesitter/playground")
  use("ThePrimeagen/refactoring.nvim")
  use("p00f/nvim-ts-rainbow")

  -- VISUALS:
  use("navarasu/onedark.nvim")
  use({
    "folke/tokyonight.nvim",
    requires = {
      "folke/todo-comments.nvim",
      config = function()
        require("todo-comments").setup({})
      end,
    },
  })
  use("hoob3rt/lualine.nvim")
  use("dkarter/bullets.vim")
  use({
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup()
    end,
  })

  -- DEBUGGING:
  use("folke/trouble.nvim")
  use("mfussenegger/nvim-dap")
  use({
    "iamcco/markdown-preview.nvim",
    run = "cd app && yarn install",
  })

  -- GIT:
  use("airblade/vim-gitgutter")
  use({
    "tpope/vim-fugitive",
    requires = { "tpope/vim-rhubarb", "junegunn/gv.vim", "tpope/git-bump" },
  })

  -- MOVEMENT:
  use("machakann/vim-sandwich")
  use("unblevable/quick-scope")
  use("chaoren/vim-wordmotion")
  use("tpope/vim-abolish")

  -- MISCELLANEOUS:
  use({ "ms-jpq/chadtree", branch = "chad", run = "python3 -m chadtree deps" })
  use("mbbill/undotree")
  use("tpope/vim-obsession")
  use("akinsho/toggleterm.nvim")
  use({
    "b3nj5m1n/kommentary",
    config = function()
      vim.g.kommentary_create_default_mappings = false
    end,
  })

  -- MY_PLUGINS:
  use({
    "declancm/cinnamon-scroll",
    requires = "tpope/vim-repeat",
  })
  use("declancm/vim2vscode")
  use("declancm/git-scripts-vim")
end)
