local opts = { noremap = true, silent = true }

vim.api.nvim_set_keymap("v", "<leader>P", '"*P`[v`]', { noremap = true })
-- Improve the <Home> key.
vim.api.nvim_set_keymap("", "<Home>", "zH^", { noremap = true })
vim.api.nvim_set_keymap("i", "<Home>", "<Esc>zHI", { noremap = true })

-- Source config file.
vim.api.nvim_set_keymap(
  "n",
  "<leader>sc",
  ':wa<CR>:source $MYVIMRC<CR>:echom "Your config file was sourced."<CR>',
  opts
)

-- Creating windows.
vim.api.nvim_set_keymap("n", "<leader>v", "<C-w>v", opts)
vim.api.nvim_set_keymap("n", "<leader>s", "<C-w>s", opts)
-- Tmux-like previous window switch.
vim.api.nvim_set_keymap("n", "<leader>;", "<Cmd>wincmd p<CR>", opts)
-- Resize windows.
vim.api.nvim_set_keymap("n", "<S-Up>", "<Cmd>resize +5<CR>", opts)
vim.api.nvim_set_keymap("n", "<S-Down>", "<Cmd>resize -5<CR>", opts)
vim.api.nvim_set_keymap("n", "<S-Right>", "<Cmd>vertical resize +5<CR>", opts)
vim.api.nvim_set_keymap("n", "<S-Left>", "<Cmd>vertical resize -5<CR>", opts)

-- Y works like D and C.
vim.api.nvim_set_keymap("n", "Y", '"*yg_', { noremap = true })

-- Stay centered during word search.
vim.api.nvim_set_keymap("n", "n", "nzzzv", { noremap = true })
vim.api.nvim_set_keymap("n", "N", "Nzzzv", { noremap = true })

-- Don't move during J.
vim.api.nvim_set_keymap("n", "J", "mzJ`z:delmarks z<CR>", opts)

-- Adding more undo break points.
vim.api.nvim_set_keymap("i", ",", ",<C-g>u", { noremap = true })
vim.api.nvim_set_keymap("i", ".", ".<C-g>u", { noremap = true })
vim.api.nvim_set_keymap("i", "!", "!<C-g>u", { noremap = true })
vim.api.nvim_set_keymap("i", "?", "?<C-g>u", { noremap = true })

-- Moving text.
vim.api.nvim_set_keymap("v", "K", ":m '<-2<CR>gv=gv", opts)
vim.api.nvim_set_keymap("v", "J", ":m '>+1<CR>gv=gv", opts)
vim.api.nvim_set_keymap("i", "<C-k>", "<Esc>:m .-2<CR>==a", opts)
vim.api.nvim_set_keymap("i", "<C-j>", "<Esc>:m .+1<CR>==a", opts)
vim.api.nvim_set_keymap("n", "<leader>k", ":m .-2<CR>==", opts)
vim.api.nvim_set_keymap("n", "<leader>j", ":m .+1<CR>==", opts)
-- Moving text with arrows.
vim.api.nvim_set_keymap("v", "<C-Up>", ":m '<-2<CR>gv=gv", opts)
vim.api.nvim_set_keymap("v", "<C-Down>", ":m '>+1<CR>gv=gv", opts)
vim.api.nvim_set_keymap("i", "<C-Up>", "<Esc>:m .-2<CR>==a", opts)
vim.api.nvim_set_keymap("i", "<C-Down>", "<Esc>:m .+1<CR>==a", opts)
vim.api.nvim_set_keymap("n", "<C-Up>", ":m .-2<CR>==", opts)
vim.api.nvim_set_keymap("n", "<C-Down>", ":m .+1<CR>==", opts)

-- Replace a word then press '.' to change next occurence.
vim.api.nvim_set_keymap("n", "cn", '*``"_cgn', { noremap = true })
vim.api.nvim_set_keymap("n", "cN", '*``"_cgN', { noremap = true })

-- Yank to global clipboard.
vim.api.nvim_set_keymap("n", "y", '"*y', { noremap = true })
vim.api.nvim_set_keymap("v", "y", '"*y', { noremap = true })

-- Paste from global clipboard and highlight.
vim.api.nvim_set_keymap("n", "<leader>p", '"*p`[v`]', { noremap = true })

-- Highlight after indenting.
vim.api.nvim_set_keymap("v", ">", ">gv", { noremap = true })
vim.api.nvim_set_keymap("v", "<", "<gv", { noremap = true })

-- c, d and x are now delete without yanking.
vim.api.nvim_set_keymap("n", "x", '"_x', { noremap = true })
vim.api.nvim_set_keymap("n", "d", '"_d', { noremap = true })
vim.api.nvim_set_keymap("n", "D", '"_D', { noremap = true })
vim.api.nvim_set_keymap("v", "d", '"_d', { noremap = true })
vim.api.nvim_set_keymap("n", "c", '"_c', { noremap = true })
vim.api.nvim_set_keymap("n", "C", '"_C', { noremap = true })
vim.api.nvim_set_keymap("v", "c", '"_c', { noremap = true })

-- Cut is now leader d.
vim.api.nvim_set_keymap("n", "<leader>d", '"*d', { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>D", '"*d', { noremap = true })
vim.api.nvim_set_keymap("v", "<leader>d", '"*ygv"_d', { noremap = true })
-- vim.api.nvim_set_keymap("v", "<leader>d", '"*d', { noremap = true })

-- Delete start of word for command line with ctrl-backspace.
vim.api.nvim_set_keymap("c", "<C-H>", "<C-w>", { noremap = true })

-- Remap arrow keys to ignore completion window.
vim.api.nvim_set_keymap("i", "<Up>", '<Esc>:silent exec "normal! " .v:count1 . "k"<CR>a', opts)
vim.api.nvim_set_keymap("i", "<Down>", '<Esc>:silent exec "normal! " . v:count1 . "j"<CR>a', opts)
