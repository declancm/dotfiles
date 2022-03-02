-- CHADTREE:

local chadtree_settings = {
  ['theme.text_colour_set'] = 'solarized_light',
  ['options.session'] = false,
  ['options.close_on_open'] = true,
}
vim.api.nvim_set_var('chadtree_settings', chadtree_settings)

local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

keymap('n', '<leader>ct', '<Cmd>CHADopen<CR>', opts)
keymap('n', '<leader>cl', '<Cmd>CHADopen --version-ctl<CR>', opts)
keymap('n', '<leader>cq', '<Cmd>call setqflist([])<CR>', opts)
