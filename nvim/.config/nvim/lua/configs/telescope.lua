-- TELESCOPE:

require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        -- Delete the start of the word.
        ['<C-H>'] = function()
          vim.cmd 'normal! cB'
        end,
      },
    },
    prompt_prefix = '🔍 ',
    selection_caret = '▶ ',
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

local builtin = "<Cmd>lua require('telescope.builtin')"

keymap('n', '<Leader>ff', builtin .. '.find_files()<CR>', opts)
keymap('n', '<Leader>fg', builtin .. '.live_grep()<CR>', opts)
keymap('n', '<Leader>fb', builtin .. '.buffers()<CR>', opts)
keymap('n', '<Leader>fh', builtin .. '.help_tags()<CR>', opts)
keymap('n', '<Leader>fp', builtin .. '.builtin()<CR>', opts)
keymap('n', '<Leader>fc', builtin .. '.command_history()<CR>', opts)
keymap('n', '<Leader>fq', builtin .. '.quickfix()<CR>', opts)

-- Lsp keymaps.
keymap('n', '<Leader>fd', builtin .. '.diagnostics()<CR>', opts)
keymap('n', '<Leader>fr', builtin .. '.lsp_references()<CR>', opts)
keymap('n', '<Leader>fi', builtin .. '.lsp_implementations()<CR>', opts)
keymap('n', '<Leader>fa', builtin .. '.lsp_code_actions()<CR>', opts)

-- PLUGIN_KEYMAPS:

-- Zoxide.
keymap('n', '<Leader>fz', '<Cmd>Telescope zoxide list<CR>', opts)

-- Refactoring.
keymap(
  'v',
  '<Leader>fr',
  "<Esc><Cmd>lua require('telescope').extensions.refactoring.refactors()<CR>",
  opts
)
