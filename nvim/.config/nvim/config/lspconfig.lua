-- require'lspconfig'.powershell_es.setup{
--   bundle_path = '$HOME/lsp/PowerShell',
--   cmd = {'/bin/pwsh', '-NoLogo', '-NoProfile', '-Command', "$HOME/lsp/PowerShell/PowerShellEditorServices/Start-EditorServices.ps1"},
-- }

require("lspconfig").pyright.setup({})
require("lspconfig").clangd.setup({})
require("lspconfig").vimls.setup({})
require("lspconfig").bashls.setup({})
-- require'lspconfig'.powershell_es.setup{}
-- require'lspconfig'.powershell_es.setup{
--   bundle_path = '~/lsp/PowerShell/PowerShellEditorServices',
--   -- shell = 'powershell.exe',
-- }

-- TO USE clangd FOR A C++ PROJECT, THE FOLLOWING NEEDS TO BE ADDED TO THE
-- CMakeLists.txt:
-- set(CMAKE_EXPORT_COMPILE_COMMANDS ON CACHE INTERNAL "")
