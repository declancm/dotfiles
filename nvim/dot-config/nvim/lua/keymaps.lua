local lazyredraw = function(command)
  return '<cmd>set lz<cr>' .. command .. '<cmd>set nolz<cr>'
end

-- Scrolling.
vim.keymap.set({ 'n', 'x' }, '<c-u>', lazyredraw('<c-u>zz'),
  { desc = 'Scroll window upwards in buffer while staying centered.' })
vim.keymap.set({ 'n', 'x' }, '<c-d>', lazyredraw('<c-d>zz'),
  { desc = 'Scroll window downwards in buffer while staying centered.' })

-- Moving text.
vim.keymap.set('x', '<c-up>', lazyredraw(":m '<-2<cr>gv=gv"), { desc = 'Move the current selection up by 1 line.' })
vim.keymap.set('x', '<c-down>', lazyredraw(":m '>+1<cr>gv=gv"), { desc = 'Move the current selection down by 1 line.' })
vim.keymap.set('i', '<c-up>', lazyredraw('<cmd>m .-2<cr><c-o>=='), { desc = 'Move the current line down by 1 line.' })
vim.keymap.set('i', '<c-down>', lazyredraw('<cmd>m .+1<cr><c-o>=='), { desc = 'Move the current line down by 1 line.' })
vim.keymap.set('n', '<c-up>', lazyredraw('<cmd>m .-2<cr>=='), { desc = 'Move the current line down by 1 line.' })
vim.keymap.set('n', '<c-down>', lazyredraw('<cmd>m .+1<cr>=='), { desc = 'Move the current line down by 1 line.' })

-- Improve the <home> key.
vim.keymap.set({ '', 'i' }, '<home>', '<cmd>normal! ^ze<cr>', { desc = 'Better home key.' })

-- Don't move during J.
vim.keymap.set('n', 'J', 'm`J``', { desc = 'Join two lines without moving the cursor.' })

-- Clear highlights on redraw.
vim.keymap.set('n', '<c-l>', '<cmd>nohlsearch<cr><c-l>', { desc = 'Clear highlights and redraw buffer.' })

-- Fix the & command.
vim.keymap.set({ 'n', 'x' }, '&', '<cmd>&&<cr>', { desc = 'Repeat the last substitute command with the same flags.' })
