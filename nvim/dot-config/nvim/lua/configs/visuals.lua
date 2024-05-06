-- TOKYONIGHT:

vim.cmd('colorscheme tokyonight')

-- LUALINE:

require('lualine').setup {
  options = {
    component_separators = { left = '│', right = '│' },
    section_separators = { left = '', right = '' },
  },
  extensions = { 'fugitive', 'quickfix', 'oil' },
}

-- GITSIGNS:

require('gitsigns').setup()
