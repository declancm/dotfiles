local lsp = require "lspconfig"
local coq = require "coq"

require'lspconfig'.pyright.setup{}
require'lspconfig'.clangd.setup{}
require'lspconfig'.vimls.setup{}
require'lspconfig'.bashls.setup{}

-- TO USE clangd FOR A C++ PROJECT, THE FOLLOWING NEEDS TO BE ADDED TO THE
-- CMakeLists.txt:
-- set(CMAKE_EXPORT_COMPILE_COMMANDS ON CACHE INTERNAL "")


  require('lspconfig')['pyright'].setup {
    coq.lsp_ensure_capabilities{
    -- on_attach = on_attach,
    capabilities = capabilities
  }}
  require('lspconfig')['clangd'].setup {
    coq.lsp_ensure_capabilities{
    -- on_attach = on_attach,
    capabilities = capabilities
  }}
  require('lspconfig')['vimls'].setup {
    coq.lsp_ensure_capabilities{
    -- on_attach = on_attach,
    capabilities = capabilities
  }}
  require('lspconfig')['bashls'].setup {
    coq.lsp_ensure_capabilities{
    -- on_attach = on_attach,
    capabilities = capabilities
  }}

coq_settings.clients.tabnine.enabled=true
