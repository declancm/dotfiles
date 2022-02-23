local opts = { noremap = true, silent = true }

-- VIM2VSCODE:

-- GIT-SCRIPTS-VIM:

-- vim.g.gitscripts_no_defaults = 1

-- Asynchronous git commit. Requires plenary.
function AsyncGitCommit(directory)
	directory = directory or vim.fn.getcwd()
	scriptsLocation = os.getenv 'GITSCRIPTS_LOCATION'
	local job = require 'plenary.job'
	job
		:new({
			command = scriptsLocation .. '/commit-silent.sh',
			cwd = directory,
			on_exit = function(j, exit_code)
				if exit_code ~= 0 then
					print 'Error: The git commit failed.'
				end
			end,
		})
		:start()
end

-- Asynchronous git pull. Requires plenary.
function AsyncGitPull(directory)
	directory = directory or vim.fn.getcwd()
	scriptsLocation = os.getenv 'GITSCRIPTS_LOCATION'
	local job = require 'plenary.job'
	job
		:new({
			command = scriptsLocation .. '/pull-silent.sh',
			cwd = directory,
			on_exit = function(j, exit_code)
				if exit_code ~= 0 then
					print 'Error: The git pull failed.'
				end
			end,
		})
		:start()
end

-- vim.api.nvim_set_keymap("n", "<leader>gc", "<Cmd>lua AsyncCommit(vim.fn.getcwd())<CR>", opts)

-- CINNAMON-SCROLL:

vim.g.cinnamon_repeat = 0
vim.g.cinnamon_no_defaults = 1

vim.api.nvim_set_keymap('n', '{', '<Cmd>Cinnamon { 0 <CR>', opts)
vim.api.nvim_set_keymap('n', '}', '<Cmd>Cinnamon } 0 <CR>', opts)
vim.api.nvim_set_keymap('x', '{', '<Cmd>call VParagraphUp()<CR>', opts)
vim.api.nvim_set_keymap('x', '}', '<Cmd>call VParagraphDown()<CR>', opts)

vim.cmd [[
function! VParagraphUp()
    silent exec "norm! k" | silent exec "Cinnamon { 0"
    if line(".") != 1 || len(getline(".")) == 0 | silent exec "norm! j" | endif
endfunction
function! VParagraphDown()
    silent exec "norm! j" | silent exec "Cinnamon } 0"
    if line(".") != line("$") || len(getline(".")) == 0 | silent exec "norm! k" | endif
endfunction
]]

vim.api.nvim_set_keymap('n', '<C-u>', '<Cmd>Cinnamon <C-u> <CR>', opts)
vim.api.nvim_set_keymap('n', '<C-d>', '<Cmd>Cinnamon <C-d> <CR>', opts)
vim.api.nvim_set_keymap('i', '<C-u>', '<Cmd>Cinnamon <C-u> <CR>', opts)
vim.api.nvim_set_keymap('i', '<C-d>', '<Cmd>Cinnamon <C-d> <CR>', opts)

vim.api.nvim_set_keymap('n', '<C-b>', '<Cmd>Cinnamon <C-b> 1 1 <CR>', opts)
vim.api.nvim_set_keymap('n', '<C-f>', '<Cmd>Cinnamon <C-f> 1 1 <CR>', opts)
vim.api.nvim_set_keymap('i', '<C-b>', '<Cmd>Cinnamon <C-b> 1 1 <CR>', opts)
vim.api.nvim_set_keymap('i', '<C-f>', '<Cmd>Cinnamon <C-f> 1 1 <CR>', opts)
vim.api.nvim_set_keymap('n', '<PageUp>', '<Cmd>Cinnamon <C-b> 1 1 <CR>', opts)
vim.api.nvim_set_keymap('n', '<PageDown>', '<Cmd>Cinnamon <C-f> 1 1 <CR>', opts)
vim.api.nvim_set_keymap('i', '<PageUp>', '<Cmd>Cinnamon <C-b> 1 1 <CR>', opts)
vim.api.nvim_set_keymap('i', '<PageDown>', '<Cmd>Cinnamon <C-f> 1 1 <CR>', opts)

vim.api.nvim_set_keymap('n', '<C-o>', '<Cmd>Cinnamon <C-o> 0 0 3 <CR>', opts)
vim.api.nvim_set_keymap('n', '<C-i>', '<Cmd>Cinnamon <C-i> 0 0 3 <CR>', opts)

-- vim.api.nvim_set_keymap('n', 'gg', '<Cmd>Cinnamon gg 0 0 3 <CR>', opts)
-- vim.api.nvim_set_keymap('n', 'G', '<Cmd>Cinnamon G 0 0 3 <CR>', opts)
-- vim.api.nvim_set_keymap('n', 'gg', '<Cmd>Cinnamon gg 0 0 3 <CR>', opts)
-- vim.api.nvim_set_keymap('n', 'G', '<Cmd>Cinnamon G 0 0 3 <CR>', opts)
