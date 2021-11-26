require('kommentary.config').configure_language("default", {
    prefer_single_line_comments = true,
})

require('kommentary.config').configure_language("lua", {
    single_line_comment_string = "--",
})

require('kommentary.config').configure_language("vim", {
    single_line_comment_string = "\"",
})

vim.api.nvim_set_keymap("n", "gcc", "<Plug>kommentary_line_default", {})
vim.api.nvim_set_keymap("n", "gc", "<Plug>kommentary_motion_default", {})
vim.api.nvim_set_keymap("v", "gc", "<Plug>kommentary_visual_default<C-c>", {})
