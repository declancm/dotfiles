-- COQ_CONFIG:
vim.g.coq_settings = {
  ["auto_start"] = "shut-up",
  ["keymap.jump_to_mark"] = "<C-F>",
}

-- LSP_CONFIG:
local lsp = require("lspconfig")

lsp.bashls.setup({})

lsp.clangd.setup({})
-- TO USE clangd FOR A C++ PROJECT, ADD THIS TO CMakeLists.txt:
-- set(CMAKE_EXPORT_COMPILE_COMMANDS ON CACHE INTERNAL "")

lsp.cmake.setup({}) -- pip3 install cmake-language-server

require("lspconfig").powershell_es.setup({
  bundle_path = "~/lsp/PowerShell/PowerShellEditorServices",
  shell = "powershell.exe",
})

lsp.pyright.setup({})

lsp.vimls.setup({})

-- LSP_KEYMAPS:
local opts = { noremap = true, silent = true }

vim.api.nvim_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
vim.api.nvim_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
vim.api.nvim_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
vim.api.nvim_set_keymap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
vim.api.nvim_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
