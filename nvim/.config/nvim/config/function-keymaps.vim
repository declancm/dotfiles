" open notes (todo.txt) from anywhere and return. Automatically git pull when
" opening and then git commit and push when closing.
nnoremap <silent> <leader>n :call <SID>NotesToggle()<CR>

function! s:NotesToggle()
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
    let l:cursorPos = getcurpos()
    if l:cursorPos[2] < 3
        call feedkeys("\<BS>")
    else
        normal b
        let l:cursorNew = getcurpos()
        silent execute("call cursor(l:cursorPos[1], l:cursorPos[2])")
        if l:cursorPos[1] - l:cursorNew[1] != 0
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

" window movement
nnoremap <leader>h <Cmd>call <SID>WindowMovement('h')<CR>
nnoremap <leader>j <Cmd>call <SID>WindowMovement('j')<CR>
nnoremap <leader>k <Cmd>call <SID>WindowMovement('k')<CR>
nnoremap <leader>l <Cmd>call <SID>WindowMovement('l')<CR>
nnoremap <leader><left> <Cmd>call <SID>WindowMovement('h')<CR>
nnoremap <leader><down> <Cmd>call <SID>WindowMovement('j')<CR>
nnoremap <leader><up> <Cmd>call <SID>WindowMovement('k')<CR>
nnoremap <leader><right> <Cmd>call <SID>WindowMovement('l')<CR>

function s:WindowMovement(key)
    let l:currentWin = winnr()
    silent execute("wincmd " . a:key)
    if (l:currentWin == winnr())
        if (match(a:key,'[jk]'))
            wincmd v
        else
            wincmd s
        endif
        silent execute("wincmd ".a:key)
    endif
endfunction

" close other buffers
nnoremap <silent> <leader>bd <Cmd>call <SID>BufferDelete()<CR>

function! s:BufferDelete()
    let l:cursorPos = getcurpos()
    silent execute("wa | %bdelete | normal! \<C-^>")
    silent execute("call cursor(l:cursorPos[1], l:cursorPos[2])")
endfunction

" scroll through paragraphs
nnoremap <silent> { <Cmd>call ParagraphUp()<CR>
nnoremap <silent> } <Cmd>call ParagraphDown()<CR>

function! ParagraphUp()
    let l:scrolloff = &scrolloff
    let l:lnum = getcurpos()[1]
    if l:lnum == 0 | return | endif
    let l:originalLnum = getcurpos()[1]
    let l:distance = 0
    let l:notEmpty = 0
    while l:lnum >= 0
        let l:line=getline(l:lnum)
        if l:line != '' | let l:notEmpty = 1 | endif
        if l:line == '' && l:notEmpty == 1
            let l:distance = l:lnum - l:originalLnum
            break
        endif
        let l:lnum -= 1
    endwhile
    if l:distance == 0 | let l:distance = 1 - l:lnum | endif

    let l:counter = 0
    while l:counter < -l:distance
        silent execute("normal! k")
        if l:originalLnum - l:counter >= line("$") - l:scrolloff
        else
            silent execute("normal! \<C-Y>")
        endif
        sleep 10m | redraw
        let l:counter += 1
    endwhile
endfunction

function! ParagraphDown()
    let l:scrolloff = &scrolloff
    let l:lnum = getcurpos()[1]
    if l:lnum == line("$") | return | endif
    let l:originalLnum = getcurpos()[1]
    let l:distance = 0
    let l:notEmpty = 0
    while l:lnum <= line("$")
        let l:line=getline(l:lnum)
        if l:line != '' | let l:notEmpty = 1 | endif
        if l:line == '' && l:notEmpty == 1
            let l:distance = l:lnum - l:originalLnum
            break
        endif
        let l:lnum += 1
    endwhile
    if l:distance == 0 | let l:distance = line("$") - l:originalLnum | endif

    let l:counter = 1
    while l:counter <= l:distance
        silent execute("normal! j")
        if l:originalLnum + l:counter <= l:scrolloff || l:originalLnum + l:counter >= line("$") - winheight('%') + winline()
        else
            silent execute("normal! \<C-E>")
        endif
        sleep 10m
        redraw
        let l:counter += 1
    endwhile
endfunction

" nmap <silent> { <Cmd>call MovementDistance('{')<CR>
" nmap <silent> } <Cmd>call MovementDistance('}')<CR>
function! MovementDistance(command)
    let l:winview = winsaveview()
    let l:pos = getcurpos()[1]
    silent execute("normal! " . a:command)
    let l:newPos = getcurpos()[1]
    let l:distance = l:newPos - l:pos
    echom l:distance
    call winrestview(l:winview)
    return l:distance
endfunction
