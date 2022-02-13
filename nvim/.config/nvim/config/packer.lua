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

  -- MY_PLUGINS:
  use("declancm/vim2vscode")
  -- use({ "declancm/vim2vscode", branch = "test" })
  -- use "declancm/git-scripts-vim"

  -- TELESCOPE:
  use({
    "nvim-telescope/telescope.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
    },
  })

  -- LSP:
  use("neovim/nvim-lspconfig")
  use("tami5/lspsaga.nvim")

  -- CMP_COMPLETION:
  use({
    "hrsh7th/nvim-cmp",
    config = function()
      vim.cmd("luafile $HOME/.config/nvim/config/cmp.lua")
    end,
    requires = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      -- "onsails/lspkind-nvim",
      { "tzachar/cmp-tabnine", run = "./install.sh" },
      "saadparwaiz1/cmp_luasnip",
      "l3mon4d3/luasnip",
      "rafamadriz/friendly-snippets",
      -- "windwp/nvim-autopairs",
    },
  })

  -- COC_COMPLETION:
  use({
    "neoclide/coc.nvim",
    -- branch = "master",
    -- run = "yarn install --frozen-lockfile",
    branch = "release",
    ft = { "ps1", "markdown", "cmake" },
    requires = { "SirVer/ultisnips", "honza/vim-snippets" },
    config = function()
      vim.cmd("source $HOME/.config/nvim/config/coc.vim")
      require("cmp").setup.buffer({ enabled = false })
    end,
  })
  -- use("wellle/tmux-complete.vim")

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

  -- UNDO_TREE:
  use("mbbill/undotree")

  -- GIT:
  use("tpope/vim-fugitive")
  use("airblade/vim-gitgutter")
  -- use("tpope/vim-rhubarb")
  use("junegunn/gv.vim")
  use("f-person/git-blame.nvim")

  -- DESIGN:
  -- use({
  --   "navarasu/onedark.nvim",
  --   config = function()
  --     require("onedark").setup({
  --       style = "darker",
  --       transparent = true,
  --       code_style = {
  --         comments = "none",
  --       },
  --     })
  --   end,
  -- })
  use({
    "folke/tokyonight.nvim",
    requires = {
      "folke/todo-comments.nvim",
      config = function()
        require("todo-comments").setup({})
      end,
    },
  })
  -- use "tiagovla/tokyodark.nvim"
  -- use "Mofiqul/dracula.nvim"
  use("folke/lsp-colors.nvim")
  use({
    "hoob3rt/lualine.nvim",
    requires = "kyazdani42/nvim-web-devicons",
  })
  use("dkarter/bullets.vim")
  use("p00f/nvim-ts-rainbow")
  use({
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup()
    end,
  })

  -- DEBUGGING:
  use("folke/trouble.nvim")
  -- use "mfussenegger/nvim-dap"
  -- use("simrat39/symbols-outline.nvim")
  use("ThePrimeagen/refactoring.nvim")

  -- DEV:
  use({
    "iamcco/markdown-preview.nvim",
    run = "cd app && yarn install",
    config = function()
      vim.g.mkdp_auto_start = 1
    end,
  })

  -- LINTERS:
  -- black, prettier, clang_format
  use("jose-elias-alvarez/null-ls.nvim")

  -- MOVEMENT:
  use("tpope/vim-surround")
  -- use("machakann/vim-sandwhich")
  use("unblevable/quick-scope")
  -- use("justinmk/vim-sneak")
  -- w, b and e work with camelCase
  use("chaoren/vim-wordmotion")

  -- MISCELLANEOUS:
  use("szw/vim-maximizer")
  -- use({
  --   "karb94/neoscroll.nvim",
  --   config = function()
  --     require("neoscroll").setup()
  --   end,
  -- })
  use("tpope/vim-obsession")
  -- use "tpope/vim-rails"
  -- use "tpope/vim-dispatch"
  use("akinsho/toggleterm.nvim")
  -- use({
  --   "folke/which-key.nvim",
  --   config = function()
  --     require("which-key").setup({})
  --   end,
  -- })
end)
