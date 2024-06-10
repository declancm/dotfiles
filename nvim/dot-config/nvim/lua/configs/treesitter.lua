-- TREESITTER:

require('nvim-treesitter.configs').setup({
  auto_install = true,
  ensure_installed = { 'comment' },
  ignore_install = { 'c', 'lua', 'vim', 'vimdoc', 'query' },
  highlight = { enable = true },
  indent = { enable = true },
})
