vim.api.nvim_set_keymap("n", "<leader>cc", "<Plug>kommentary_line_default", {})
vim.api.nvim_set_keymap("n", "<leader>c", "<Plug>kommentary_motion_default", {})
vim.api.nvim_set_keymap("x", "<leader>c", "<Plug>kommentary_visual_default<C-c>", {})

require('kommentary.config').configure_language("default", {
    prefer_single_line_comments = true,
    use_consistent_indentation = true,
    ignore_whitespace = true,
})
require('kommentary.config').configure_language("lua", {
    single_line_comment_string = "--",
})
require('kommentary.config').configure_language("vim", {
    single_line_comment_string = "\"",
})
require('kommentary.config').configure_language("cpp", {
    single_line_comment_string = "//",
})
require('kommentary.config').configure_language("python", {
    single_line_comment_string = "#"
})
