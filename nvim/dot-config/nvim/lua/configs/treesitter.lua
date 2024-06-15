-- TREESITTER:

require('nvim-treesitter.configs').setup({
  auto_install = true,
  ensure_installed = { 'comment' },
  highlight = { enable = true },
  indent = { enable = true },
})
