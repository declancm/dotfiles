-- FIX: fix the issue with gruvbox and init.lua.
-- TODO: add option to cycle backgrounds in windows terminal. Use background image which cycles?

-- THEME:
-- local theme = 'tokyonight'
local theme = 'onedark'
-- local theme = 'gruvbox'

vim.opt.background = 'dark'
vim.opt.colorcolumn = '80'

-- TOKYONIGHT:
if theme == 'tokyonight' then
  vim.g.tokyonight_style = 'storm'
  vim.g.tokyonight_transparent = true
  vim.g.tokyonight_italic_comments = false
  vim.cmd [[colorscheme tokyonight]]
  vim.cmd [[highlight ColorColumn ctermbg=0 guibg=#1f2335]]
end

-- ONEDARK:
if theme == 'onedark' then
  require('onedark').setup {
    style = 'dark',
    transparent = true,
    code_style = {
      comments = 'none',
    },
  }
  vim.cmd [[colorscheme onedark]]
  vim.cmd [[highlight ColorColumn ctermbg=0 guibg=#31353f]]
end

-- GRUVBOX:
if theme == 'gruvbox' then
  vim.g.gruvbox_transparent_bg = 1
  vim.g.gruvbox_italicize_comments = 0
  vim.cmd [[colorscheme gruvbox]]
  vim.cmd [[highlight ColorColumn ctermbg=0 guibg=#3c3836]]
end

-- highlight the line number
vim.cmd [[highlight CursorLineNr guifg=white]]
vim.opt.cursorline = true
vim.opt.cursorlineopt = 'number'

-- LUALINE:
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = theme,
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
        symbols = {
          error = ' ',
          warn = ' ',
          info = ' ',
          hint = ' ',
        },
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

-- GITSIGNS:
require('gitsigns').setup {
  signs = {
    add = { text = '+' },
    change = { text = '~' },
    changedelete = {
      hl = 'GitSignsDelete',
      numhl = 'GitSignsDeleteNr',
      linehl = 'GitSignsDeleteLn',
    },
  },
  -- sign_priority = 10,
}

-- TODO-COMMENTS:
require('todo-comments').setup {
  signs = false,
}

local opts = { noremap = true, silent = true }
local set_keymap = vim.api.nvim_set_keymap

set_keymap('n', '<leader>tdt', '<Cmd>TodoTrouble<CR>', opts)
set_keymap('n', '<leader>ft', '<Cmd>TodoTelescope<CR>', opts)

-- COLORIZER:
require('colorizer').setup()
