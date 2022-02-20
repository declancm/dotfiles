local opts = { noremap = true, silent = true }

-- undotree
vim.api.nvim_set_keymap("n", "<F5>", "<cmd>UndotreeToggle<CR><Cmd>wincmd p<CR>", opts)

-- chadtree
vim.api.nvim_set_keymap("n", "<leader>e", "<cmd>CHADopen<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>te", "<cmd>CHADopen<CR> --version-ctl<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>qf", "<cmd>call setqflist([])<CR>", opts)

-- symbols-outline
-- vim.api.nvim_set_keymap("n", "<leader>so", "<cmd>SymbolsOutline<CR>", opts)

-- markdown-preview
vim.api.nvim_set_keymap("n", "<leader>mdp", "<cmd>MarkdownPreview<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>mds", "<cmd>MarkdownPreviewStop<CR>", opts)

-- vim-maximizer
vim.g.maximizer_set_default_mapping = 1

-- trouble
vim.api.nvim_set_keymap("n", "<leader>tt", "<cmd>TroubleToggle<CR>", opts)

-- lspsaga
vim.api.nvim_set_keymap("n", "<C-j>", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
vim.api.nvim_set_keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)
vim.api.nvim_set_keymap("i", "<C-k>", "<cmd>Lspsaga signature_help<CR>", opts)
vim.api.nvim_set_keymap("n", "gh", "<cmd>Lspsaga lsp_finder<CR>", opts)
-- vim.api.nvim_set_keymap("n", "<C-\>", "<cmd>Lspsaga open_floaterm<CR>", opts)
-- vim.api.nvim_set_keymap("t", "<C-\>", "<cmd>Lspsaga open_floaterm<CR>", opts)
