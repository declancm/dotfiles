vim.opt.colorcolumn = "80"

-- ONEDARK:
-- vim.cmd([[colorscheme onedark]])
-- vim.cmd([[highlight ColorColumn ctermbg=0 guibg=#31353f]])

-- TOKYONIGHT:
vim.g.tokyonight_style = "storm"
vim.g.tokyonight_transparent = true
vim.g.tokyonight_italic_comments = false
vim.cmd([[colorscheme tokyonight]])
vim.cmd([[highlight ColorColumn ctermbg=0 guibg=#1f2335]])

-- vim.cmd([[highlight Normal guibg=none]])

-- -- cursor modes
-- vim.cmd([[
--   if &term =~ '^xterm'
--     let &t_EI .= "\<Esc>[0 q"
--     let &t_SI .= "\<Esc>[5 q"
--   endif
-- ]])

-- highlight the line number
vim.cmd([[highlight CursorLineNr guifg=white]])
vim.opt.cursorline = true
vim.opt.cursorlineopt = "number"

-- BULLETS:
vim.g.bullets_enabled_file_types = { "markdown", "text" }
vim.g.bullets_enable_in_empty_buffers = 0

-- QUICKSCOPE:
vim.g.qs_highlight_on_keys = { "f", "F", "t", "T" }
vim.g.qs_max_chars = 160

-- LSP_COLORS:
require("lsp-colors").setup({
  Error = "#db4b4b",
  Warning = "#e0af68",
  Information = "#0db9d7",
  Hint = "#10B981",
})
