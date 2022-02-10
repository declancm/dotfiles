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

function! s:Delete_start()
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
            call feedkeys("\<Space>\<Esc>vbc")
        endif
    endif
endfunction

function! s:Delete_START()
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
            call feedkeys("\<Space>\<Esc>vBc")
            noremap <silent> p "*p`[v`]=`]$
            noremap <silent> P "*P`[v`]=`]$
            noremap <silent> gp "*gp
        endif
    endif
endfunction

" delete end of word (works with wordmotion)
imap <silent> <C-Del> <Cmd>call <SID>Delete_end()<CR>
imap <silent> <M-Del> <Cmd>call <SID>Delete_END()<CR>

function! s:Delete_end()
    call feedkeys("\<Space>\<Esc>vec")
endfunction

function! s:Delete_END()
    call feedkeys("\<Space>\<Esc>vEc")
endfunction

" paste from global clipboard and auto format indent
noremap <silent> p <Cmd>call <SID>PrintAfterCursor()<CR>
noremap <silent> P <Cmd>call <SID>PrintBeforeCursor()<CR>
noremap <silent> gp <Cmd>call <SID>GPrintAfterCursor()<CR>
noremap <silent> gP <Cmd>call <SID>GPrintBeforeCursor()<CR>

function! s:PrintPrintAfterCursor()
    let l:printType = getregtype('*')
    if l:printType ==# 'V'
        normal! "*p`[v`]=`]$
    else
        normal! "*p
    endif
endfunction

function! s:PrintBeforeCursor()
    let l:printType = getregtype('*')
    if l:printType ==# 'V'
        normal! "*P`[v`]=`]$
    else
        normal! "*P
    endif
endfunction

function! s:GPrintAfterCursor()
    let l:printType = getregtype('*')
    if l:printType ==# 'V'
        normal! "*gp`[v`]=`]$
    else
        normal! "*gp
    endif
endfunction

function! s:GPrintBeforeCursor()
    let l:printType = getregtype('*')
    if l:printType ==# 'V'
        normal! "*gP`[v`]=`]$
    else
        normal! "*gP
    endif
endfunction

" append yank
vnoremap <leader>y <Cmd>call <SID>AppendYank()<CR>
nnoremap <leader>Y <Cmd>call <SID>AppendYankEnd()<CR>

function! s:AppendYank()
    normal! "xy
    " call setreg('*', getreg('*') . getreg('x'), 'V')
    call setreg('*', getreg('*') . getreg('x'), getregtype('*'))
endfunction

function! s:AppendYankEnd()
    normal! "xyg_
    call setreg('*', getreg('*') . getreg('x'), getregtype('*'))
endfunction

