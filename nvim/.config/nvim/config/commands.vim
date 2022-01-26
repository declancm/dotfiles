command! Code :call OpenInCode()

function! OpenInCode()
    let l:file = bufname()
    let l:fullpath = fnamemodify(l:file, ":p")
    echom "Opening '" . l:fullpath . "' in vscode..."
    silent execute("!code -r " . l:fullpath)
endfunction
