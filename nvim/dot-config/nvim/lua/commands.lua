-- FILE PROCESSING:

-- Trim trailing whitespace.
vim.api.nvim_create_user_command('TrimTrailingWhitespace', function()
  local curpos = vim.api.nvim_win_get_cursor(0)
  vim.cmd([[%s/\s\+$//e]])
  vim.api.nvim_win_set_cursor(0, curpos)
end, { desc = 'Trim trailing whitespace for the current document.' })

-- SESSIONS:

-- Store sessions like undo files.
-- g:sessiondir - The directory where the sessions will be stored.
-- g:persistoptions - A list of options to persist between sessions.

local get_session_dir = function()
  local session_dir = vim.g.sessiondir or (vim.fn.stdpath('state') .. '/session')
  return vim.fn.fnamemodify(vim.fs.normalize(session_dir), ':p')
end

local get_session_path = function(session_dir)
  local session_name = vim.fs.normalize(vim.fn.getcwd()):gsub('/', '%%')
  return vim.fs.joinpath(session_dir, session_name)
end

vim.api.nvim_create_user_command('LoadSession', function()
  local session_path = 'Session.vim'
  local session = io.open(session_path, 'rb')

  if not session then
    session_path = get_session_path(get_session_dir())
    session = io.open(session_path, 'rb')
  end

  if session then
    vim.cmd.wincmd({ 'w', count = 1 })
    vim.cmd(session:read('*all'))
    vim.v.this_session = vim.fn.fnamemodify(session_path, ':p')
  end
end, { desc = 'Load the session for the current working directory.' })

vim.api.nvim_create_user_command('SaveSession', function()
  -- Create the session.
  local session_dir = get_session_dir()
  if vim.fn.isdirectory(session_dir) == 0 then
    vim.fn.mkdir(session_dir, 'p')
  end
  vim.cmd('mksession!')

  -- Append options.
  local session = assert(io.open('Session.vim', 'ab'))
  for _, option in ipairs(vim.g.persistoptions or {}) do
    local value = vim.o[option]
    if type(value) == 'string' then
      value = string.format('%q', value)
    else
      value = tostring(value)
    end
    session:write('lua vim.o.' .. option .. ' = ' .. value .. '\n')
  end
  session:close()

  -- Move to the sessions directory.
  local infile = assert(io.open('Session.vim', 'rb'))
  local outfile = assert(io.open(get_session_path(session_dir), 'wb'))
  if outfile:write(infile:read('*all')) then
    os.remove('Session.vim')
  end
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
