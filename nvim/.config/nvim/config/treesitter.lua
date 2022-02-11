require("nvim-treesitter.configs").setup({
  ensure_installed = "maintained",
  highlight = {
    enable = true,
    disable = {},
  },
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = nil,
    -- colors = {
    --     "#50fa7b", --Add these colours to: '$HOME/.vim/plugged/nvim-ts-rainbow/lua/rainbow/colors.lua'
    --     "#FFB86C",
    --     "#8BE9FD",
    --     "#FF79C6"
    -- },
    -- termcolors = {
    --     "#50fa7b",
    --     "#FFB86C",
    --     "#8BE9FD",
    --     "#FF79C6"
    -- }
  },
})
