-- MAXIMIZE_WINDOW:
set_keymap('n', '<leader>z', '<Cmd>lua MaximizeWindow()<CR>', opts)
set_keymap('x', '<leader>z', '<Cmd>lua MaximizeWindow()<CR>', opts)

function MaximizeWindow()
  if vim.b.maxWinStatus == nil or vim.b.maxWinStatus == 0 then
    vim.b.winPositions = vim.fn.winrestcmd()
    vim.cmd 'resize | vertical resize'
    vim.b.winPositionsNew = vim.fn.winrestcmd()
    if vim.b.winPositions == vim.b.winPositionsNew then
      vim.b.maxWinStatus = 0
      return
    end
    vim.b.maxWinStatus = 1
  else
    vim.b.maxWinStatus = 0
    vim.cmd 'silent exec b:winPositions'
  end
end

-- NOTES:
set_keymap('n', '<leader>n', '<Cmd>call NotesToggle()<CR>', opts)

vim.cmd [[
let g:notes_dir = expand("~/notes")
let g:notes_full_path = expand("~/notes/notes.txt")

function! NotesToggle()
    " Check if current directory is the notes directory.
    let l:currentDir = getcwd(0)
    if l:currentDir ==# g:notes_dir
        if exists("b:notes_modified") && b:notes_modified == 1
            " Commit and push when file has been modified.
            silent exec "w"
            echom "Your changes to " . bufname("%") . " are being committed."
            lua require("git-scripts").async_commit('',vim.g.notes_dir)
            silent exec "e# | lcd -"
        else
            " Only return when nothing has been modified.
            silent exec "w | e# | lcd -"
        endif
        set nolbr nobri nowrap cc=80
    else
        silent exec "lcd " . g:notes_dir
        lua require("git-scripts").async_pull(vim.g.notes_dir)
        silent exec "edit " . g:notes_full_path
        set wrap lbr bri cc=0
        let &showbreak=repeat(' ',6)
    endif
endfunction

" Check if modified every time the buffer is saved.
exec "autocmd BufEnter " . g:notes_full_path . " let b:notes_modified = 0"
exec "autocmd BufWritePre " . g:notes_full_path . " if &modified | let b:notes_modified = 1 | endif"
]]

-- CHADTREE:
local chadtree_settings = {
  ['theme.text_colour_set'] = 'solarized_light',
  ['options.session'] = false,
  ['options.close_on_open'] = true,
}
vim.api.nvim_set_var('chadtree_settings', chadtree_settings)

local opts = { noremap = true, silent = true }
local set_keymap = vim.api.nvim_set_keymap

set_keymap('n', '<leader>e', '<Cmd>CHADopen<CR>', opts)
set_keymap('n', '<leader>te', '<Cmd>CHADopen<CR> --version-ctl<CR>', opts)
set_keymap('n', '<leader>qf', '<Cmd>call setqflist([])<CR>', opts)
