-- OIL:

require('oil').setup({
  view_options = { show_hidden = true }
})

-- PRINTF:

require('printf').setup({
  print_func = { variable = '__PRETTY_FUNCTION__' }
})

-- WHICH-KEY:

require('which-key').setup()
