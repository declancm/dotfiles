-- FILE PROCESSING:

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

-- SESSIONS:

-- Store sessions like undo files.

local get_session_dir = function()
  local session_dir = vim.g.sessiondir or (vim.fn.stdpath('state') .. '/session')
  return vim.fs.normalize(session_dir)
end

local get_session_path = function(session_dir)
  local session_name = vim.fs.normalize(vim.fn.getcwd()):gsub('/', '%%')
  if not session_dir:match('/$') then
    session_dir = session_dir .. '/'
  end
  return session_dir .. session_name
end

local load_session = function()
  local session = io.open('Session.vim', 'rb')
  if not session then
    session = io.open(get_session_path(get_session_dir()), 'rb')
  end
  if session then
    vim.cmd(session:read('*all'))
  end
end

local save_session = function()
  local session_dir = get_session_dir()
  if vim.fn.isdirectory(session_dir) == 0 then
    vim.fn.mkdir(session_dir, 'p')
  end
  vim.cmd('mksession!')
  local infile = assert(io.open('Session.vim', 'rb'))
  local outfile = assert(io.open(get_session_path(session_dir), 'wb'))
  if outfile:write(infile:read('*all')) then
    os.remove('Session.vim')
  end
end

vim.api.nvim_create_user_command('LoadSession', load_session,
  { desc = 'Load the session for the current working directory.' })
vim.api.nvim_create_user_command('SaveSession', save_session,
  { desc = 'Save the session for the current working directory.' })
