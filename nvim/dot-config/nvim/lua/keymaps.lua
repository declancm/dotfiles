local lazyredraw = function(command)
  return '<cmd>set lz<cr>' .. command .. '<cmd>set nolz<cr>'
end

-- Scrolling.
vim.keymap.set({ 'n', 'x' }, '<c-u>', lazyredraw('<c-u>zz'), {})
vim.keymap.set({ 'n', 'x' }, '<c-d>', lazyredraw('<c-d>zz'), {})

-- Moving text.
vim.keymap.set('x', '<c-up>', lazyredraw(":m '<-2<cr>gv=gv"), {})
vim.keymap.set('x', '<c-down>', lazyredraw(":m '>+1<cr>gv=gv"), {})
vim.keymap.set('i', '<c-up>', lazyredraw('<cmd>m .-2<cr><c-o>=='), {})
vim.keymap.set('i', '<c-down>', lazyredraw('<cmd>m .+1<cr><c-o>=='), {})
vim.keymap.set('n', '<c-up>', lazyredraw('<cmd>m .-2<cr>=='), {})
vim.keymap.set('n', '<c-down>', lazyredraw('<cmd>m .+1<cr>=='), {})

-- Improve the <home> key.
vim.keymap.set({ '', 'i' }, '<home>', '<cmd>normal! ^ze<cr>', {})

-- Don't move during J.
vim.keymap.set('n', 'J', 'm`J``', {})

-- Clear highlights on redraw.
vim.keymap.set('n', '<c-l>', '<cmd>nohlsearch<cr><c-l>', {})

-- Fix the & command.
vim.keymap.set({ 'n', 'x' }, '&', '<cmd>&&<cr>', {})
