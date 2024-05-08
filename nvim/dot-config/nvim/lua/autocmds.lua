-- Brief highlight on yank.
vim.api.nvim_create_autocmd('TextYankPost', { callback = function() vim.highlight.on_yank() end })

-- Disable relative line numbers when in command mode.
vim.api.nvim_create_autocmd('CmdlineEnter', {
  callback = function()
    if vim.o.number then
      vim.o.relativenumber = false
      vim.cmd('redraw')
    end
  end
})
vim.api.nvim_create_autocmd('CmdlineLeave', {
  callback = function()
    if vim.o.number then
      vim.o.relativenumber = true
    end
  end
})

-- Automatically load sessions when a file isn't specified.
vim.api.nvim_create_autocmd('VimEnter', {
  callback = function()
    if vim.fn.eval('@%') == '' then
      vim.cmd.LoadSession()
    end
  end,
  nested = true
})

-- Automatically save sessions on exit.
vim.api.nvim_create_autocmd('VimLeavePre', { callback = function() vim.cmd.SaveSession() end })

-- Change the C comment format.
vim.api.nvim_create_autocmd('FileType',
  { pattern = { 'c', 'cpp' }, callback = function() vim.bo.commentstring = '// %s' end })
