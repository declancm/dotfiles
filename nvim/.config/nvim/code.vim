command! Code :call OpenInCode()

function! OpenInCode()

    let l:file = bufname(0)
    let l:fullpath = fnamemodify(l:file, ":p")

    " convert to list for writing to file
    " let l:fullpath = str2list(l:fullpath)

    " write the name of the file into the files.txt
    " call writefile(l:fullpath, '$HOME/.config/nvim/files.txt')

    silent execute("!code -r " . l:fullpath)

endfunction
