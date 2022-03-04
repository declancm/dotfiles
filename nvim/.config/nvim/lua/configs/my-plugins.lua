local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

-- VIM2VSCODE:

-- GIT-SCRIPTS-VIM:

-- vim.g.commit_on_save = 1
-- vim.g.commit_no_warnings = 1

-- CINNAMON-SCROLL:

-- vim.g.cinnamon_no_defaults = 1

-- vim.g.cinnamon_extras = 1

keymap('n', '<C-o>', '<Cmd>Cinnamon <C-o> 0 0 3 <CR>', opts)
keymap('n', '<C-i>', '<Cmd>Cinnamon <C-i> 0 0 3 <CR>', opts)

keymap('n', 'n', '<Cmd>Cinnamon n 0 0 3 <CR>', opts)
keymap('n', 'N', '<Cmd>Cinnamon N 0 0 3 <CR>', opts)
keymap('n', '*', '<Cmd>Cinnamon * 0 0 3 <CR>', opts)
keymap('n', '#', '<Cmd>Cinnamon # 0 0 3 <CR>', opts)
