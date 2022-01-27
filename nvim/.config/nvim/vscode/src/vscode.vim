command! VSCode :call GetBuffers()

function! GetBuffers()

    " get name of current buffer
    let l:currentFile = bufname()
    let l:currentFullPath = fnamemodify(l:currentFile, ":p")

    echom "Opening your active buffers in vscode..."

    let l:activeBuffers = execute("buffers(a)")
    let l:lenActiveBuffers = len(l:activeBuffers)
    " echo "length of activeBuffers is: " l:lenActiveBuffers
    let l:i = 0
    let l:number = 0
    while i < l:lenActiveBuffers
        if "\n" == l:activeBuffers[i]
            let l:number += 1
            let l:bufnr = str2nr(l:activeBuffers[i+1:i+4])
            " echo l:bufnr
            let l:bufname = bufname(l:bufnr)
            let l:fullpath = fnamemodify(l:bufname, ":p")
            " if fullpath = name of current file, open with current cursor pos
            " else,
            " silent execute("!code -r " . l:fullpath)
        endif
        " let l:remainder = l:count % 2
        " if l:remainder == 0
        "     " copy stuff inside the " and then save to variable when count changes
        " endif
        let l:i += 1
    endwhile

    " open file in vscode at current cursor position
    " needs to be last for the cursor to work correctly? Test this
    let l:cursorpos = getpos('.')
    silent execute("!code --goto " . l:currentFullPath . ":" . l:cursorpos[1] . ":" . l:cursorpos[2])

endfunction
