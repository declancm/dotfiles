command! Code :call OpenInCode()

function! OpenInCode()

    let l:file = bufname()
    let l:fullpath = fnamemodify(l:file, ":p")
    echom "Opening '" . l:fullpath . "' in vscode..."

    " open file in vscode
    " silent execute("!code -r " . l:fullpath)

    " open file in vscode at current cursor position
    let l:cursorpos = getpos('.')
    silent execute("!code --goto " . l:fullpath . ":" . l:cursorpos[1] . ":" . l:cursorpos[2])

endfunction
