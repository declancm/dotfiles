-- TELESCOPE:
require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        -- so <C-BS> works in telescope
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
      fuzzy = true, -- false will only do exact matching
      override_generic_sorter = false, -- override the generic sorter
      override_file_sorter = true, -- override the file sorter
      case_mode = 'smart_case', -- or "ignore_case" or "respect_case"
      -- the default case_mode is "smart_case"
    },
  },
}
require('telescope').load_extension 'fzf'
require('telescope').load_extension 'zoxide'
require('telescope').load_extension 'refactoring'

-- KEYMAPS:
local opts = { noremap = true, silent = true }
local set_keymap = vim.api.nvim_set_keymap

-- Telescope keymaps.
set_keymap(
  'n',
  '<leader>ff',
  "<Cmd>lua require('telescope.builtin').find_files()<CR>",
  opts
)
set_keymap(
  'n',
  '<leader>fg',
  "<Cmd>lua require('telescope.builtin').live_grep()<CR>",
  opts
)
set_keymap(
  'n',
  '<leader>fb',
  "<Cmd>lua require('telescope.builtin').buffers()<CR>",
  opts
)
set_keymap(
  'n',
  '<leader>fh',
  "<Cmd>lua require('telescope.builtin').help_tags()<CR>",
  opts
)

-- Telescope zoxide keymaps.
set_keymap('n', '<leader>fz', '<Cmd>Telescope zoxide list<CR>', opts)

-- Telescope refactoring keymaps.
set_keymap(
  'v',
  '<leader>fr',
  "<Esc><Cmd>lua require('telescope').extensions.refactoring.refactors()<CR>",
  opts
)
