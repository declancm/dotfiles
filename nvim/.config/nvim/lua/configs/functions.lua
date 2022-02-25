local opts = { noremap = true, silent = true }
local set_keymap = vim.api.nvim_set_keymap

-- Open notes (notes.txt) from anywhere and return. Automatically git pull when
-- opening and then git commit and push when closing.
set_keymap('n', '<leader>n', '<Cmd>call NotesToggle()<CR>', opts)

vim.cmd [[
let $NOTES_FULL_PATH = expand("~/notes/notes.txt")
let $NOTES_DIR = expand("~/notes")

function! NotesToggle()
    let l:currentDir = getcwd(0)
    if l:currentDir ==# $NOTES_DIR
        if &modified || exists("b:notes_modified") && b:notes_modified == 1
            " Commit and push when file has been modified.
            silent exec "w"
            echom "Your changes to " . bufname("%") . " are being committed."
            " Asynchronous git commit.
            lua require("git-scripts").async_commit(os.getenv("NOTES_DIR"))
            silent exec "e# | lcd -"
        else
            " Only return when nothing has been modified.
            silent exec "w | e# | lcd -"
        endif
        set nolbr nobri nowrap cc=80
    else
        silent exec "lcd $NOTES_DIR"
        " Asynchronous git pull.
        lua require("git-scripts").async_pull(os.getenv("NOTES_DIR"))
        silent exec "edit $NOTES_FULL_PATH"
        set wrap lbr bri cc=0
        let &showbreak=repeat(' ',6)
    endif
endfunction

" Check if modified every time the buffer is saved.
autocmd BufEnter $NOTES_FULL_PATH let b:notes_modified = 0
autocmd BufWritePre $NOTES_FULL_PATH if &modified | let b:notes_modified = 1 | endif
]]

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

-- Maximize the current window.
set_keymap('n', '<leader>z', '<Cmd>call MaximizeWindow()<CR>', opts)
set_keymap('x', '<leader>z', '<Cmd>call MaximizeWindow()<CR>', opts)

vim.cmd [[
function! MaximizeWindow()
    if (!exists("b:maxWinStatus") || b:maxWinStatus == 0)
        let b:winPositions = winrestcmd()
        silent exec "resize | vertical resize"
        let b:winPositionsNew = winrestcmd()
        if b:winPositions == b:winPositionsNew
            let b:maxWinStatus = 0
            return
        endif
        let b:maxWinStatus = 1
    elseif (exists("b:winPositions"))
        silent exec b:winPositions
        let b:maxWinStatus = 0
    else
        let b:maxWinStatus = 0
    endif
endfunction
]]
