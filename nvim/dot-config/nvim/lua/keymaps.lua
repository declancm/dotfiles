local lazyredraw = function(command)
  return '<cmd>set lz<cr>' .. command .. '<cmd>set nolz<cr>'
end

local map = function(mode, lhs, rhs, opts)
  if type(lhs) == 'table' then
    for _, key in ipairs(lhs) do
      vim.keymap.set(mode, key, rhs, opts)
    end
  else
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

-- Scrolling.
map({ 'n', 'x' }, '<c-u>', lazyredraw('<c-u>zz'), { desc = 'Scroll window upwards' })
map({ 'n', 'x' }, '<c-d>', lazyredraw('<c-d>zz'), { desc = 'Scroll window downwards' })

-- Navigating windows.
map({ 'n', 'i' }, { '<c-h>', '<c-left>' }, '<cmd>wincmd h<cr>', { desc = 'Move left a window' })
map({ 'n', 'i' }, { '<c-j>', '<c-down>' }, '<cmd>wincmd j<cr>', { desc = 'Move down a window' })
map({ 'n', 'i' }, { '<c-k>', '<c-up>' }, '<cmd>wincmd k<cr>', { desc = 'Move up a window' })
map({ 'n', 'i' }, { '<c-l>', '<c-right>' }, '<cmd>wincmd l<cr>', { desc = 'Move right a window' })

-- Completion.
map('i', '<c-space>', '<c-x><c-o>', { desc = 'Trigger omni completion' })

-- File processing.
map('n', '<leader>ct', '<cmd>TrimTrailingWhitespace<cr>', { desc = 'Trim trailing whitespace' })

-- Terminal.
map('t', '<esc><esc>', '<c-\\><c-n>', { desc = 'Enter normal mode' })

-- Quitting Neovim.
map('n', '<leader>q', '<cmd>wa<bar>qa<cr>', { desc = 'Save all windows and quit' })

-- Line movement.
map('v', '<', lazyredraw('<gv'), { desc = 'Shift lines left' })
map('v', '>', lazyredraw('>gv'), { desc = 'Shift lines right' })
map('n', { '<a-j>', '<a-down>' }, lazyredraw('<cmd>m .+1<cr>=='), { desc = 'Move line down' })
map('n', { '<a-k>', '<a-up>' }, lazyredraw('<cmd>m .-2<cr>=='), { desc = 'Move line up' })
map('i', { '<a-j>', '<a-down>' }, lazyredraw('<esc><cmd>m .+1<cr>==gi'), { desc = 'Move line down' })
map('i', { '<a-k>', '<a-up>' }, lazyredraw('<esc><cmd>m .-2<cr>==gi'), { desc = 'Move line up' })
map('v', { '<a-j>', '<a-down>' }, lazyredraw(":m '>+1<cr>gv=gv"), { desc = 'Move line down' })
map('v', { '<a-k>', '<a-up>' }, lazyredraw(":m '<-2<cr>gv=gv"), { desc = 'Move line up' })

-- Add undo break-points.
map('i', ',', ',<c-g>u')
map('i', '.', '.<c-g>u')
map('i', ';', ';<c-g>u')
