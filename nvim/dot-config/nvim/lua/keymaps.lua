local lz = function(command)
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
map({ 'n', 'x' }, '<c-u>', lz('<c-u>zz'), { desc = 'Scroll window upwards' })
map({ 'n', 'x' }, '<c-d>', lz('<c-d>zz'), { desc = 'Scroll window downwards' })

-- Navigating windows.
map({ 'n', 'i', 't' }, { '<c-h>', '<c-left>' }, '<cmd>wincmd h<cr>', { desc = 'Move left a window' })
map({ 'n', 'i', 't' }, { '<c-j>', '<c-down>' }, '<cmd>wincmd j<cr>', { desc = 'Move down a window' })
map({ 'n', 'i', 't' }, { '<c-k>', '<c-up>' }, '<cmd>wincmd k<cr>', { desc = 'Move up a window' })
map({ 'n', 'i', 't' }, { '<c-l>', '<c-right>' }, '<cmd>wincmd l<cr>', { desc = 'Move right a window' })

-- Completion.
map('i', '<c-space>', '<c-x><c-o>', { desc = 'Trigger omni completion' })
map('i', '<tab>', "pumvisible() ? '<c-e><tab>' : '<tab>'", { expr = true })
map('i', '<cr>', "pumvisible() ? '<c-e><cr>' : '<cr>'", { expr = true })

-- Line movement.
map('x', '<', lz('<gv'), { desc = 'Shift lines left' })
map('x', '>', lz('>gv'), { desc = 'Shift lines right' })
map('n', { '<a-j>', '<a-down>' }, lz('<cmd>m .+1<cr>=='), { desc = 'Move line down' })
map('n', { '<a-k>', '<a-up>' }, lz('<cmd>m .-2<cr>=='), { desc = 'Move line up' })
map('i', { '<a-j>', '<a-down>' }, lz('<esc><cmd>m .+1<cr>==gi'), { desc = 'Move line down' })
map('i', { '<a-k>', '<a-up>' }, lz('<esc><cmd>m .-2<cr>==gi'), { desc = 'Move line up' })
map('x', { '<a-j>', '<a-down>' }, lz(":m '>+1<cr>gv=gv"), { desc = 'Move line down' })
map('x', { '<a-k>', '<a-up>' }, lz(":m '<-2<cr>gv=gv"), { desc = 'Move line up' })

-- Add undo break-points.
map('i', ',', ',<c-g>u')
map('i', '.', '.<c-g>u')
map('i', ';', ';<c-g>u')

-- Better j and k.
map({ 'n', 'x' }, { 'j', '<down>' }, [[v:count ? "m'" . v:count . 'j' : 'gj']], { expr = true, desc = 'Move down' })
map({ 'n', 'x' }, { 'k', '<up>' }, [[v:count ? "m'" . v:count . 'k' : 'gk']], { expr = true, desc = 'Move up' })

-- Custom commands.
map('n', '<leader>ct', '<cmd>TrimTrailingWhitespace<cr>', { desc = 'Trim trailing whitespace' })
map('n', '<leader>ss', '<cmd>SaveSession<cr>', { desc = 'Save session' })
map('n', '<leader>sl', '<cmd>LoadSession<cr>', { desc = 'Load session' })

-- Miscellaneous.
map('n', 'x', '"_x', { desc = 'Delete char without yank' })
map('n', 'Y', 'yg_', { desc = 'Yank to end of line' })
map('n', '<esc>', '<cmd>nohls<cr><esc>', { desc = 'Clear search highlights' })
map('t', '<esc><esc>', '<c-\\><c-n>', { desc = 'Enter normal mode' })
map('n', '<leader>q', '<cmd>confirm qall<cr>', { desc = 'Quit Neovim' })
map('c', '<c-a>', '<home>', { desc = 'GNU Readline CTRL-A' })
