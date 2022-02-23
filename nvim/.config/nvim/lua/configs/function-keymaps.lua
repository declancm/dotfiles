local opts = { noremap = true, silent = true }

-- Open notes (notes.txt) from anywhere and return. Automatically git pull when
-- opening and then git commit and push when closing.
vim.api.nvim_set_keymap('n', '<leader>n', '<Cmd>call NotesToggle()<CR>', opts)

vim.cmd [[
let $NOTES_FULL_PATH = expand("~/notes/notes.txt")
let $NOTES_DIR = expand("~/notes")

function! NotesToggle()
    let l:currentDir = getcwd(0)
    if l:currentDir ==# $NOTES_DIR
        if &modified || exists("b:notes_modified") && b:notes_modified == 1
            " Commit and push when file has been modified.
            silent execute("w")
            echom "Your changes to " . bufname("%") . " are being committed."
            " Asynchronous git commit.
            lua AsyncGitCommit(os.getenv("NOTES_DIR"))
            " silent execute("!source ~/git-scripts/commit-silent.sh")
            " if v:shell_error != 0 | echom "Error: The git commit failed." | endif
            silent execute("e# | lcd -")
        else
            " Only return when nothing has been modified.
            silent execute("w | e# | lcd -")
        endif
        set nolbr nobri nowrap cc=80
    else
        silent execute("lcd $NOTES_DIR")
        " Asynchronous git pull.
        lua AsyncGitPull(os.getenv("NOTES_DIR"))
        " silent execute("!git pull -q $(git remote) $(git rev-parse --abbrev-ref HEAD)")
        " if v:shell_error != 0 | echom "Error: The git pull failed." | endif
        silent execute("edit $NOTES_FULL_PATH")
        set wrap lbr bri cc=0
        let &showbreak=repeat(' ',6)
    endif
endfunction

" Check if modified every time the buffer is saved.
autocmd BufEnter $NOTES_FULL_PATH let b:notes_modified = 0
autocmd BufWritePre $NOTES_FULL_PATH if &modified | let b:notes_modified = 1 | endif
]]

-- Delete start of word (works with wordmotion).
vim.api.nvim_set_keymap('i', '<C-H>', '<Cmd>call DeleteStartWord("b")<CR>', opts)
vim.api.nvim_set_keymap('i', '<M-BS>', '<Cmd>call DeleteStartWord("B")<CR>', opts)

vim.cmd [[
function! DeleteStartWord(backKey)
    let l:cursorPos = getcurpos()
    if l:cursorPos[2] < 3
        call feedkeys("\<BS>")
    else
        normal b
        let l:cursorNew = getcurpos()
        silent execute("call cursor(l:cursorPos[1], l:cursorPos[2])")
        if l:cursorPos[1] - l:cursorNew[1] != 0
            normal d0i
        else
            call feedkeys("\<Space>\<Esc>v" . a:backKey . "c")
        endif
    endif
endfunction
]]

-- Delete end of word (works with wordmotion).
vim.api.nvim_set_keymap('i', '<C-Del>', '<Cmd>call DeleteEndWord("e")<CR>', opts)
vim.api.nvim_set_keymap('i', '<M-Del>', '<Cmd>call DeleteEndWord("E")<CR>', opts)

vim.cmd [[
function! DeleteEndWord(endKey)
    call feedkeys("\<Space>\<Esc>v" . a:endKey . "c")
endfunction
]]

-- Paste from global clipboard and auto format indent.
vim.api.nvim_set_keymap('n', 'p', '<Cmd>call GlobalPaste("p")<CR>', opts)
vim.api.nvim_set_keymap('n', 'P', '<Cmd>call GlobalPaste("P")<CR>', opts)
vim.api.nvim_set_keymap('n', 'gp', '<Cmd>call GlobalPaste("gp")<CR>', opts)
vim.api.nvim_set_keymap('n', 'gP', '<Cmd>call GlobalPaste("gP")<CR>', opts)
vim.api.nvim_set_keymap('n', '<M-p>', '<Cmd>call GlobalPaste("p")<CR>a', opts)
vim.api.nvim_set_keymap('n', '<M-P>', '<Cmd>call GlobalPaste("P")<CR>a', opts)
vim.api.nvim_set_keymap('i', '<M-p>', '<Esc><Cmd>call GlobalPaste("p")<CR>a', opts)
vim.api.nvim_set_keymap('i', '<M-P>', '<Esc><Cmd>call GlobalPaste("P")<CR>a', opts)
vim.api.nvim_set_keymap('n', 'op', 'o<Esc><Cmd>call GlobalPaste("p")<CR>', opts)

vim.cmd [[
function! GlobalPaste(pasteMode)
    if getreg('*') != ""
        let l:pasteType = getregtype('*')
        if l:pasteType ==# 'V'
            silent execute("normal! \"*" . a:pasteMode . "`[v`]=`]$")
        else
            silent execute("normal! \"*" . a:pasteMode)
        endif
    endif
endfunction
]]

-- Append yank.
vim.api.nvim_set_keymap('v', '<leader>y', '<Cmd>call AppendYank("y")<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>Y', '<Cmd>call AppendYank("yg_")<CR>', opts)

vim.cmd [[
function! AppendYank(yankMode)
    silent execute("normal! \"0" . a:yankMode)
    call setreg('*', getreg('*') . getreg('0'), getregtype('*'))
endfunction
]]

-- Window movement.
vim.api.nvim_set_keymap('n', '<leader>k', '<Cmd>call WindowMovement("k")<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>j', '<Cmd>call WindowMovement("j")<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>h', '<Cmd>call WindowMovement("h")<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>l', '<Cmd>call WindowMovement("l")<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader><Up>', '<Cmd>call WindowMovement("k")<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader><Down>', '<Cmd>call WindowMovement("j")<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader><Left>', '<Cmd>call WindowMovement("h")<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader><Right>', '<Cmd>call WindowMovement("l")<CR>', opts)

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
vim.api.nvim_set_keymap('n', '<leader>bd', '<Cmd>call BufferDelete()<CR>', opts)

vim.cmd [[
function! BufferDelete()
    let l:cursorPos = getcurpos()
    silent execute("wa | %bdelete | normal! \<C-^>")
    silent execute("call cursor(l:cursorPos[1], l:cursorPos[2])")
endfunction
]]

-- Maximize the current window.
vim.api.nvim_set_keymap('n', '<leader>z', '<Cmd>call MaximizeWindow()<CR>', opts)
vim.api.nvim_set_keymap('x', '<leader>z', '<Cmd>call MaximizeWindow()<CR>', opts)

vim.cmd [[
function! MaximizeWindow()
    if (!exists("b:maxWindowStatus") || b:maxWindowStatus == 0)
        let b:winPositions = winrestcmd()
        silent exec "resize"
        silent exec "vertical resize"
        let b:winPositionsNew = winrestcmd()
        if b:winPositions == b:winPositionsNew
            let b:maxWindowStatus = 0
            return
        endif
        let b:maxWindowStatus = 1
    elseif (exists("b:winPositions"))
        silent exec b:winPositions
        let b:maxWindowStatus = 0
    else
        let b:maxWindowStatus = 0
    endif
endfunction
]]
