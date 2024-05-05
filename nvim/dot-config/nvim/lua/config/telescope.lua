-- TELESCOPE:

local telescope = require('telescope')
local builtin = require('telescope.builtin')

telescope.setup()
telescope.load_extension('fzf')
telescope.load_extension('undo')

vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Search for files.' })
vim.keymap.set('n', '<leader>fh', function() builtin.find_files({ hidden = true }) end,
  { desc = 'Search for files including hidden.' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Live grep.' })

vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'List buffers.' })
vim.keymap.set('n', '<leader>fc', builtin.commands, { desc = 'List commands.' })
vim.keymap.set('n', '<leader>f:', builtin.command_history, { desc = 'List command history.' })
vim.keymap.set('n', '<leader>f/', builtin.search_history, { desc = 'List search history.' })
vim.keymap.set('n', '<leader>fm', builtin.marks, { desc = 'List marks.' })
vim.keymap.set('n', '<leader>fq', builtin.quickfix, { desc = 'List items in the quickfix list.' })
vim.keymap.set('n', '<leader>fl', builtin.loclist, { desc = 'List items in the location list.' })

vim.keymap.set('n', 'gd', builtin.lsp_definitions, { desc = 'Goto the definition of cword.' })
vim.keymap.set('n', 'gr', builtin.lsp_references, { desc = 'List LSP references for cword.' })
vim.keymap.set('n', '<leader>fd', builtin.diagnostics, { desc = 'List LSP diagnostics.' })

vim.keymap.set('n', '<leader>fu', telescope.extensions.undo.undo, { desc = 'Search undo tree.' })
