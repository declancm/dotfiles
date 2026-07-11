vim.g.mapleader = ' '

vim.o.number = true
vim.o.relativenumber = true
vim.o.undofile = true
vim.o.swapfile = false

vim.pack.add({
  'https://github.com/junegunn/fzf', -- fzf.vim dependency
  'https://github.com/junegunn/fzf.vim',
  -- TODO: remove for Neovim v0.13.0+
  'https://github.com/justinmk/vim-dirvish',
  'https://github.com/neovim/nvim-lspconfig',
  'https://github.com/nvim-mini/mini.nvim',
  -- TODO: plugin has been archived so replace once upstreamed
  'https://github.com/nvim-treesitter/nvim-treesitter',
  'https://github.com/tpope/vim-sleuth', -- smart indents
})

require('mini.diff').setup()

vim.keymap.set('', '<d-p>', '<cmd>Files<cr>')
vim.keymap.set('', '<d-o>', '<cmd>Buffers<cr>')
vim.keymap.set('', '<d-s-f>', '<cmd>RG<cr>')

vim.api.nvim_create_autocmd('BufWritePre', {
  callback = function() vim.lsp.buf.format() end,
})

-- requires `:TSInstall <lang>`
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'bzl' --[[ starlark ]], 'cpp', 'python' },
  callback = function() vim.treesitter.start() end,
})

vim.cmd.colorscheme('retrobox')

vim.lsp.enable('zls') -- zig
