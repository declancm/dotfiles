local opts = { noremap = true, silent = true }
local set_keymap = vim.api.nvim_set_keymap

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

-- TERMINAL:
set_keymap('t', '<C-^>', '<C-\\><C-N><C-^>', opts)
set_keymap('t', '<C-O>', '<C-\\><C-N><C-O>', opts)
set_keymap('t', '<F3>', '<C-\\><C-N>', opts)
set_keymap('n', '<C-\\>', '<Cmd>lua ToggleTerminal()<CR>', opts)
set_keymap('t', '<C-\\>', '<Cmd>lua ToggleTerminal()<CR>', opts)

vim.cmd 'autocmd TermOpen * startinsert'
vim.cmd "autocmd BufEnter * if &buftype == 'terminal' | startinsert | endif"

function ToggleTerminal()
  if vim.bo.buftype == 'terminal' then
    vim.g.term_bufnr = vim.fn.bufnr()
    MaximizeWindow()
    if vim.g.term_prev == nil or vim.fn.bufname(vim.g.term_prev) == '' then
      vim.cmd 'call feedkeys("\\<C-\\>\\<C-N>\\<C-^>", "n")'
    else
      vim.cmd('keepalt buffer ' .. vim.g.term_prev)
    end
  else
    vim.g.term_prev = vim.fn.bufnr()
    if vim.g.term_bufnr == nil or vim.fn.bufname(vim.g.term_bufnr) == '' then
      vim.cmd 'keepalt term'
    else
      vim.cmd('keepalt buffer ' .. vim.g.term_bufnr)
    end
    vim.opt_local.relativenumber = false
    vim.opt_local.number = false
    vim.opt_local.signcolumn = 'no'
    MaximizeWindow()
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

-- CTRL-BS:
set_keymap('i', '<C-H>', '<Cmd>call DeleteStartWord("b")<CR>', opts)
set_keymap('i', '<M-BS>', '<Cmd>call DeleteStartWord("B")<CR>', opts)

vim.cmd [[
function! DeleteStartWord(backKey)
    let l:cursorPos = getcurpos()
    if l:cursorPos[2] < 3
        call feedkeys("\<BS>")
    else
        normal b
        let l:cursorNew = getcurpos()
        silent exec "call cursor(l:cursorPos[1], l:cursorPos[2])"
        if l:cursorPos[1] - l:cursorNew[1] != 0
            normal d0i
        else
            call feedkeys("\<Space>\<Esc>v" . a:backKey . "c")
        endif
    endif
endfunction
]]

-- CTRL-DEL:
set_keymap('i', '<C-Del>', '<Cmd>call DeleteEndWord("e")<CR>', opts)
set_keymap('i', '<M-Del>', '<Cmd>call DeleteEndWord("E")<CR>', opts)

vim.cmd [[
function! DeleteEndWord(endKey)
    call feedkeys("\<Space>\<Esc>v" . a:endKey . "c")
endfunction
]]

-- BETTER_PASTE:
set_keymap('n', 'p', '<Cmd>call GlobalPaste("p")<CR>', opts)
set_keymap('n', 'P', '<Cmd>call GlobalPaste("P")<CR>', opts)
set_keymap('n', 'gp', '<Cmd>call GlobalPaste("gp")<CR>', opts)
set_keymap('n', 'gP', '<Cmd>call GlobalPaste("gP")<CR>', opts)
set_keymap('n', '<M-p>', '<Cmd>call GlobalPaste("p")<CR>a', opts)
set_keymap('n', '<M-P>', '<Cmd>call GlobalPaste("P")<CR>a', opts)
set_keymap('i', '<M-p>', '<Esc><Cmd>call GlobalPaste("p")<CR>a', opts)
set_keymap('i', '<M-P>', '<Esc><Cmd>call GlobalPaste("P")<CR>a', opts)
set_keymap('n', 'op', 'o<Esc><Cmd>call GlobalPaste("p")<CR>', opts)

vim.cmd [[
function! GlobalPaste(pasteMode)
    if getreg('*') != ""
        let l:pasteType = getregtype('*')
        if l:pasteType ==# 'V'
            silent exec "normal! \"*" . a:pasteMode . "`[v`]=`]$"
        else
            silent exec "normal! \"*" . a:pasteMode
        endif
    endif
endfunction
]]

-- APPEND_YANK:
set_keymap('v', '<leader>y', '<Cmd>call AppendYank("y")<CR>', opts)
set_keymap('n', '<leader>Y', '<Cmd>call AppendYank("yg_")<CR>', opts)

vim.cmd [[
function! AppendYank(yankMode)
    silent exec "normal! \"0" . a:yankMode
    call setreg('*', getreg('*') . getreg('0'), getregtype('*'))
endfunction
]]

-- WINDOW_MOVEMENT:
set_keymap('n', '<leader>k', '<Cmd>call WindowMovement("k")<CR>', opts)
set_keymap('n', '<leader>j', '<Cmd>call WindowMovement("j")<CR>', opts)
set_keymap('n', '<leader>h', '<Cmd>call WindowMovement("h")<CR>', opts)
set_keymap('n', '<leader>l', '<Cmd>call WindowMovement("l")<CR>', opts)
set_keymap('n', '<leader><Up>', '<Cmd>call WindowMovement("k")<CR>', opts)
set_keymap('n', '<leader><Down>', '<Cmd>call WindowMovement("j")<CR>', opts)
set_keymap('n', '<leader><Left>', '<Cmd>call WindowMovement("h")<CR>', opts)
set_keymap('n', '<leader><Right>', '<Cmd>call WindowMovement("l")<CR>', opts)

vim.cmd [[
function! WindowMovement(key)
    let l:currentWin = winnr()
    silent exec "wincmd " . a:key
    if (l:currentWin == winnr())
        if (match(a:key,'[jk]'))
            wincmd v
        else
            wincmd s
        endif
        silent exec "wincmd ".a:key
    endif
endfunction
]]

-- CLOSE_BUFFERS:
set_keymap('n', '<leader>bd', '<Cmd>call BufferDelete()<CR>', opts)

vim.cmd [[
function! BufferDelete()
    let l:cursorPos = getcurpos()
    silent exec "wa | %bdelete | normal! \<C-^>"
    silent exec "call cursor(l:cursorPos[1], l:cursorPos[2])"
endfunction
]]
