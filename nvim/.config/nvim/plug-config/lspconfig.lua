require'lspconfig'.pyright.setup{}
require'lspconfig'.clangd.setup{}
require'lspconfig'.vimls.setup{}
require'lspconfig'.bashls.setup{}

-- TO USE clangd FOR A C++ PROJECT, THE FOLLOWING NEEDS TO BE ADDED TO THE
-- CMakeLists.txt:
-- set(CMAKE_EXPORT_COMPILE_COMMANDS ON CACHE INTERNAL "")

local on_attach = function(client, bufnr)
  protocol.CompletionItemKind = {
    '', -- Text
    '', -- Method
    '', -- Function
    '', -- Constructor
    '', -- Field
    '', -- Variable
    '', -- Class
    'ﰮ', -- Interface
    '', -- Module
    '', -- Property
    '', -- Unit
    '', -- Value
    '', -- Enum
    '', -- Keyword
    '﬌', -- Snippet
    '', -- Color
    '', -- File
    '', -- Reference
    '', -- Folder
    '', -- EnumMember
    '', -- Constant
    '', -- Struct
    '', -- Event
    'ﬦ', -- Operator
    '', -- TypeParameter
  }
end
