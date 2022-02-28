local opts = { noremap = true, silent = true }
local set_keymap = vim.api.nvim_set_keymap

-- Delete start of word (works with wordmotion).
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

-- Delete end of word (works with wordmotion).
set_keymap('i', '<C-Del>', '<Cmd>call DeleteEndWord("e")<CR>', opts)
set_keymap('i', '<M-Del>', '<Cmd>call DeleteEndWord("E")<CR>', opts)

vim.cmd [[
function! DeleteEndWord(endKey)
    call feedkeys("\<Space>\<Esc>v" . a:endKey . "c")
endfunction
]]

-- Paste from global clipboard and auto format indent.
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

-- Append yank.
set_keymap('v', '<leader>y', '<Cmd>call AppendYank("y")<CR>', opts)
set_keymap('n', '<leader>Y', '<Cmd>call AppendYank("yg_")<CR>', opts)

vim.cmd [[
function! AppendYank(yankMode)
    silent exec "normal! \"0" . a:yankMode
    call setreg('*', getreg('*') . getreg('0'), getregtype('*'))
endfunction
]]

-- Window movement.
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

-- Close other buffers.
set_keymap('n', '<leader>bd', '<Cmd>call BufferDelete()<CR>', opts)

vim.cmd [[
function! BufferDelete()
    let l:cursorPos = getcurpos()
    silent exec "wa | %bdelete | normal! \<C-^>"
    silent exec "call cursor(l:cursorPos[1], l:cursorPos[2])"
endfunction
]]
