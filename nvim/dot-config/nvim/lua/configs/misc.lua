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

-- FLASH:

require('flash').setup({
  modes = { char = { enabled = false } },
})

vim.keymap.set({ 'n', 'x', 'o' }, 's', function()
  require('flash').jump()
end, { desc = 'Flash' })
vim.keymap.set('c', '<c-s>', function()
  require('flash').toggle()
end, { desc = 'Toggle Flash Search' })

-- MAXIMIZE:

require('maximize').setup()

vim.keymap.set('n', '<leader>z', require('maximize').toggle, { desc = 'Toggle maximizing the current window' })

-- CINNAMON:

local cinnamon = require('cinnamon')

cinnamon.setup({
  options = { mode = 'window' },
})

vim.keymap.set('n', 'n', function()
  cinnamon.scroll('n')
end)
vim.keymap.set('n', 'N', function()
  cinnamon.scroll('N')
end)
vim.keymap.set('n', '<c-o>', function()
  cinnamon.scroll('<c-o>')
end)
vim.keymap.set('n', '<c-i>', function()
  cinnamon.scroll('<c-s-i>')
end)

-- SURROUND:

require('nvim-surround').setup()
