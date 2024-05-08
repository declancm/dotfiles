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

local gitsigns = require('gitsigns')

gitsigns.setup({
  on_attach = function(bufnr)
    vim.keymap.set('n', ']c', function() gitsigns.nav_hunk('next') end,
      { buffer = bufnr, desc = 'Jump to next git hunk' })
    vim.keymap.set('n', '[c', function() gitsigns.nav_hunk('prev') end,
      { buffer = bufnr, desc = 'Jump to prev git hunk' })
  end
})
