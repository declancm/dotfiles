local opts = { noremap = true, silent = true }
local set_keymap = vim.api.nvim_set_keymap
local buf_set_keymap = vim.api.nvim_buf_set_keymap

-- Native terminal.
set_keymap('t', '<C-^>', '<C-\\><C-N><C-^>', opts)
set_keymap('t', '<C-O>', '<C-\\><C-N><C-O>', opts)
set_keymap('n', '<C-\\>', '<Cmd>call ToggleTerminal()<CR>', opts)
set_keymap('t', '<C-\\>', '<Cmd>call ToggleTerminal()<CR>', opts)

vim.cmd [[
autocmd TermOpen * startinsert
autocmd BufEnter * if &buftype == "terminal" | startinsert | endif

function! ToggleTerminal()
    if &buftype == "terminal"
        let g:term_bufnr = bufnr()
        silent exec "call feedkeys(\"\<C-^>\")"
    else
        if !exists("g:term_bufnr") || bufname(g:term_bufnr) == ""
            silent exec "term"
        else
            silent exec "buffer " . g:term_bufnr
        endif
    endif
endfunction
]]

-- UNDOTREE:
set_keymap('n', '<F5>', '<Cmd>UndotreeToggle<CR><Cmd>wincmd p<CR>', opts)
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
set_keymap('n', '<leader>mdp', '<Cmd>MarkdownPreview<CR>', opts)
set_keymap('n', '<leader>mds', '<Cmd>MarkdownPreviewStop<CR>', opts)
