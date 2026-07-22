vim.g.mapleader = " "

vim.o.cursorline = true
vim.o.number = true
vim.o.relativenumber = true
vim.o.swapfile = false
vim.o.undofile = true

vim.pack.add({
	"https://github.com/junegunn/fzf", -- fzf.vim dependency
	"https://github.com/junegunn/fzf.vim",
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/nvim-mini/mini.bufremove",
	"https://github.com/nvim-mini/mini.diff",
	-- TODO: plugin has been archived so replace once upstreamed
	"https://github.com/nvim-treesitter/nvim-treesitter",
	"https://github.com/tpope/vim-sleuth", -- smart indents
})

require("mini.bufremove").setup()
require("mini.diff").setup()

require("nvim-treesitter").install({
	"c",
	"cpp",
	"python",
	"starlark",
	"zig",
})

vim.api.nvim_create_autocmd("FileType", {
	callback = function()
		pcall(vim.treesitter.start)
	end,
})

vim.lsp.enable({
	"stylua", -- lua
	"zls", -- zig
})

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(ev)
		vim.api.nvim_create_autocmd("BufWritePre", {
			buffer = ev.buf,
			callback = function()
				pcall(vim.lsp.buf.format)
			end,
		})
	end,
})

vim.keymap.set("n", "ZB", MiniBufremove.delete)

vim.api.nvim_create_user_command(
	"Zoxide",
	"call fzf#run(fzf#wrap({ 'source': 'zoxide query --list <args>', 'sink': 'e' }))",
	{ nargs = "*" }
)

vim.keymap.set("n", "<leader>b", "<cmd>Buffers<cr>")
vim.keymap.set("n", "<leader>f", "<cmd>GFiles<cr>")
vim.keymap.set("n", "<leader>F", "<cmd>Files<cr>")
vim.keymap.set("n", "<leader>g", "<cmd>RG<cr>")
vim.keymap.set("n", "<leader>h", "<cmd>Helptags<cr>")
vim.keymap.set("n", "<leader>z", "<cmd>Zoxide<cr>")

vim.api.nvim_create_autocmd("VimResized", { command = "wincmd =" })

vim.keymap.set("x", "<d-c>", [["+y]])

vim.cmd.colorscheme("retrobox")
