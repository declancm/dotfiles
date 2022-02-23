vim.opt.background = 'dark'
vim.opt.colorcolumn = '80'

-- ONEDARK:
-- require("onedark").setup({
--   style = "darker",
--   transparent = true,
--   code_style = {
--     comments = "none",
--   },
-- })
-- vim.cmd([[colorscheme onedark]])
-- vim.cmd([[highlight ColorColumn ctermbg=0 guibg=#31353f]])

-- TOKYONIGHT:
vim.g.tokyonight_style = 'storm'
vim.g.tokyonight_transparent = true
vim.g.tokyonight_italic_comments = false
vim.cmd [[colorscheme tokyonight]]
vim.cmd [[highlight ColorColumn ctermbg=0 guibg=#1f2335]]

-- highlight the line number
vim.cmd [[highlight CursorLineNr guifg=white]]
vim.opt.cursorline = true
vim.opt.cursorlineopt = 'number'

-- BULLETS:
vim.g.bullets_enabled_file_types = { 'markdown', 'text' }
vim.g.bullets_enable_in_empty_buffers = 0

-- QUICKSCOPE:
vim.g.qs_highlight_on_keys = { 'f', 'F', 't', 'T' }
vim.g.qs_max_chars = 160

-- LSP_COLORS:
require('lsp-colors').setup {
  Error = '#db4b4b',
  Warning = '#e0af68',
  Information = '#0db9d7',
  Hint = '#10B981',
}

-- LUALINE:
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'tokyonight', --onedark, tokyonight
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
    disabled_filetypes = {},
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'branch' },
    lualine_c = { 'filename' },
    lualine_x = {
      {
        'diagnostics',
        sources = { 'nvim_diagnostic' },
        symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' },
      },
      'encoding',
      'filetype',
    },
    lualine_y = { 'progress' },
    lualine_z = { 'location' },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { 'filename' },
    lualine_x = { 'location' },
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {},
  extensions = { 'fugitive' },
}
