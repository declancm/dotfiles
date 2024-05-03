-- Scrolling.
vim.keymap.set('', '<c-u>', '<c-u>zz')
vim.keymap.set('', '<c-d>', '<c-d>zz')

-- Moving text.
vim.keymap.set('x', '<c-up>', "<cmd>m '<-2<cr>gv=gv")
vim.keymap.set('x', '<c-down>', "<cmd>m '>+1<cr>gv=gv")
vim.keymap.set('i', '<c-up>', '<esc><cmd>m .-2<cr>==a')
vim.keymap.set('i', '<c-down>', '<esc><cmd>m .+1<cr>==a')
vim.keymap.set('n', '<c-up>', '<cmd>m .-2<cr>==')
vim.keymap.set('n', '<c-down>', '<cmd>m .+1<cr>==')

-- Improve the <home> key.
vim.keymap.set({ '', 'i' }, '<home>', '<cmd>normal! ^ze<cr>')

-- Don't move during J.
vim.keymap.set('n', 'J', 'm`J``')

-- Delete the start of the word with ctrl-bs.
vim.keymap.set('!', '<c-bs>', '<c-w>')
vim.keymap.set('!', '<c-h>', '<c-w>')

-- Clear highlights on redraw.
vim.keymap.set('n', '<c-l>', '<cmd>nohlsearch<cr><c-l>')

-- Fix the & command.
vim.keymap.set({ 'n', 'x' }, '&', '<cmd>&&<cr>')
