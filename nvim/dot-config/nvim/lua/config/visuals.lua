-- TOKYONIGHT:

vim.cmd([[colorscheme tokyonight]])

-- LUALINE:

require('lualine').setup {
  options = {
    component_separators = { left = '│', right = '│' },
    section_separators = { left = '', right = '' },
  },
  sections = {
    lualine_b = {
      'branch',
      'diff',
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
    },
  },

  extensions = { 'fugitive' },
}

-- GITSIGNS:

require('gitsigns').setup()
