require('null-ls').setup {
  debug = false,
  sources = {
    require('null-ls').builtins.formatting.black,
    -- pip3 install black
    -- require("null-ls").builtins.formatting.clang_format,
    -- sudo apt install clang-format
    -- require("null-ls").builtins.formatting.cmake_format,
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
