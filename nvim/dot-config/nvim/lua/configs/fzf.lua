--FZF:

local fzf = require('fzf-lua')
local actions = require('fzf-lua.actions')

fzf.setup({
  files = {
    actions = {
      ['ctrl-g'] = false, -- Default toggle_ignore mapping.
      ['alt-i'] = { actions.toggle_ignore },
    },
  },
  grep = {
    actions = {
      ['ctrl-g'] = false, -- Default toggle_ignore mapping.
      ['alt-i'] = { actions.toggle_ignore },
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

vim.keymap.set('n', 'gd', fzf.lsp_definitions, { desc = 'Goto the definition of cword' })
vim.keymap.set('n', 'gr', fzf.lsp_references, { desc = 'List LSP references for cword' })

vim.keymap.set('n', '<leader>dd', fzf.diagnostics_document, { desc = 'List document diagnostics' })
vim.keymap.set('n', '<leader>dw', fzf.diagnostics_workspace, { desc = 'List workspace diagnostics' })
