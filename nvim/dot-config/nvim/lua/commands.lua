-- FILE PROCESSING:

-- Trim trailing whitespace.
vim.api.nvim_create_user_command('TrimTrailingWhitespace', function()
  if not vim.bo.modifiable then
    return
  end

  local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
  for i, line in ipairs(lines) do
    local trailing = line:match('^.-(%s*)$') ~= nil
    if trailing then
      local trimmed = line:match('^(.-)%s*$') or ''
      vim.api.nvim_buf_set_lines(0, i - 1, i, false, { trimmed })
    end
  end
end, { desc = 'Trim trailing whitespace for the current document.' })

-- SESSIONS:

-- Store sessions like undo files.

local session_dir = vim.fs.joinpath(vim.fn.stdpath('state'), '/session')

local get_session_path = function()
  local session_name = vim.fs.normalize(vim.fn.getcwd()):gsub('/', '%%')
  return vim.fs.joinpath(session_dir, session_name)
end

vim.api.nvim_create_user_command('LoadSession', function()
  local session = get_session_path()
  if vim.fn.filereadable(session) ~= 0 then
    vim.cmd('wincmd 1w') -- Leave any floating windows
    vim.cmd('silent! source ' .. vim.fn.fnameescape(session))
  end
end, { desc = 'Load the session for the current working directory.' })

vim.api.nvim_create_user_command('SaveSession', function()
  vim.fn.mkdir(session_dir, 'p')
  vim.cmd('mksession! ' .. vim.fn.fnameescape(get_session_path()))
  vim.notify('Session saved: ' .. vim.v.this_session)
end, { desc = 'Save the session for the current working directory.' })

-- MISC:

-- Set tab width.
vim.api.nvim_create_user_command('SetTabWidth', function(args)
  local tab_width = tonumber(args.fargs[1])
  if tab_width then
    vim.bo.tabstop = tab_width
    vim.bo.softtabstop = tab_width
    vim.bo.shiftwidth = tab_width
  end
end, { nargs = 1, desc = 'Set the tab width for the current buffer.' })
