" open notes (todo.txt) from anywhere and return. Automatically git pull when
" opening and then git commit and push when closing.
nnoremap <silent> <leader>n :call <SID>Notes_toggle()<CR>

function! s:Notes_toggle()
    let l:currentDir = getcwd(0)
    if l:currentDir ==# $HOME . '/notes'
        if &modified
            " commit and push when file has been modified
            silent execute("w")
            execute("!source ~/git-scripts/commit-silent.sh")
            silent execute("e# | lcd -")
        else
            " only return when nothing has been modified
            silent execute("w | e# | lcd -")
        endif
    else
        silent execute("lcd ~/notes")
        execute("!git pull -q $(git remote) $(git rev-parse --abbrev-ref HEAD)")
        silent execute("edit ~/notes/notes.txt")
    endif
endfunction

" delete start of word (works with wordmotion)
imap <silent> <C-H> <Cmd>call <SID>DeleteStartWord("b")<CR>
imap <silent> <M-BS> <Cmd>call <SID>DeleteStartWord("B")<CR>

function! s:DeleteStartWord(backKey)
    let l:cursorpos = getcurpos()
    if l:cursorpos[2] < 3
        call feedkeys("\<BS>")
    else
        normal b
        let l:cursornew = getcurpos()
        silent execute("call cursor(l:cursorpos[1], l:cursorpos[2])")
        if l:cursorpos[1] - l:cursornew[1] != 0
            normal d0i
        else
            call feedkeys("\<Space>\<Esc>v" . a:backKey . "c")
        endif
    endif
endfunction

" delete end of word (works with wordmotion)
imap <silent> <C-Del> <Cmd>call <SID>DeleteEndWord("e")<CR>
imap <silent> <M-Del> <Cmd>call <SID>DeleteEndWord("E")<CR>

function! s:DeleteEndWord(endKey)
    call feedkeys("\<Space>\<Esc>v" . a:endKey . "c")
endfunction

" paste from global clipboard and auto format indent
nnoremap <silent> p <Cmd>call <SID>GlobalPaste("p")<CR>
nnoremap <silent> P <Cmd>call <SID>GlobalPaste("P")<CR>
nnoremap <silent> gp <Cmd>call <SID>GlobalPaste("gp")<CR>
nnoremap <silent> gP <Cmd>call <SID>GlobalPaste("gP")<CR>
nnoremap <silent> <M-p> <Cmd>call <SID>GlobalPaste("p")<CR>a
nnoremap <silent> <M-P> <Cmd>call <SID>GlobalPaste("P")<CR>a
inoremap <silent> <M-p> <Esc><Cmd>call <SID>GlobalPaste("p")<CR>a
inoremap <silent> <M-P> <Esc><Cmd>call <SID>GlobalPaste("P")<CR>a

function! s:GlobalPaste(pasteMode)
    if getreg('*') != ""
        let l:pasteType = getregtype('*')
        if l:pasteType ==# 'V'
            silent execute("normal! \"*" . a:pasteMode . "`[v`]=`]$")
        else
            silent execute("normal! \"*" . a:pasteMode)
        endif
    endif
endfunction

" append yank
vnoremap <leader>y <Cmd>call <SID>AppendYank("y")<CR>
nnoremap <leader>Y <Cmd>call <SID>AppendYank("yg_")<CR>

function! s:AppendYank(yankMode)
    silent execute("normal! \"0" . a:yankMode)
    call setreg('*', getreg('*') . getreg('0'), getregtype('*'))
endfunction

