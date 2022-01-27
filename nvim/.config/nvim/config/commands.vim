command! Code :call OpenInCode()

function! OpenInCode()

    " get name of current buffer
    let l:file = bufname()
    let l:fullpath = fnamemodify(l:file, ":p")

    echom "Opening '" . l:fullpath . "' in vscode..."

    " open file in vscode at current cursor position
    let l:cursorpos = getpos('.')
    silent execute("!code --goto " . l:fullpath . ":" . l:cursorpos[1] . ":" . l:cursorpos[2])

    " open file in current instance of vscode
    " silent execute("!code -r " . l:fullpath)

endfunction
