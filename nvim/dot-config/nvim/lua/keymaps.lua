local lazyredraw = function(command)
  return '<cmd>set lz<cr>' .. command .. '<cmd>set nolz<cr>'
end

-- Scrolling.
vim.keymap.set({ 'n', 'x' }, '<c-u>', lazyredraw('<c-u>zz'), { desc = 'Scroll window upwards' })
vim.keymap.set({ 'n', 'x' }, '<c-d>', lazyredraw('<c-d>zz'), { desc = 'Scroll window downwards' })

-- Navigating windows.
vim.keymap.set({'n', 'i'}, '<c-h>', '<c-w>h', { desc = 'Move left a window' })
vim.keymap.set({'n', 'i'}, '<c-j>', '<c-w>j', { desc = 'Move down a window' })
vim.keymap.set({'n', 'i'}, '<c-k>', '<c-w>k', { desc = 'Move up a window' })
vim.keymap.set({'n', 'i'}, '<c-l>', '<c-w>l', { desc = 'Move right a window' })
vim.keymap.set({'n', 'i'}, '<c-left>', '<c-w>h', { desc = 'Move left a window' })
vim.keymap.set({'n', 'i'}, '<c-down>', '<c-w>j', { desc = 'Move down a window' })
vim.keymap.set({'n', 'i'}, '<c-up>', '<c-w>k', { desc = 'Move up a window' })
vim.keymap.set({'n', 'i'}, '<c-right>', '<c-w>l', { desc = 'Move right a window' })

-- Improve the <home> key.
vim.keymap.set({ '', 'i' }, '<home>', '<cmd>normal! ^ze<cr>', { desc = 'Better home key' })

-- Don't move during J.
vim.keymap.set('n', 'J', 'm`J``', { desc = 'Join two lines' })

-- Clear highlights on redraw.
vim.keymap.set('n', '<c-l>', '<cmd>nohlsearch<cr><c-l>', { desc = 'Clear highlights and redraw' })

-- Fix the & command.
vim.keymap.set({ 'n', 'x' }, '&', '<cmd>&&<cr>', { desc = 'Repeat the last substitute' })

-- Completion.
vim.keymap.set('i', '<c-space>', '<c-x><c-o>', { desc = 'Trigger omni completion' })

-- File processing.
vim.keymap.set('n', '<leader>ct', '<cmd>TrimTrailingWhitespace<cr>', { desc = 'Trim trailing whitespace' })

-- Terminal.
vim.keymap.set('t', '<esc><esc>', '<c-\\><c-n>', { desc = 'Enter normal mode' })
