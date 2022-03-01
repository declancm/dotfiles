-- TELESCOPE:
require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        -- <C-BS> in telescope.
        ['<C-H>'] = function()
          vim.cmd [[normal! cB]]
        end,
      },
    },
  },
  pickers = {
    find_files = {
      find_command = { 'rg', '--ignore', '-L', '--hidden', '--files' },
      -- hidden = true,
      file_ignore_patterns = { '^.git/' },
    },
  },
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = false,
      override_file_sorter = true,
      case_mode = 'smart_case',
    },
  },
}
require('telescope').load_extension 'fzf'
require('telescope').load_extension 'zoxide'
require('telescope').load_extension 'refactoring'

-- KEYMAPS:
local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

-- Telescope keymaps.
keymap(
  'n',
  '<leader>ff',
  "<Cmd>lua require('telescope.builtin').find_files()<CR>",
  opts
)
keymap(
  'n',
  '<leader>fg',
  "<Cmd>lua require('telescope.builtin').live_grep()<CR>",
  opts
)
keymap(
  'n',
  '<leader>fb',
  "<Cmd>lua require('telescope.builtin').buffers()<CR>",
  opts
)
keymap(
  'n',
  '<leader>fh',
  "<Cmd>lua require('telescope.builtin').help_tags()<CR>",
  opts
)

-- Telescope zoxide keymaps.
keymap('n', '<leader>fz', '<Cmd>Telescope zoxide list<CR>', opts)

-- Telescope refactoring keymaps.
keymap(
  'v',
  '<leader>fr',
  "<Esc><Cmd>lua require('telescope').extensions.refactoring.refactors()<CR>",
  opts
)
