local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

-- UNDOTREE:

keymap('n', '<leader>u', '<Cmd>UndotreeToggle<CR><Cmd>wincmd p<CR>', opts)

-- CHADTREE:

local chadtree_settings = {
  ['options.close_on_open'] = true,
  ['theme.text_colour_set'] = 'solarized_light',
  -- ['options.session'] = false,
}
vim.api.nvim_set_var('chadtree_settings', chadtree_settings)

keymap('n', '<leader>ct', '<Cmd>CHADopen<CR>', opts)
keymap('n', '<leader>cl', '<Cmd>CHADopen --version-ctl<CR>', opts)
keymap('n', '<leader>cq', '<Cmd>call setqflist([])<CR>', opts)

-- MARKDOWN-PREVIEW:

keymap('n', '<leader>md', '<Cmd>MarkdownPreview<CR>', opts)
keymap('n', '<leader>ms', '<Cmd>MarkdownPreviewStop<CR>', opts)
