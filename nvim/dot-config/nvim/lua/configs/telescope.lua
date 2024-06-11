-- TELESCOPE:

local telescope = require('telescope')
local builtin = require('telescope.builtin')

telescope.setup()
telescope.load_extension('fzf')

vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Search for files' })
vim.keymap.set('n', '<leader>fh', function()
  builtin.find_files({ hidden = true })
end, { desc = 'Search for hidden files' })
vim.keymap.set('n', '<leader>fs', builtin.live_grep, { desc = 'Search for string' })

vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'List open buffers' })
vim.keymap.set('n', '<leader>fc', builtin.commands, { desc = 'List user commands' })
vim.keymap.set('n', '<leader>f:', builtin.command_history, { desc = 'List command history' })
vim.keymap.set('n', '<leader>f/', builtin.search_history, { desc = 'List search history' })
vim.keymap.set('n', '<leader>fq', builtin.quickfix, { desc = 'List quickfix list items' })
vim.keymap.set('n', '<leader>fl', builtin.loclist, { desc = 'List location list items' })

vim.keymap.set('n', 'gd', builtin.lsp_definitions, { desc = 'Goto the definition of cword' })
vim.keymap.set('n', 'grr', builtin.lsp_references, { desc = 'List LSP references for cword' })
vim.keymap.set('n', '<leader>fd', builtin.diagnostics, { desc = 'List LSP diagnostics' })
