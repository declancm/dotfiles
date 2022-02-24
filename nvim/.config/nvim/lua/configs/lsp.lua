local opts = { noremap = true, silent = true }

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
vim.api.nvim_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
vim.api.nvim_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
vim.api.nvim_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
vim.api.nvim_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
vim.api.nvim_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)

-- NULL-LS:
require('null-ls').setup {
  debug = false,
  sources = {
    require('null-ls').builtins.formatting.black,
    -- pip3 install black
    -- require('null-ls').builtins.formatting.clang_format,
    -- sudo apt install clang-format
    -- require('null-ls').builtins.formatting.cmake_format,
    -- pip3 install cmakelang
    require('null-ls').builtins.formatting.prettier,
    -- npm install --save-dev --save-exact prettier
    require('null-ls').builtins.formatting.stylua,
    -- cargo install stylua
  },
  -- automatically format on save
  on_attach = function(client)
    if client.resolved_capabilities.document_formatting then
      vim.cmd [[
      augroup LspFormatting
      autocmd! * <buffer>
      autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
      " convert tabs to spaces
      autocmd BufWritePre <buffer> retab
      augroup END
      ]]
    end
  end,
}

-- format on command
vim.cmd 'command! Format :lua vim.lsp.buf.formatting_sync()'

-- LSPSAGA:
local saga = require 'lspsaga'

saga.init_lsp_saga {
  error_sign = '▶',
  warn_sign = '▶',
  hint_sign = '▶',
  infor_sign = '▶',
  border_style = 'round',
}

-- LSPSAGA_KEYMAPS:
vim.api.nvim_set_keymap('n', '<C-j>', '<Cmd>Lspsaga diagnostic_jump_next<CR>', opts)
vim.api.nvim_set_keymap('n', 'K', '<Cmd>Lspsaga hover_doc<CR>', opts)
vim.api.nvim_set_keymap('i', '<C-k>', '<Cmd>Lspsaga signature_help<CR>', opts)
vim.api.nvim_set_keymap('n', 'gh', '<Cmd>Lspsaga lsp_finder<CR>', opts)
-- vim.api.nvim_set_keymap('n', '<C->', '<Cmd>Lspsaga open_floaterm<CR>', opts)
-- vim.api.nvim_set_keymap('t', '<C->', '<Cmd>Lspsaga open_floaterm<CR>', opts)

-- LSP_COLORS:
require('lsp-colors').setup {
  Error = '#db4b4b',
  Warning = '#e0af68',
  Information = '#0db9d7',
  Hint = '#10B981',
}
