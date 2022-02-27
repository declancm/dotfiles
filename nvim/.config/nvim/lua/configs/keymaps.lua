local opts = { noremap = true, silent = true }
local set_keymap = vim.api.nvim_set_keymap

set_keymap('v', '<leader>P', '"*P`[v`]', opts)
-- Improve the <Home> key.
set_keymap('', '<Home>', 'zH^', opts)
set_keymap('i', '<Home>', '<Esc>zHI', opts)

-- Source config file.
set_keymap(
  'n',
  '<leader>sc',
  ':wa<CR>:source $MYVIMRC<CR>:echom "Your config file was sourced."<CR>',
  opts
)

-- Creating windows.
set_keymap('n', '<leader>v', '<C-w>v', opts)
set_keymap('n', '<leader>s', '<C-w>s', opts)

-- Tmux-like previous window switch.
set_keymap('n', '<leader>;', '<Cmd>wincmd p<CR>', opts)

-- Resize windows.
set_keymap('n', '<S-Up>', '<Cmd>resize +5<CR>', opts)
set_keymap('n', '<S-Down>', '<Cmd>resize -5<CR>', opts)
set_keymap('n', '<S-Right>', '<Cmd>vertical resize +5<CR>', opts)
set_keymap('n', '<S-Left>', '<Cmd>vertical resize -5<CR>', opts)

-- Y works like D and C.
set_keymap('n', 'Y', '"*yg_', opts)

-- Stay centered during word search.
set_keymap('n', 'n', 'nzzzv', opts)
set_keymap('n', 'N', 'Nzzzv', opts)

-- Don't move during J.
set_keymap('n', 'J', 'mzJ`z:delmarks z<CR>', opts)

-- Adding more undo break points.
set_keymap('i', ',', ',<C-g>u', opts)
set_keymap('i', '.', '.<C-g>u', opts)
set_keymap('i', '!', '!<C-g>u', opts)
set_keymap('i', '?', '?<C-g>u', opts)

-- Moving text.
set_keymap('v', 'K', ":m '<-2<CR>gv=gv", opts)
set_keymap('v', 'J', ":m '>+1<CR>gv=gv", opts)
set_keymap('i', '<C-k>', '<Esc>:m .-2<CR>==a', opts)
set_keymap('i', '<C-j>', '<Esc>:m .+1<CR>==a', opts)
set_keymap('n', '<leader>k', ':m .-2<CR>==', opts)
set_keymap('n', '<leader>j', ':m .+1<CR>==', opts)

-- Moving text with arrows.
set_keymap('v', '<C-Up>', ":m '<-2<CR>gv=gv", opts)
set_keymap('v', '<C-Down>', ":m '>+1<CR>gv=gv", opts)
set_keymap('i', '<C-Up>', '<Esc>:m .-2<CR>==a', opts)
set_keymap('i', '<C-Down>', '<Esc>:m .+1<CR>==a', opts)
set_keymap('n', '<C-Up>', ':m .-2<CR>==', opts)
set_keymap('n', '<C-Down>', ':m .+1<CR>==', opts)

-- Replace a word then press '.' to change next occurence.
set_keymap('n', 'cn', '*``"_cgn', opts)
set_keymap('n', 'cN', '*``"_cgN', opts)

-- Yank to global clipboard.
set_keymap('n', 'y', '"*y', opts)
set_keymap('v', 'y', '"*y', opts)

-- Paste from global clipboard and highlight.
set_keymap('n', '<leader>p', '"*p`[v`]', opts)

-- Highlight after indenting.
set_keymap('v', '>', '>gv', opts)
set_keymap('v', '<', '<gv', opts)

-- c, d and x are now delete without yanking.
set_keymap('n', 'x', '"_x', opts)
set_keymap('n', 'd', '"_d', opts)
set_keymap('n', 'D', '"_D', opts)
set_keymap('v', 'd', '"_d', opts)
set_keymap('n', 'c', '"_c', opts)
set_keymap('n', 'C', '"_C', opts)
set_keymap('v', 'c', '"_c', opts)

-- Cut is now leader d.
set_keymap('n', '<leader>d', '"*d', opts)
set_keymap('n', '<leader>D', '"*d', opts)
set_keymap('v', '<leader>d', '"*d', opts)

-- Delete start of word for command line with ctrl-backspace.
set_keymap('c', '<C-H>', '<C-w>', opts)
