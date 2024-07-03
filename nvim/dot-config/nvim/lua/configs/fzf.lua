--FZF:

local fzf = require('fzf-lua')
local actions = require('fzf-lua.actions')

fzf.setup({
  keymap = {
    builtin = {
      ['<a-f>'] = 'preview-page-down',
      ['<a-b>'] = 'preview-page-up',
    },
  },
  files = {
    actions = {
      ['ctrl-g'] = false, -- Default toggle_ignore mapping.
      ['alt-g'] = { actions.toggle_ignore },
    },
  },
  grep = {
    actions = {
      ['ctrl-g'] = false, -- Default toggle_ignore mapping.
      ['alt-g'] = { actions.toggle_ignore },
    },
  },
})

vim.keymap.set('n', '<leader>ff', fzf.files, { desc = 'Search for files' })
vim.keymap.set('n', '<leader>fs', fzf.live_grep, { desc = 'Search for string' })

vim.keymap.set('n', '<leader>fb', fzf.buffers, { desc = 'List open buffers' })
vim.keymap.set('n', '<leader>fc', fzf.commands, { desc = 'List user commands' })
vim.keymap.set('n', '<leader>f:', fzf.command_history, { desc = 'List command history' })
vim.keymap.set('n', '<leader>f/', fzf.search_history, { desc = 'List search history' })
vim.keymap.set('n', '<leader>fq', fzf.quickfix, { desc = 'List quickfix list items' })
vim.keymap.set('n', '<leader>fl', fzf.loclist, { desc = 'List location list items' })

vim.keymap.set('n', 'gr', fzf.lsp_references, { nowait = true, desc = 'Find references' })
vim.keymap.set('n', '<leader>fd', fzf.lsp_document_symbols, { desc = 'List document symbols' })
vim.keymap.set('n', '<leader>fw', fzf.lsp_workspace_symbols, { desc = 'List workspace symbols' })

vim.keymap.set('n', '<leader>dd', fzf.diagnostics_document, { desc = 'List document diagnostics' })
vim.keymap.set('n', '<leader>dw', fzf.diagnostics_workspace, { desc = 'List workspace diagnostics' })

-- Add paste from register support to fzf.
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'fzf',
  callback = function()
    vim.keymap.set('t', '<c-r>', [['<c-\><c-n>"'.nr2char(getchar()).'pi']], { expr = true, buffer = true })
  end,
})
