local lspconfig = require('lspconfig')

-- CMP:

local cmp = require('cmp')

cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<c-u>'] = cmp.mapping.scroll_docs(-4),
    ['<c-d>'] = cmp.mapping.scroll_docs(4),
    ['<down>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 'c' }),
    ['<up>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 'c' }),
    ['<c-e>'] = cmp.mapping(cmp.mapping.abort(), { 'i', 'c' }),
    ['<cr>'] = cmp.mapping(cmp.mapping.confirm({ select = false }), { 'i', 'c' })
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'path' },
    { name = 'luasnip' }
  })
})

cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  }),
  matching = { disallow_symbol_nonprefix_matching = false }
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()

local handlers = {
  function(server_name)
    lspconfig[server_name].setup({ capabilities = capabilities })
  end,
  ['lua_ls'] = function()
    lspconfig.lua_ls.setup({
      capabilities = capabilities,
      settings = { Lua = { diagnostics = { globals = { 'vim' } } } }
    })
  end,
}

-- MASON-LSPCONFIG:

require('mason').setup()
require('mason-lspconfig').setup({
  ensure_installed = {
    'clangd',
    'cmake',
    'jsonls',
    'lua_ls',
    'marksman',
    'pyright'
  },
  handlers = handlers
})

-- LSP:

-- Neovim v0.10 new default LSP keymaps.
vim.keymap.set('n', 'crr', vim.lsp.buf.code_action, { desc = 'Select a code action.' })
vim.keymap.set('x', '<c-r>r', vim.lsp.buf.code_action, { desc = 'Select a code action.' })
vim.keymap.set('x', '<c-r><c-r>', vim.lsp.buf.code_action, { desc = 'Select a code action.' })
vim.keymap.set('n', 'crn', vim.lsp.buf.rename, { desc = 'Rename symbol.' })
vim.keymap.set('i', '<c-s>', vim.lsp.buf.signature_help, { desc = 'Display symbol signature info.' })
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Move to prev diagnostic.' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Move to next diagnostic.' })
vim.keymap.set('n', '<c-w>d', vim.diagnostic.open_float, { desc = 'Show diagnostics.' })

-- Workspace folders.
vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, { desc = 'Add folder to workspace.' })
vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, { desc = 'Remove folder from workspace.' })
vim.keymap.set('n', '<leader>wl', function()
  print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
end, { desc = 'List workspace folders.' })

-- Customize the diagnostic UI.
vim.diagnostic.config {
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = '',
      [vim.diagnostic.severity.WARN] = '',
      [vim.diagnostic.severity.HINT] = '',
      [vim.diagnostic.severity.INFO] = ''
    }
  },
  virtual_text = { prefix = '•' }
}
