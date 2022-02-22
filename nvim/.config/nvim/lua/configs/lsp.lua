-- COQ_CONFIG:
vim.g.coq_settings = {
  ['auto_start'] = 'shut-up',
  ['keymap.jump_to_mark'] = '<C-F>',
}

-- LSP_CONFIG:

local lsp = require 'lspconfig'

-- Installing the Language Servers

-- bashls:        npm i -g bash-language-server
-- clangd:        sudo apt-get install clangd-12
-- cmake:         pip3 install cmake-language-server
-- powershell_es: https://github.com/PowerShell/PowerShellEditorServices/releases
--                Extract the zip file to '~/lsp/PowerShellEditorServices'
-- pyright:       pip3 install pyright
-- vimls:         npm install -g vim-language-server

vim.cmd 'let g:powershell_es_path = expand("$HOME/lsp/PowerShellEditorServices")'

lsp.bashls.setup {}
lsp.clangd.setup {}
lsp.cmake.setup {}
lsp.powershell_es.setup {
  bundle_path = vim.g.powershell_es_path,
}
lsp.pyright.setup {}
lsp.vimls.setup {}

-- Notes

-- clangd:       To use clangd for a cpp project, add this to the CMakeLists.txt:
--               set(CMAKE_EXPORT_COMPILE_COMMANDS ON CACHE INTERNAL "")

-- LSP_KEYMAPS:
local opts = { noremap = true, silent = true }

vim.api.nvim_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
vim.api.nvim_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
vim.api.nvim_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
vim.api.nvim_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
vim.api.nvim_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)

-- LSP_SAGA_CONFIG:
local saga = require 'lspsaga'

saga.init_lsp_saga {
  error_sign = '▶',
  warn_sign = '▶',
  hint_sign = '▶',
  infor_sign = '▶',
  border_style = 'round',
}
