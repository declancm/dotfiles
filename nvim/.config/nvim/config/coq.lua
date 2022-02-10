local lsp = require("lspconfig")
local coq = require("coq")

-- TO USE clangd FOR A C++ PROJECT, THE FOLLOWING NEEDS TO BE ADDED TO THE
-- CMakeLists.txt:
-- set(CMAKE_EXPORT_COMPILE_COMMANDS ON CACHE INTERNAL "")

-- for server, config in pairs(servers) do
--     nvim_lsp[server].setup(coq.lsp_ensure_capabilities(
--                                vim.tbl_deep_extend("force", {
--             on_attach = lsp_on_attach,
--             capabilities = capabilities,
--             flags = {debounce_text_changes = 150},
--             init_options = config
--         }, {})))
--     local cfg = nvim_lsp[server]
--     if not (cfg and cfg.cmd and vim.fn.executable(cfg.cmd[1]) == 1) then
--         print(server .. ": cmd not found: " .. vim.inspect(cfg.cmd))
--     end
--   end

vim.schedule(function()
  local lsp = require("lspconfig")
  require("packer").loader("coq_nvim coq.artifacts")
  lsp.clangd.setup(require("coq")().lsp_ensure_capabilities())
end)

vim.schedule(function()
  local lsp = require("lspconfig")
  require("packer").loader("coq_nvim coq.artifacts")
  lsp.pyright.setup(require("coq")().lsp_ensure_capabilities())
end)

vim.schedule(function()
  local lsp = require("lspconfig")
  require("packer").loader("coq_nvim coq.artifacts")
  lsp.vimls.setup(require("coq")().lsp_ensure_capabilities())
end)

vim.schedule(function()
  local lsp = require("lspconfig")
  require("packer").loader("coq_nvim coq.artifacts")
  lsp.bashls.setup(require("coq")().lsp_ensure_capabilities())
end)

-- coq_settings.clients.tabnine.enabled=true

vim.cmd("let g:coq_settings = { 'auto_start': v:true }")
vim.cmd("let g:coq_settings = { 'display.icons.mode': 'none' }")
