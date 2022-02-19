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
  -- use({
  --   "neovim/nvim-lspconfig",
  --   config = function()
  --     vim.cmd("source $HOME/.config/nvim/config/lspconfig.lua")
  --   end,
  -- })
  use("tami5/lspsaga.nvim")
  use("folke/lsp-colors.nvim")

  -- COQ_COMPLETION:
  use({
    "ms-jpq/coq_nvim",
    branch = "coq",
    requires = { "ms-jpq/coq.artifacts", branch = "artifacts" },
  })

  -- -- CMP_COMPLETION:
  -- use({
  --   "hrsh7th/nvim-cmp",
  --   config = function()
  --     vim.cmd("source $HOME/.config/nvim/config/cmp.lua")
  --   end,
  --   requires = {
  --     "hrsh7th/cmp-nvim-lsp",
  --     "hrsh7th/cmp-buffer",
  --     "hrsh7th/cmp-path",
  --     "hrsh7th/cmp-cmdline",
  --     { "tzachar/cmp-tabnine", run = "./install.sh" },
  --     "saadparwaiz1/cmp_luasnip",
  --     "l3mon4d3/luasnip",
  --     "rafamadriz/friendly-snippets",
  --     -- "windwp/nvim-autopairs",
  --   },
  -- })

  -- -- COC_COMPLETION:
  -- use({
  --   "neoclide/coc.nvim",
  --   branch = "release",
  --   ft = { "ps1", "markdown", "cmake" },
  --   requires = {
  --     "SirVer/ultisnips",
  --     "honza/vim-snippets",
  --   },
  --   config = function()
  --     vim.cmd("source $HOME/.config/nvim/config/coc.vim")
  --     require("cmp").setup.buffer({ enabled = false })
  --   end,
  -- })

  -- MY_PLUGINS:
  use("declancm/cinnamon-scroll")
  use("declancm/vim2vscode")
  use("declancm/git-scripts-vim")

  -- TELESCOPE:
  use({
    "nvim-telescope/telescope.nvim",
    requires = {
      { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
    },
  })

  -- FILE_TREE:
  use({
    "ms-jpq/chadtree",
    branch = "chad",
    run = "python3 -m chadtree deps",
    config = function()
      local chadtree_settings = {
        ["theme.text_colour_set"] = "solarized_light",
        ["options.session"] = false,
        ["options.close_on_open"] = true,
      }
      vim.api.nvim_set_var("chadtree_settings", chadtree_settings)
    end,
  })

  -- COMMENTS:
  use({
    "b3nj5m1n/kommentary",
    config = function()
      vim.g.kommentary_create_default_mappings = false
    end,
  })

  -- TREESITTER:
  use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
  -- use("nvim-treesitter/playground")
  use("ThePrimeagen/refactoring.nvim")
  use("p00f/nvim-ts-rainbow")

  -- DESIGN:
  use({
    "navarasu/onedark.nvim",
    config = function()
      require("onedark").setup({
        style = "darker",
        transparent = true,
        code_style = {
          comments = "none",
        },
      })
    end,
  })
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
  -- use "mfussenegger/nvim-dap"

  -- DEV:
  use({
    "iamcco/markdown-preview.nvim",
    run = "cd app && yarn install",
  })

  -- GIT:
  use("airblade/vim-gitgutter")
  use({
    "tpope/vim-fugitive",
    requires = { "tpope/vim-rhubarb", "junegunn/gv.vim" },
  })
  use("f-person/git-blame.nvim")

  -- FORMAT:
  use("jose-elias-alvarez/null-ls.nvim")

  -- MOVEMENT:
  use("machakann/vim-sandwich")
  -- use("tpope/vim-surround")
  use("unblevable/quick-scope")
  use("chaoren/vim-wordmotion")
  use("tpope/vim-abolish")

  -- MISCELLANEOUS:
  use("mbbill/undotree")
  use("szw/vim-maximizer")
  use("tpope/vim-obsession")
  use("akinsho/toggleterm.nvim")
  -- use "tpope/vim-dispatch"
end)
