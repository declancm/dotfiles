-- TREESITTER:

require('nvim-treesitter.configs').setup {
  ensure_installed = 'all',
  highlight = { enable = true },
  indent = { enable = true },

  -- TREESITTER_TEXTOBJECTS:

  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['a/'] = '@comment.outer',
      },
    },
  },
}
