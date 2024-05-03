-- FZF-LUA:

local fzf = require('fzf-lua')

fzf.setup({
  grep = {
    rg_opts = '--column --line-number --no-heading --color=always --smart-case --max-columns=4096 --hidden --trim -e'
  }
})

vim.keymap.set('n', '<leader>ff', fzf.files)
vim.keymap.set('n', '<leader>fg', fzf.live_grep)
