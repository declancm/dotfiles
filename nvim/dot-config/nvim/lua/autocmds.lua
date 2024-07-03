-- Brief highlight on yank.
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Disable relative line numbers when in command mode.
vim.api.nvim_create_autocmd('CmdlineEnter', {
  callback = function()
    if vim.o.number then
      vim.o.relativenumber = false
      vim.cmd('redraw')
    end
  end,
})
vim.api.nvim_create_autocmd('CmdlineLeave', {
  callback = function()
    if vim.o.number then
      vim.o.relativenumber = true
    end
  end,
})

-- Automatically save sessions on exit.
vim.api.nvim_create_autocmd('VimLeavePre', {
  callback = function()
    if vim.v.this_session ~= '' then
      vim.cmd.SaveSession()
    end
  end,
})

-- Change the C comment format.
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'c', 'cpp' },
  callback = function()
    vim.bo.commentstring = '// %s'
  end,
})

-- Enable search highlighting in the command-line.
vim.api.nvim_create_autocmd('CmdlineEnter', {
  callback = function()
    vim.o.hlsearch = true
    vim.cmd.redraw()
  end,
})
