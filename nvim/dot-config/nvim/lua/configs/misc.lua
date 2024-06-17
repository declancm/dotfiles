-- TOGGLETERM:

require('toggleterm').setup({
  direction = 'float',
  open_mapping = [[<c-\>]],
  start_in_insert = true,
})

local Terminal = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({
  cmd = 'lazygit',
  dir = 'git_dir',
  direction = 'float',
  hidden = true,
})

vim.keymap.set({ 'n', 't' }, '<c-g>', function()
  lazygit:toggle()
end, { desc = 'Toggle Lazygit' })

-- OIL:

require('oil').setup({
  view_options = { show_hidden = true },
})

vim.keymap.set('n', '-', '<cmd>Oil<cr>', { desc = "Open file's parent directory" })

-- PRINTF:

local printf = require('printf')

printf.setup({
  print_func = { variable = '__PRETTY_FUNCTION__' },
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'c', 'cpp' },
  callback = function()
    vim.keymap.set('n', '<leader>dv', printf.print_var, { buffer = true, desc = 'Debug print variable value' })
    vim.keymap.set('n', '<leader>dl', printf.print_line, { buffer = true, desc = 'Debug print line number' })
    vim.keymap.set('n', '<leader>df', printf.print_func, { buffer = true, desc = 'Debug print function name' })
    vim.keymap.set('n', '<leader>dc', printf.clean, { buffer = true, desc = 'Debug print cleanup' })
  end,
})

-- WHICH-KEY:

require('which-key').setup()

-- MAXIMIZE:

require('maximize').setup()

vim.keymap.set('n', '<leader>z', require('maximize').toggle, { desc = 'Toggle maximizing the current window' })

-- SURROUND:

require('nvim-surround').setup()
