-- LSPCONFIG:

local lspconfig = require('lspconfig')

local on_attach = function(client, bufnr)
  if client.server_capabilities.completionProvider then
    vim.lsp.completion.enable(true, client.id, bufnr, {
      autotrigger = true,
    })
  end
end

local handlers = {
  function(server_name)
    lspconfig[server_name].setup({ on_attach = on_attach })
  end,
  ['lua_ls'] = function()
    lspconfig.lua_ls.setup({
      on_attach = on_attach,
      settings = {
        Lua = {
          runtime = { version = 'LuaJIT' },
          diagnostics = { globals = { 'vim' } },
        },
      },
    })
  end,
}

require('mason').setup()
require('mason-lspconfig').setup({
  ensure_installed = {
    'clangd',
    'cmake',
    'html',
    'jsonls',
    'lua_ls',
    'marksman',
    'pyright',
    'tsserver',
  },
  handlers = handlers,
})

-- FORMAT:

local conform = require('conform')

conform.setup({
  formatters_by_ft = {
    lua = { 'stylua' },
    python = { 'black' },
  },
})

vim.api.nvim_create_user_command('FormatDocument', function()
  conform.format({ lsp_fallback = true })
end, { desc = 'Format the current document.' })

-- LSP:

-- Neovim v0.11 builtin keymaps.
vim.keymap.set('n', 'grn', vim.lsp.buf.rename, { desc = 'Rename symbol' })
vim.keymap.set({ 'n', 'x' }, 'gra', vim.lsp.buf.code_action, { desc = 'Show code actions' })
vim.keymap.set('i', '<c-s>', vim.lsp.buf.signature_help, { desc = 'Show signature help' })

-- Workspace folders.
vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, { desc = 'Add folder to workspace' })
vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, { desc = 'Remove folder from workspace' })
vim.keymap.set('n', '<leader>wl', function()
  print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
end, { desc = 'List workspace folders' })

-- Customize the diagnostic UI.
vim.diagnostic.config({
  signs = false,
  virtual_text = { prefix = '•' },
})
