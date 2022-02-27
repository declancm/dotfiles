local opts = { noremap = true, silent = true }
local set_keymap = vim.api.nvim_set_keymap

-- COQ_CONFIG:
vim.g.coq_settings = {
  ['auto_start'] = 'shut-up',
  ['keymap.recommended'] = false,
  ['keymap.jump_to_mark'] = '<C-n>',
  ['display.preview.border'] = 'solid',
}

vim.cmd [[
" COQ keymaps.
inoremap <silent><expr> <Esc>   pumvisible() ? "\<C-e><Esc>" : "\<Esc>"
inoremap <silent><expr> <C-c>   pumvisible() ? "\<C-e><C-c>" : "\<C-c>"
inoremap <silent><expr> <BS>    pumvisible() ? "\<C-e><BS>"  : "\<BS>"
inoremap <silent><expr> <CR>    pumvisible() ? (complete_info().selected == -1 ? "\<C-e><CR>" : "\<C-y>") : "\<CR>"
inoremap <silent><expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <silent><expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<BS>"

" Ignore popup window.
inoremap <silent><expr> <Up>    pumvisible() ? "\<C-e>\<Up>" : "\<Up>"
inoremap <silent><expr> <Down>  pumvisible() ? "\<C-e>\<Down>" : "\<Down>"
]]

-- LSP_CONFIG:
local lsp = require 'lspconfig'

-- INSTALLATION

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
lsp.powershell_es.setup { bundle_path = vim.g.powershell_es_path }
lsp.pyright.setup {}
lsp.vimls.setup {}

-- NOTES

-- clangd:       To use clangd for a cpp project, add this to the CMakeLists.txt:
--               set(CMAKE_EXPORT_COMPILE_COMMANDS ON CACHE INTERNAL "")

-- LSP keymaps
set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)

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
      autocmd BufWritePre <buffer> retab
      augroup END
      ]]
    end
  end,
}

-- Format on command 'Format'.
vim.cmd 'command! Format :lua vim.lsp.buf.formatting_sync()'

-- LSPSAGA:
require('lspsaga').init_lsp_saga {
  error_sign = '▶',
  warn_sign = '▶',
  hint_sign = '▶',
  infor_sign = '▶',
  border_style = 'none',
}

-- lspsaga keymaps
set_keymap('n', '<C-j>', '<Cmd>Lspsaga diagnostic_jump_next<CR>', opts)
set_keymap('n', 'K', '<Cmd>Lspsaga hover_doc<CR>', opts)
set_keymap('i', '<C-k>', '<Cmd>Lspsaga signature_help<CR>', opts)
set_keymap('n', 'gh', '<Cmd>Lspsaga lsp_finder<CR>', opts)
set_keymap(
  'n',
  '<C-\\>',
  "<Cmd>lua require('lspsaga.floaterm').open_float_terminal()<CR>",
  opts
)
set_keymap(
  't',
  '<C-\\>',
  "<C-\\><C-n><Cmd>lua require('lspsaga.floaterm').close_float_terminal()<CR>",
  opts
)
