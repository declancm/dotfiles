-- FZF-LUA:

local fzf = require('fzf-lua')

fzf.setup({
  grep = {
    rg_opts = '--column --line-number --no-heading --color=always --smart-case --max-columns=4096 --hidden --trim -e'
  }
})

vim.keymap.set('n', '<leader>fg', fzf.live_grep)
vim.keymap.set('n', '<leader>ff', fzf.files)

vim.keymap.set('n', '<leader>fb', fzf.buffers)
vim.keymap.set('n', '<leader>fc', fzf.commands)
vim.keymap.set('n', '<leader>f:', fzf.command_history, {})
vim.keymap.set('n', '<leader>f/', fzf.search_history, {})
vim.keymap.set('n', '<leader>fm', fzf.marks, {})
vim.keymap.set('n', '<leader>fq', fzf.quickfix, {})
vim.keymap.set('n', '<leader>fl', fzf.loclist, {})

vim.keymap.set('n', 'gd', fzf.lsp_definitions, {})
vim.keymap.set('n', 'gr', fzf.lsp_references, {})
vim.keymap.set('n', 'gi', fzf.lsp_implementations, {})
vim.keymap.set('n', 'gt', fzf.lsp_typedefs, {})
vim.keymap.set('n', '<leader>fd', fzf.diagnostics_document, {})
vim.keymap.set('n', '<leader>fD', fzf.diagnostics_workspace, {})
