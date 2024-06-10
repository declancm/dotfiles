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

-- Automatically load and save sessions when a file isn't specified.
local save_on_exit = false

vim.api.nvim_create_autocmd('VimEnter', {
  callback = function()
    if vim.fn.eval('@%') == '' then
      vim.cmd.LoadSession()
      save_on_exit = true
    end
  end,
  nested = true,
})

vim.api.nvim_create_autocmd('VimLeavePre', {
  callback = function()
    if vim.v.this_session ~= '' or save_on_exit then
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
