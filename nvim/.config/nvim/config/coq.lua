-- COQ_CONFIG:
vim.g.coq_settings = {
  ["auto_start"] = "shut-up",
  ["keymap.jump_to_mark"] = "<C-F>",
}

-- LSP_CONFIG:

local lsp = require("lspconfig")

lsp.bashls.setup({}) -- npm i -g bash-language-server

lsp.clangd.setup({}) -- sudo apt-get install clangd-12
-- TO USE clangd FOR A C++ PROJECT, ADD THIS TO CMakeLists.txt:
-- set(CMAKE_EXPORT_COMPILE_COMMANDS ON CACHE INTERNAL "")

lsp.cmake.setup({}) -- pip3 install cmake-language-server

vim.cmd('let g:powershell_es_path = expand("$HOME/lsp/PowerShellEditorServices")')
lsp.powershell_es.setup({
  bundle_path = vim.g.powershell_es_path,
}) -- https://github.com/PowerShell/PowerShellEditorServices/releases

lsp.pyright.setup({}) -- pip3 install pyright

lsp.vimls.setup({}) -- npm install -g vim-language-server

-- LSP_KEYMAPS:
local opts = { noremap = true, silent = true }

vim.api.nvim_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
vim.api.nvim_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
vim.api.nvim_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
vim.api.nvim_set_keymap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
vim.api.nvim_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
