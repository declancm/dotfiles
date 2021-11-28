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
        max_file_lines = nil,
        colors = {
            "#69FF94",
            "#FF92DF",
            "#FFFFA5",
            "#A4FFFF"
        },
        termcolors = {
            "#69FF94",
            "#FF92DF",
            "#FFFFA5",
            "#A4FFFF"
        }
    }
}

