local opts = { noremap = true, silent = true }

-- undotree
vim.api.nvim_set_keymap('n', '<F5>', '<Cmd>UndotreeToggle<CR><Cmd>wincmd p<CR>', opts)

-- chadtree
vim.api.nvim_set_keymap('n', '<leader>e', '<Cmd>CHADopen<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>te', '<Cmd>CHADopen<CR> --version-ctl<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>qf', '<Cmd>call setqflist([])<CR>', opts)

-- markdown-preview
vim.api.nvim_set_keymap('n', '<leader>mdp', '<Cmd>MarkdownPreview<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>mds', '<Cmd>MarkdownPreviewStop<CR>', opts)

-- trouble
vim.api.nvim_set_keymap('n', '<leader>tt', '<Cmd>TroubleToggle<CR>', opts)

-- lspsaga
vim.api.nvim_set_keymap('n', '<C-j>', '<Cmd>Lspsaga diagnostic_jump_next<CR>', opts)
vim.api.nvim_set_keymap('n', 'K', '<Cmd>Lspsaga hover_doc<CR>', opts)
vim.api.nvim_set_keymap('i', '<C-k>', '<Cmd>Lspsaga signature_help<CR>', opts)
vim.api.nvim_set_keymap('n', 'gh', '<Cmd>Lspsaga lsp_finder<CR>', opts)
-- vim.api.nvim_set_keymap('n', '<C->', '<Cmd>Lspsaga open_floaterm<CR>', opts)
-- vim.api.nvim_set_keymap('t', '<C->', '<Cmd>Lspsaga open_floaterm<CR>', opts)
