-- local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

-- QUICKSCOPE:

vim.g.qs_highlight_on_keys = { 'f', 'F', 't', 'T' }
vim.g.qs_max_chars = 160

-- BULLETS:

vim.g.bullets_enabled_file_types = { 'markdown', 'text' }
vim.g.bullets_enable_in_empty_buffers = 0

-- KOMMENTARY:

vim.g.kommentary_create_default_mappings = false

-- Set <C-/> keymaps.
keymap('i', '<C-_>', '<Esc><Plug>kommentary_line_default', {})
keymap('n', '<C-_>', '<Plug>kommentary_line_default', {})
keymap('x', '<C-_>', '<Plug>kommentary_visual_default<Esc>', {})

-- Keymaps to increase or decrease the comment depth level.
keymap('n', '<leader>cic', '<Plug>kommentary_line_increase', {})
keymap('n', '<leader>cdc', '<Plug>kommentary_line_decrease', {})
keymap('n', '<leader>ci', '<Plug>kommentary_motion_increase', {})
keymap('n', '<leader>cd', '<Plug>kommentary_motion_decrease', {})
keymap('x', '<leader>ci', '<Plug>kommentary_visual_increase', {})
keymap('x', '<leader>cd', '<Plug>kommentary_visual_decrease', {})

-- Configure the languages.
require('kommentary.config').configure_language('default', {
  prefer_single_line_comments = true,
  use_consistent_indentation = true,
  ignore_whitespace = true,
})
require('kommentary.config').configure_language('lua', {
  single_line_comment_string = '--',
})
require('kommentary.config').configure_language('vim', {
  single_line_comment_string = '"',
})
require('kommentary.config').configure_language('cpp', {
  single_line_comment_string = '//',
})
require('kommentary.config').configure_language('python', {
  single_line_comment_string = '#',
})
