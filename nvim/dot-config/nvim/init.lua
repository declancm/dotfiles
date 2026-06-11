-- set leader before anything else
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.o.number = true -- line numbers
vim.o.undofile = true -- persistent undo

vim.pack.add({
  { src = 'https://github.com/catppuccin/nvim', name = 'catppuccin' }, -- theme
  'https://github.com/ibhagwan/fzf-lua', -- search
  -- TODO: plugin has been archived so replace once upstreamed
  'https://github.com/nvim-treesitter/nvim-treesitter', -- tree-sitter
  'https://github.com/tpope/vim-sleuth', -- smart indents
})

-- select theme
vim.cmd.colorscheme('catppuccin-nvim')

-- setup search like vscode / obsidian
require('fzf-lua').setup({})
vim.keymap.set('', '<D-p>', require('fzf-lua').files) -- find files (vscode)
vim.keymap.set('', '<D-o>', require('fzf-lua').files) -- find files (obsidian)
vim.keymap.set('n', '<D-F>', require('fzf-lua').live_grep) -- find string

-- setup c++ syntax highlighting (run `:TSInstall cpp`)
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'cpp' },
  callback = function() vim.treesitter.start() end,
})

