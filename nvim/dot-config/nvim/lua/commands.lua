-- Trim trailing whitespace.
vim.api.nvim_create_user_command('TrimTrailingWhitespace', function()
  local curpos = vim.api.nvim_win_get_cursor(0)
  vim.cmd([[%s/\s\+$//e]])
  vim.api.nvim_win_set_cursor(0, curpos)
end, { desc = 'Trim trailing whitespace for the current document.' })

-- Format document.
vim.api.nvim_create_user_command('FormatDocument', function()
  vim.lsp.buf.format({ async = true })
end, { desc = 'Format the current document using the attached language server client.' })
