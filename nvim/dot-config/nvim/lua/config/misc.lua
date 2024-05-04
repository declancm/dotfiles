-- OIL:

require('oil').setup({
  view_options = { show_hidden = true }
})

-- PRINTF:

require('printf').setup({
  print_func = { variable = '__PRETTY_FUNCTION__' }
})

-- UNDOTREE:

vim.keymap.set('n', '<leader>u', '<cmd>UndotreeShow | UndotreeFocus<cr>', {})

-- COMMENTS:

require('Comment').setup({
  ignore = '^$' -- Ignore blank lines.
})
