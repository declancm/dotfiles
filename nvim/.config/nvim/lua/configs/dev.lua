local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap
local buf_keymap = vim.api.nvim_buf_set_keymap

-- UNDOTREE:
keymap('n', '<leader>u', '<Cmd>UndotreeToggle<CR><Cmd>wincmd p<CR>', opts)

-- TROUBLE:
require('trouble').setup {}

keymap('n', '<leader>tt', '<Cmd>TroubleToggle<CR>', opts)
keymap('n', '<leader>xx', '<cmd>Trouble<cr>', opts)
keymap('n', '<leader>xw', '<cmd>Trouble lsp_workspace_diagnostics<cr>', opts)
keymap('n', '<leader>xd', '<cmd>Trouble lsp_document_diagnostics<cr>', opts)
keymap('n', '<leader>xl', '<cmd>Trouble loclist<cr>', opts)
keymap('n', '<leader>xq', '<cmd>Trouble quickfix<cr>', opts)
keymap('n', 'gR', '<cmd>Trouble lsp_references<cr>', opts)

-- MARKDOWN-PREVIEW:
vim.cmd 'autocmd FileType markdown lua MarkdownPreview()'

function MarkdownPreview()
  buf_keymap(0, 'n', '<leader>md', '<Cmd>MarkdownPreview<CR>', opts)
  buf_keymap(0, 'n', '<leader>mds', '<Cmd>MarkdownPreviewStop<CR>', opts)
end
