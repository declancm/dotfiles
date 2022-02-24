-- THEME:
-- local theme = 'onedark'
local theme = 'tokyonight'

vim.opt.background = 'dark'
vim.opt.colorcolumn = '80'

-- TOKYONIGHT_CONFIG:
vim.g.tokyonight_style = 'storm'
vim.g.tokyonight_transparent = true
vim.g.tokyonight_italic_comments = false
if theme == 'tokyonight' then
  vim.cmd [[colorscheme tokyonight]]
  vim.cmd [[highlight ColorColumn ctermbg=0 guibg=#1f2335]]
end

-- ONEDARK_CONFIG:
require('onedark').setup {
  style = 'deep',
  transparent = true,
  code_style = {
    comments = 'none',
  },
}
if theme == 'onedark' then
  vim.cmd [[colorscheme onedark]]
  vim.cmd [[highlight ColorColumn ctermbg=0 guibg=#31353f]]
end

-- highlight the line number
vim.cmd [[highlight CursorLineNr guifg=white]]
vim.opt.cursorline = true
vim.opt.cursorlineopt = 'number'

-- LUALINE:
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = theme, --onedark, tokyonight
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

-- CHADTREE:
local chadtree_settings = {
  ['theme.text_colour_set'] = 'solarized_light',
  ['options.session'] = false,
  ['options.close_on_open'] = true,
}
vim.api.nvim_set_var('chadtree_settings', chadtree_settings)
