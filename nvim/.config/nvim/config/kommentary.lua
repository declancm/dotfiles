-- vim.api.nvim_set_keymap("n", "<BS>cc", "<Plug>kommentary_line_default", {})
-- vim.api.nvim_set_keymap("n", "<BS>c", "<Plug>kommentary_motion_default", {})
-- vim.api.nvim_set_keymap("x", "<BS>c", "<Plug>kommentary_visual_default<C-c>", {})

-- set <C-/>
vim.api.nvim_set_keymap("i", "<C-_>", "<Esc><Plug>kommentary_line_default", {})
vim.api.nvim_set_keymap("n", "<C-_>", "<Plug>kommentary_line_default", {})
vim.api.nvim_set_keymap("x", "<C-_>", "<Plug>kommentary_visual_default<Esc>", {})

require("kommentary.config").configure_language("default", {
    prefer_single_line_comments = true,
    use_consistent_indentation = true,
    ignore_whitespace = true,
})
require("kommentary.config").configure_language("lua", {
    single_line_comment_string = "--",
})
require("kommentary.config").configure_language("vim", {
    single_line_comment_string = '"',
})
require("kommentary.config").configure_language("cpp", {
    single_line_comment_string = "//",
})
require("kommentary.config").configure_language("python", {
    single_line_comment_string = "#",
})
