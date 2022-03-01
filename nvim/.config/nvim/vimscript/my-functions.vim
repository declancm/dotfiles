" This is a collection of my neovim functions written in vimscript before they\
" had been converted to lua, which are vim friendly.

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
    else
        let b:maxWinStatus = 0
        silent exec b:winPositions
    endif
endfunction

function! ToggleTerminal()
    if &buftype == 'terminal'
        let g:term_bufnr = bufnr()
        call MaximizeWindow()
        if !exists("g:term_prev") || bufname(g:term_prev) == ''
            silent exec "call feedkeys(\"\\<C-\\>\\<C-N>\\<C-^>\", 'n')"
        else
            silent exec "keepalt buffer " . g:term_prev
        end
    else
        let g:term_prev = bufnr()
        if !exists("g:term_bufnr") || bufname(g:term_bufnr) == ''
            silent exec "keepalt term"
        else
            silent exec "keepalt buffer " . g:term_bufnr
        endif
        setlocal nornu nonu scl=no
        call MaximizeWindow()
    endif
endfunction
