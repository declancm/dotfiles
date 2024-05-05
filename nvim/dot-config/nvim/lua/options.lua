-- OPTIONS:

vim.opt.swapfile = false                                   -- Don't create swapfiles.
vim.opt.undofile = true                                    -- Use an undo file.
vim.opt.relativenumber = true                              -- Use relative line numbers.
vim.opt.number = true                                      -- Line number at cursor.
vim.opt.ignorecase = true                                  -- Ignore case when searching.
vim.opt.smartcase = true                                   -- Ignore ignorecase option when a capital is used.
vim.opt.wrap = false                                       -- Disable line wrap.
vim.opt.signcolumn = 'yes'                                 -- Enable the sign column for gitsigns etc.
vim.opt.scrolloff = 8                                      -- Minimum number of screen lines above/below the cursor.
vim.opt.backspace = { 'indent', 'eol', 'start', 'nostop' } -- Better backspace.
vim.opt.updatetime = 1000                                  -- Delay before CursorHold event is activated.
vim.opt.timeoutlen = 300                                   -- Maximum time between key presses for a keymap.
vim.opt.mouse = ''                                         -- Disable mouse.
vim.opt.spell = true                                       -- Enable spell-checking.
vim.opt.spelllang = 'en_us'                                -- English US for the spell-check language.
vim.opt.modeline = false                                   -- Disable modelines as they can break things.
vim.opt.tabstop = 4                                        -- Set tab character width.
vim.opt.softtabstop = 4                                    -- Inserted spaces count per tab key press.
vim.opt.shiftwidth = 4                                     -- Number of spaces for each step of autoindent.
vim.opt.sessionoptions:remove('blank')                     -- Don't save empty windows in sessions.
vim.opt.virtualedit = 'block'                              -- Allow virtual edit in block-wise visual mode.
vim.opt.pumheight = 8                                      -- Maximum number of items to show in auto-complete menu.
vim.opt.showmode = false                                   -- Don't show the current mode in the command-line.
vim.opt.ruler = false                                      -- Don't show the cursor position in the command-line.
