-- OIL:

require('oil').setup({
  view_options = { show_hidden = true }
})

vim.keymap.set('n', '-', '<cmd>Oil<cr>', { desc = "Open file's parent directory" })

-- PRINTF:

local printf = require('printf')

printf.setup({
  print_func = { variable = '__PRETTY_FUNCTION__' }
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'c', 'cpp' },
  callback = function()
    vim.keymap.set('n', '<leader>dv', printf.print_var, { desc = 'Debug print variable value', buffer = true })
    vim.keymap.set('n', '<leader>dl', printf.print_line, { desc = 'Debug print line number', buffer = true })
    vim.keymap.set('n', '<leader>df', printf.print_func, { desc = 'Debug print function name', buffer = true })
    vim.keymap.set('n', '<leader>dc', printf.clean, { desc = 'Debug print cleanup', buffer = true })
  end
})

-- WHICH-KEY:

require('which-key').setup()

-- MAXIMIZE:

require('maximize').setup()

vim.keymap.set('n', '<leader>z', require('maximize').toggle, { desc = 'Toggle maximizing the current buffer' })
