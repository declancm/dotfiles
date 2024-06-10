local lazyredraw = function(command)
  return '<cmd>set lz<cr>' .. command .. '<cmd>set nolz<cr>'
end

-- Scrolling.
vim.keymap.set({ 'n', 'x' }, '<c-u>', lazyredraw('<c-u>zz'), { desc = 'Scroll window upwards' })
vim.keymap.set({ 'n', 'x' }, '<c-d>', lazyredraw('<c-d>zz'), { desc = 'Scroll window downwards' })

-- Moving text.
vim.keymap.set('x', '<c-up>', lazyredraw(":m '<-2<cr>gv=gv"), { desc = 'Move selection up' })
vim.keymap.set('x', '<c-down>', lazyredraw(":m '>+1<cr>gv=gv"), { desc = 'Move selection down' })
vim.keymap.set('i', '<c-up>', lazyredraw('<cmd>m .-2<cr><c-o>=='), { desc = 'Move current line up' })
vim.keymap.set('i', '<c-down>', lazyredraw('<cmd>m .+1<cr><c-o>=='), { desc = 'Move current line down' })
vim.keymap.set('n', '<c-up>', lazyredraw('<cmd>m .-2<cr>=='), { desc = 'Move current line up' })
vim.keymap.set('n', '<c-down>', lazyredraw('<cmd>m .+1<cr>=='), { desc = 'Move current line down' })

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
