local opts = { noremap = true, silent = true }
local set_keymap = vim.api.nvim_set_keymap

-- VIM2VSCODE:

-- GIT-SCRIPTS-VIM:

-- vim.g.commit_on_save = 1
-- vim.g.commit_no_warnings = 1

-- CINNAMON-SCROLL:

vim.g.cinnamon_repeat = 0
vim.g.cinnamon_no_defaults = 1

set_keymap('n', '{', '<Cmd>Cinnamon { 0 <CR>', opts)
set_keymap('n', '}', '<Cmd>Cinnamon } 0 <CR>', opts)
set_keymap('x', '{', '<Cmd>call VParagraphUp()<CR>', opts)
set_keymap('x', '}', '<Cmd>call VParagraphDown()<CR>', opts)

vim.cmd [[
function! VParagraphUp()
    if line(".") != 1 && line(".") != line("$") | silent exec "norm! k" | endif
    silent exec "Cinnamon { 0"
    if line(".") != 1 || len(getline(".")) == 0 | silent exec "norm! j" | endif
endfunction
function! VParagraphDown()
    if line(".") != 1 && line(".") != line("$") | silent exec "norm! j" | endif
    silent exec "Cinnamon } 0"
    if line(".") != line("$") || len(getline(".")) == 0 | silent exec "norm! k" | endif
endfunction
]]

set_keymap('n', '<C-u>', '<Cmd>Cinnamon <C-u> <CR>', opts)
set_keymap('n', '<C-d>', '<Cmd>Cinnamon <C-d> <CR>', opts)
set_keymap('i', '<C-u>', '<Cmd>Cinnamon <C-u> <CR>', opts)
set_keymap('i', '<C-d>', '<Cmd>Cinnamon <C-d> <CR>', opts)

set_keymap('n', '<C-b>', '<Cmd>Cinnamon <C-b> 1 1 <CR>', opts)
set_keymap('n', '<C-f>', '<Cmd>Cinnamon <C-f> 1 1 <CR>', opts)
set_keymap('i', '<C-b>', '<Cmd>Cinnamon <C-b> 1 1 <CR>', opts)
set_keymap('i', '<C-f>', '<Cmd>Cinnamon <C-f> 1 1 <CR>', opts)
set_keymap('n', '<PageUp>', '<Cmd>Cinnamon <C-b> 1 1 <CR>', opts)
set_keymap('n', '<PageDown>', '<Cmd>Cinnamon <C-f> 1 1 <CR>', opts)
set_keymap('i', '<PageUp>', '<Cmd>Cinnamon <C-b> 1 1 <CR>', opts)
set_keymap('i', '<PageDown>', '<Cmd>Cinnamon <C-f> 1 1 <CR>', opts)

set_keymap('n', '<C-o>', '<Cmd>Cinnamon <C-o> 0 0 3 <CR>', opts)
set_keymap('n', '<C-i>', '<Cmd>Cinnamon <C-i> 0 0 3 <CR>', opts)

-- set_keymap('n', 'gg', '<Cmd>Cinnamon gg 0 0 3 <CR>', opts)
-- set_keymap('n', 'G', '<Cmd>Cinnamon G 0 0 3 <CR>', opts)
-- set_keymap('n', 'gg', '<Cmd>Cinnamon gg 0 0 3 <CR>', opts)
-- set_keymap('n', 'G', '<Cmd>Cinnamon G 0 0 3 <CR>', opts)
