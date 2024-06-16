local lazyredraw = function(command)
  return '<cmd>set lz<cr>' .. command .. '<cmd>set nolz<cr>'
end

-- Scrolling.
vim.keymap.set({ 'n', 'x' }, '<c-u>', lazyredraw('<c-u>zz'), { desc = 'Scroll window upwards' })
vim.keymap.set({ 'n', 'x' }, '<c-d>', lazyredraw('<c-d>zz'), { desc = 'Scroll window downwards' })

-- Navigating windows.
vim.keymap.set({'n', 'i'}, '<c-h>', '<cmd>wincmd h<cr>', { desc = 'Move left a window' })
vim.keymap.set({'n', 'i'}, '<c-j>', '<cmd>wincmd j<cr>', { desc = 'Move down a window' })
vim.keymap.set({'n', 'i'}, '<c-k>', '<cmd>wincmd k<cr>', { desc = 'Move up a window' })
vim.keymap.set({'n', 'i'}, '<c-l>', '<cmd>wincmd l<cr>', { desc = 'Move right a window' })
vim.keymap.set({'n', 'i'}, '<c-left>', '<cmd>wincmd h<cr>', { desc = 'Move left a window' })
vim.keymap.set({'n', 'i'}, '<c-down>', '<cmd>wincmd j<cr>', { desc = 'Move down a window' })
vim.keymap.set({'n', 'i'}, '<c-up>', '<cmd>wincmd k<cr>', { desc = 'Move up a window' })
vim.keymap.set({'n', 'i'}, '<c-right>', '<cmd>wincmd l<cr>', { desc = 'Move right a window' })

-- Completion.
vim.keymap.set('i', '<c-space>', '<c-x><c-o>', { desc = 'Trigger omni completion' })

-- File processing.
vim.keymap.set('n', '<leader>ct', '<cmd>TrimTrailingWhitespace<cr>', { desc = 'Trim trailing whitespace' })

-- Terminal.
vim.keymap.set('t', '<esc><esc>', '<c-\\><c-n>', { desc = 'Enter normal mode' })
