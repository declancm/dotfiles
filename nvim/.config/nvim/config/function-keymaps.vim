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
imap <silent> <C-H> <Cmd>call <SID>Delete_start()<CR>
imap <silent> <M-BS> <Cmd>call <SID>Delete_START()<CR>

" function! s:Delete_start()
"     let l:cursorpos = getpos('.')
"     if l:cursorpos[2] < 3
"         call feedkeys("\<BS>")
"     else
"         call feedkeys("\<Esc>vbc")
"     endif
" endfunction

function! s:Delete_start()
    let l:cursorstart = getcurpos()
    if l:cursorstart[2] < 3
        call feedkeys("\<BS>")
    else
        normal b
        let l:cursormiddle = getcurpos()
        normal w
        " let l:cursorend = getcurpos()
        silent execute("call cursor(l:cursorstart[1], l:cursorstart[2])")
        if l:cursormiddle[1] - l:cursorstart[1] != 0
            normal d0i
        " elseif l:cursormiddle[2] == 1
        "     normal d0i
        " elseif l:cursorstart[2] - l:cursorend[2] <= 0
        "     normal lcl
        else
            call feedkeys("\<esc>vbc")
            " normal vbc
        endif
    endif
endfunction

function! s:Delete_START()
    let l:cursorpos = getpos('.')
    if l:cursorpos[2] < 3
        call feedkeys("\<BS>")
    else
        call feedkeys("\<esc>vBc")
    endif
endfunction

" delete end of word (works with wordmotion)
imap <silent> <C-Del> <Cmd>call <SID>Delete_end()<CR>
imap <silent> <M-Del> <Cmd>call <SID>Delete_END()<CR>

function! s:Delete_end()
    let l:cursorpos = getpos('.')
    if l:cursorpos[2] == 1
        call feedkeys("\<esc>vec")
    else
        call feedkeys("\<esc>lvec")
    endif
endfunction

function! s:Delete_END()
    let l:cursorpos = getpos('.')
    if l:cursorpos[2] == 1
        call feedkeys("\<esc>vEc")
    else
        call feedkeys("\<esc>lvEc")
    endif
endfunction

