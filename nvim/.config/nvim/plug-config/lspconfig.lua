require'lspconfig'.pyright.setup{}
require'lspconfig'.clangd.setup{}
require'lspconfig'.vimls.setup{}

-- TO USE clangd FOR A C++ PROJECT, THE FOLLOWING NEEDS TO BE ADDED TO THE
-- CMakeLists.txt:
-- set(CMAKE_EXPORT_COMPILE_COMMANDS ON CACHE INTERNAL "")
