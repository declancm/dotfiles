require 'nvim-treesitter.configs'.setup {
    ensure_installed = "all",
    highlight = {
        enable = true,
        disable = {},
    },
    indent = {
        enable = false, --an experimental feature
        disable = {},
    },
    rainbow = {
        enable = true,
        extended_mode = true,
        max_file_lines = nil
    --     colors = {
    --         "#50fa7b", --Add these colours to: '$HOME/.vim/plugged/nvim-ts-rainbow/lua/rainbow/colors.lua'
    --         "#FF79C6",
    --         "#F1FA8C",
    --         "#8BE9FD"
    --     },
    --     termcolors = {
    --         "#50fa7b",
    --         "#FF79C6",
    --         "#F1FA8C",
    --         "#8BE9FD"
    --     }
    }
}

