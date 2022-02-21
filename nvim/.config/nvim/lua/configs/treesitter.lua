require("nvim-treesitter.configs").setup({
  ensure_installed = "maintained",
  highlight = {
    enable = true,
    disable = {},
    -- use treesitter with 'syntax on'
    -- additional_vim_regex_highlighting = true,
  },
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = nil,
    -- Add these colours to: '$HOME/.local/share/nvim/site/pack/packer/start/nvim-ts-rainbow/lua/rainbow/colors.lua'
    -- colors = {
    --   "#50fa7b",
    --   "#FFB86C",
    --   "#8BE9FD",
    --   "#FF79C6",
    -- },
    -- termcolors = {
    --   "#50fa7b",
    --   "#FFB86C",
    --   "#8BE9FD",
    --   "#FF79C6",
    -- },
  },
})
