-- BULLETS:
vim.g.bullets_enabled_file_types = { 'markdown', 'text' }
vim.g.bullets_enable_in_empty_buffers = 0

-- KOMMENTARY:
-- Disable defaults.
vim.g.kommentary_create_default_mappings = false

-- Set <C-/> keymaps.
vim.api.nvim_set_keymap('i', '<C-_>', '<Esc><Plug>kommentary_line_default', {})
vim.api.nvim_set_keymap('n', '<C-_>', '<Plug>kommentary_line_default', {})
vim.api.nvim_set_keymap('x', '<C-_>', '<Plug>kommentary_visual_default<Esc>', {})

-- Keymaps to increase or decrease the comment depth level.
vim.api.nvim_set_keymap('n', '<leader>cic', '<Plug>kommentary_line_increase', {})
vim.api.nvim_set_keymap('n', '<leader>cdc', '<Plug>kommentary_line_decrease', {})
vim.api.nvim_set_keymap('n', '<leader>ci', '<Plug>kommentary_motion_increase', {})
vim.api.nvim_set_keymap('n', '<leader>cd', '<Plug>kommentary_motion_decrease', {})
vim.api.nvim_set_keymap('x', '<leader>ci', '<Plug>kommentary_visual_increase', {})
vim.api.nvim_set_keymap('x', '<leader>cd', '<Plug>kommentary_visual_decrease', {})

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
