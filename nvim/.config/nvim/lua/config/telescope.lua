-- TELESCOPE:

local telescope = require('telescope')

local file_ignore_patterns = { '.git/', 'tmp/', '.venv/', 'build/' }

telescope.setup({
  defaults = {
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case',
      '--hidden',
      '--trim'
    },
    mappings = {
      i = {
        ['<c-bs>'] = function() vim.api.nvim_input('<c-w>') end,
        ['<c-h>'] = function() vim.api.nvim_input('<c-w>') end
      }
    }
  },
  pickers = {
    find_files = {
      file_ignore_patterns = file_ignore_patterns,
      find_command = { 'rg', '--ignore', '--follow', '--hidden', '--files' }
    },
    live_grep = { file_ignore_patterns = file_ignore_patterns },
    grep_string = { file_ignore_patterns = file_ignore_patterns }
  }
})

telescope.load_extension('fzf')

-- KEYMAPS:

local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})

vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fc', builtin.commands, {})
vim.keymap.set('n', '<leader>f:', builtin.command_history, {})
vim.keymap.set('n', '<leader>f/', builtin.search_history, {})
vim.keymap.set('n', '<leader>fm', builtin.marks, {})
vim.keymap.set('n', '<leader>fq', builtin.quickfix, {})
vim.keymap.set('n', '<leader>fl', builtin.loclist, {})

vim.keymap.set('n', 'gd', builtin.lsp_definitions, {})
vim.keymap.set('n', 'gr', builtin.lsp_references, {})
vim.keymap.set('n', 'gi', builtin.lsp_implementations, {})
vim.keymap.set('n', 'gt', builtin.lsp_type_definitions, {})
vim.keymap.set('n', '<leader>fd', builtin.diagnostics, {})
