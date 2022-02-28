local opts = { noremap = true, silent = true }
local set_keymap = vim.api.nvim_set_keymap
local buf_keymap = vim.api.nvim_buf_set_keymap

-- TERMINAL:
set_keymap('t', '<C-^>', '<C-\\><C-N><C-^>', opts)
set_keymap('t', '<C-O>', '<C-\\><C-N><C-O>', opts)
set_keymap('t', '<F3>', '<C-\\><C-N>', opts)
set_keymap('n', '<C-\\>', '<Cmd>lua ToggleTerminal()<CR>', opts)
set_keymap('t', '<C-\\>', '<Cmd>lua ToggleTerminal()<CR>', opts)

vim.cmd 'autocmd TermOpen * startinsert'
vim.cmd "autocmd BufEnter * if &buftype == 'terminal' | startinsert | endif"

function ToggleTerminal()
  if vim.bo.buftype == 'terminal' then
    vim.g.term_bufnr = vim.fn.bufnr()
    MaximizeWindow()
    if vim.g.term_prev == nil or vim.fn.bufname(vim.g.term_prev) == '' then
      vim.cmd 'call feedkeys("\\<C-\\>\\<C-N>\\<C-^>", "n")'
    else
      vim.cmd('keepalt buffer ' .. vim.g.term_prev)
    end
  else
    vim.g.term_prev = vim.fn.bufnr()
    if vim.g.term_bufnr == nil or vim.fn.bufname(vim.g.term_bufnr) == '' then
      vim.cmd 'keepalt term'
    else
      vim.cmd('keepalt buffer ' .. vim.g.term_bufnr)
    end
    vim.opt_local.relativenumber = false
    vim.opt_local.number = false
    vim.opt_local.signcolumn = 'no'
    MaximizeWindow()
  end
end

-- UNDOTREE:
set_keymap('n', '<leader>u', '<Cmd>UndotreeToggle<CR><Cmd>wincmd p<CR>', opts)

-- TROUBLE:
require('trouble').setup {}

set_keymap('n', '<leader>tt', '<Cmd>TroubleToggle<CR>', opts)
set_keymap('n', '<leader>xx', '<cmd>Trouble<cr>', opts)
set_keymap(
  'n',
  '<leader>xw',
  '<cmd>Trouble lsp_workspace_diagnostics<cr>',
  opts
)
set_keymap('n', '<leader>xd', '<cmd>Trouble lsp_document_diagnostics<cr>', opts)
set_keymap('n', '<leader>xl', '<cmd>Trouble loclist<cr>', opts)
set_keymap('n', '<leader>xq', '<cmd>Trouble quickfix<cr>', opts)
set_keymap('n', 'gR', '<cmd>Trouble lsp_references<cr>', opts)

-- MARKDOWN-PREVIEW:
vim.cmd 'autocmd FileType markdown lua MarkdownPreview()'

function MarkdownPreview()
  buf_keymap(0, 'n', '<leader>md', '<Cmd>MarkdownPreview<CR>', opts)
  buf_keymap(0, 'n', '<leader>mds', '<Cmd>MarkdownPreviewStop<CR>', opts)
end
