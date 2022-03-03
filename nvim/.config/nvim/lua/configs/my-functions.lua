local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

-- MAXIMIZE_WINDOW:

keymap('n', '<Leader>z', '<Cmd>lua MaximizeWindow()<CR>', opts)
keymap('x', '<Leader>z', '<Cmd>lua MaximizeWindow()<CR>', opts)

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

-- NATIVE_TERMINAL:

keymap('t', '<C-N>', '<C-\\><C-N>', opts)
keymap('n', '<C-\\>', '<Cmd>lua ToggleTerminal()<CR>', opts)
keymap('t', '<C-\\>', '<Cmd>lua ToggleTerminal()<CR>', opts)

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
      vim.cmd 'keepalt terminal'
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

keymap('n', '<Leader>n', '<Cmd>call NotesToggle()<CR>', opts)

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
        " set nolbr nobri nowrap cc=80
        set fo-=t
    else
        silent exec "lcd " . g:notes_dir
        lua require("git-scripts").async_pull(vim.g.notes_dir)
        silent exec "edit " . g:notes_full_path
        " set wrap lbr bri cc=0
        set fo+=t
        let &showbreak=repeat(' ',6)
    endif
endfunction

" Check if modified every time the buffer is saved.
exec "autocmd BufEnter " . g:notes_full_path . " let b:notes_modified = 0"
exec "autocmd BufWritePre " . g:notes_full_path . " if &modified | let b:notes_modified = 1 | endif"
]]

-- SOURCE_CONFIG:

keymap('n', '<Leader>sc', '<Cmd>lua SourceConfig()<CR>', opts)

function SourceConfig()
  vim.cmd "silent exec 'wa | source $MYVIMRC | PackerCompile'"
  print 'Your config file has been sourced.'
end

-- CTRL-BS: (works with wordmotion)

keymap('i', '<C-H>', '<Cmd>call DeleteStartWord("b")<CR>', opts)
keymap('i', '<M-BS>', '<Cmd>call DeleteStartWord("B")<CR>', opts)

vim.cmd [[
function! DeleteStartWord(backKey)
    let l:cursorPos = getcurpos()
    if l:cursorPos[2] < 3
        call feedkeys("\<BS>", 'n')
    else
        normal! b
        let l:cursorNew = getcurpos()
        silent exec "call cursor(l:cursorPos[1], l:cursorPos[2])"
        if l:cursorPos[1] - l:cursorNew[1] != 0
            normal! d0i
        else
            call feedkeys("\<Space>\<Esc>v" . a:backKey . "c", 'n')
        endif
    endif
endfunction
]]

-- CTRL-DEL: (works with wordmotion)

keymap('i', '<C-Del>', '<Cmd>call DeleteEndWord("e")<CR>', opts)
keymap('i', '<M-Del>', '<Cmd>call DeleteEndWord("E")<CR>', opts)

vim.cmd [[
function! DeleteEndWord(endKey)
    call feedkeys("\<Space>\<Esc>v" . a:endKey . "c", 'n')
endfunction
]]

-- IMPROVED_PASTE:

keymap('n', 'p', '<Cmd>call GlobalPaste("p")<CR>', opts)
keymap('n', 'P', '<Cmd>call GlobalPaste("P")<CR>', opts)
keymap('n', 'gp', '<Cmd>call GlobalPaste("gp")<CR>', opts)
keymap('n', 'gP', '<Cmd>call GlobalPaste("gP")<CR>', opts)
keymap('n', '<M-p>', '<Cmd>call GlobalPaste("p")<CR>a', opts)
keymap('n', '<M-P>', '<Cmd>call GlobalPaste("P")<CR>a', opts)
keymap('i', '<M-p>', '<Esc><Cmd>call GlobalPaste("p")<CR>a', opts)
keymap('i', '<M-P>', '<Esc><Cmd>call GlobalPaste("P")<CR>a', opts)
keymap('n', 'op', 'o<Esc><Cmd>call GlobalPaste("p")<CR>', opts)

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

keymap('v', '<Leader>y', '<Cmd>call AppendYank("y")<CR>', opts)
keymap('n', '<Leader>Y', '<Cmd>call AppendYank("yg_")<CR>', opts)

vim.cmd [[
function! AppendYank(yankMode)
    silent exec "normal! \"0" . a:yankMode
    call setreg('*', getreg('*') . getreg('0'), getregtype('*'))
endfunction
]]

-- WINDOW_MOVEMENT:

keymap('n', '<Leader>k', '<Cmd>call WindowMovement("k")<CR>', opts)
keymap('n', '<Leader>j', '<Cmd>call WindowMovement("j")<CR>', opts)
keymap('n', '<Leader>h', '<Cmd>call WindowMovement("h")<CR>', opts)
keymap('n', '<Leader>l', '<Cmd>call WindowMovement("l")<CR>', opts)
keymap('n', '<Leader><Up>', '<Cmd>call WindowMovement("k")<CR>', opts)
keymap('n', '<Leader><Down>', '<Cmd>call WindowMovement("j")<CR>', opts)
keymap('n', '<Leader><Left>', '<Cmd>call WindowMovement("h")<CR>', opts)
keymap('n', '<Leader><Right>', '<Cmd>call WindowMovement("l")<CR>', opts)

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

-- PREVIOUS_WINDOW: (nvim and tmux)

keymap('n', '<Leader>;', '<Cmd>lua PreviousWindow()<CR>', opts)

function PreviousWindow()
  local win1 = vim.fn.winnr()
  vim.cmd 'wincmd p'
  local win2 = vim.fn.winnr()
  if win1 == win2 then
    -- If no previous nvim window, switch to previous tmux pane.
    os.execute 'tmux select-pane -l'
  end
end

-- CLOSE_OTHER_WINDOW:

keymap('n', 'ql', "<Cmd>lua CloseOtherWindow('l')<CR>", opts)
keymap('n', 'qh', "<Cmd>lua CloseOtherWindow('h')<CR>", opts)
keymap('n', 'qk', "<Cmd>lua CloseOtherWindow('k')<CR>", opts)
keymap('n', 'qj', "<Cmd>lua CloseOtherWindow('j')<CR>", opts)
keymap('n', 'q<Right>', "<Cmd>lua CloseOtherWindow('l')<CR>", opts)
keymap('n', 'q<Left>', "<Cmd>lua CloseOtherWindow('h')<CR>", opts)
keymap('n', 'q<Up>', "<Cmd>lua CloseOtherWindow('k')<CR>", opts)
keymap('n', 'q<Down>', "<Cmd>lua CloseOtherWindow('j')<CR>", opts)

function CloseOtherWindow(direction)
  local win1 = vim.fn.winnr()
  vim.cmd('wincmd ' .. direction)
  local win2 = vim.fn.winnr()
  if win1 == win2 then
    return
  end
  vim.cmd [[exec &modifiable ? 'wq' : 'q']]
end

-- CLEAR_BUFFERS:

keymap('n', '<Leader>bd', '<Cmd>call ClearBuffers()<CR>', opts)

vim.cmd [[
function! ClearBuffers()
    let l:cursorPos = getcurpos()
    silent exec "wa | %bdelete | normal! \<C-^>"
    silent exec "call cursor(l:cursorPos[1], l:cursorPos[2])"
endfunction
]]

-- MATCHES: (get the number of matches for a pattern)
vim.cmd [[
function! GetMatches(pattern)
  let l:cursorPos = getcurpos()
  exec '%s/\<' . a:pattern . '\>//gn'
  call cursor(l:cursorPos[1], l:cursorPos[2])
endfunction

command! -nargs=1 Matches call GetMatches(<q-args>)
]]
