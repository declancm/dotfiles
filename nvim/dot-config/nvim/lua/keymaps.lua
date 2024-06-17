local lazyredraw = function(command)
  return '<cmd>set lz<cr>' .. command .. '<cmd>set nolz<cr>'
end

-- Scrolling.
vim.keymap.set({ 'n', 'x' }, '<c-u>', lazyredraw('<c-u>zz'), { desc = 'Scroll window upwards' })
vim.keymap.set({ 'n', 'x' }, '<c-d>', lazyredraw('<c-d>zz'), { desc = 'Scroll window downwards' })

-- Navigating windows.
vim.keymap.set({ 'n', 'i' }, '<c-h>', '<cmd>wincmd h<cr>', { desc = 'Move left a window' })
vim.keymap.set({ 'n', 'i' }, '<c-j>', '<cmd>wincmd j<cr>', { desc = 'Move down a window' })
vim.keymap.set({ 'n', 'i' }, '<c-k>', '<cmd>wincmd k<cr>', { desc = 'Move up a window' })
vim.keymap.set({ 'n', 'i' }, '<c-l>', '<cmd>wincmd l<cr>', { desc = 'Move right a window' })
vim.keymap.set({ 'n', 'i' }, '<c-left>', '<cmd>wincmd h<cr>', { desc = 'Move left a window' })
vim.keymap.set({ 'n', 'i' }, '<c-down>', '<cmd>wincmd j<cr>', { desc = 'Move down a window' })
vim.keymap.set({ 'n', 'i' }, '<c-up>', '<cmd>wincmd k<cr>', { desc = 'Move up a window' })
vim.keymap.set({ 'n', 'i' }, '<c-right>', '<cmd>wincmd l<cr>', { desc = 'Move right a window' })

-- Completion.
vim.keymap.set('i', '<c-space>', '<c-x><c-o>', { desc = 'Trigger omni completion' })

-- File processing.
vim.keymap.set('n', '<leader>ct', '<cmd>TrimTrailingWhitespace<cr>', { desc = 'Trim trailing whitespace' })

-- Terminal.
vim.keymap.set('t', '<esc><esc>', '<c-\\><c-n>', { desc = 'Enter normal mode' })

-- Quitting Neovim.
vim.keymap.set('n', '<leader>q', '<cmd>wa | qa<cr>', { desc = 'Save all windows and quit' })

-- Line movement.
vim.keymap.set('v', '<', lazyredraw('<gv'), { desc = 'Shift lines left' })
vim.keymap.set('v', '>', lazyredraw('>gv'), { desc = 'Shift lines right' })
vim.keymap.set('n', '<a-j>', lazyredraw('<cmd>m .+1<cr>=='), { desc = 'Move line down' })
vim.keymap.set('n', '<a-k>', lazyredraw('<cmd>m .-2<cr>=='), { desc = 'Move line up' })
vim.keymap.set('i', '<a-j>', lazyredraw('<esc><cmd>m .+1<cr>==gi'), { desc = 'Move line down' })
vim.keymap.set('i', '<a-k>', lazyredraw('<esc><cmd>m .-2<cr>==gi'), { desc = 'Move line up' })
vim.keymap.set('v', '<a-j>', lazyredraw(":m '>+1<cr>gv=gv"), { desc = 'Move line down' })
vim.keymap.set('v', '<a-k>', lazyredraw(":m '<-2<cr>gv=gv"), { desc = 'Move line up' })
vim.keymap.set('n', '<a-down>', lazyredraw('<cmd>m .+1<cr>=='), { desc = 'Move line down' })
vim.keymap.set('n', '<a-up>', lazyredraw('<cmd>m .-2<cr>=='), { desc = 'Move line up' })
vim.keymap.set('i', '<a-down>', lazyredraw('<esc><cmd>m .+1<cr>==gi'), { desc = 'Move line down' })
vim.keymap.set('i', '<a-up>', lazyredraw('<esc><cmd>m .-2<cr>==gi'), { desc = 'Move line up' })
vim.keymap.set('v', '<a-down>', lazyredraw(":m '>+1<cr>gv=gv"), { desc = 'Move line down' })
vim.keymap.set('v', '<a-up>', lazyredraw(":m '<-2<cr>gv=gv"), { desc = 'Move line up' })

-- Add undo break-points.
vim.keymap.set('i', ',', ',<c-g>u')
vim.keymap.set('i', '.', '.<c-g>u')
vim.keymap.set('i', ';', ';<c-g>u')
