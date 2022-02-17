" KEYMAPS:

" <Cmd>call <SID>Scroll(arg1, arg2 = '1', arg3 = '0', arg4 = '7', arg5 = '1')

" arg1 = Movement command (eg. 'gg')
" arg2 = Scroll the window ('1' for on, '0' for off)
" arg3 = Accept a count before the command ('1' for on, '0' for off)
" arg4 = Length of delay (in ms)
" arg5 = Slowdown at the end of the movement ('1' for on, '0' for off)

" Note: Each input argument is a string and the defaults are shown in the function above.

" paragraph movements
nnoremap <silent> { <Cmd>call <SID>Scroll('{','0')<CR>
nnoremap <silent> } <Cmd>call <SID>Scroll('}','0')<CR>
vnoremap <silent> { k<Cmd>call <SID>Scroll('{j','0')<CR>
vnoremap <silent> } j<Cmd>call <SID>Scroll('}k','0')<CR>

" half-window movements
nnoremap <silent> <C-u> <Cmd>call <SID>Scroll('<C-u>')<CR>
nnoremap <silent> <C-d> <Cmd>call <SID>Scroll('<C-d>')<CR>
inoremap <silent> <C-u> <Cmd>call <SID>Scroll('<C-u>')<CR>
inoremap <silent> <C-d> <Cmd>call <SID>Scroll('<C-d>')<CR>

" page movements
nnoremap <silent> <C-b> <Cmd>call <SID>Scroll('<C-b>')<CR>
nnoremap <silent> <C-f> <Cmd>call <SID>Scroll('<C-f>')<CR>
inoremap <silent> <C-b> <Cmd>call <SID>Scroll('<C-b>')<CR>
inoremap <silent> <C-f> <Cmd>call <SID>Scroll('<C-f>')<CR>
nnoremap <silent> <PageUp> <Cmd>call <SID>Scroll('<C-b>')<CR>
nnoremap <silent> <PageDown> <Cmd>call <SID>Scroll('<C-f>')<CR>
inoremap <silent> <PageUp> <Cmd>call <SID>Scroll('<C-b>')<CR>
inoremap <silent> <PageDown> <Cmd>call <SID>Scroll('<C-f>')<CR>

" start and end of file
" nnoremap <silent> gg <Cmd>call <SID>Scroll('gg','0','0','1')<CR>
" nnoremap <silent> G <Cmd>call <SID>Scroll('G','0','0','1')<CR>
" vnoremap <silent> gg <Cmd>call <SID>Scroll('gg','0','0','1')<CR>
" vnoremap <silent> G <Cmd>call <SID>Scroll('G','0','0','1')<CR>

" up and down movements
" nnoremap <silent> k <Cmd>call <SID>Scroll('k','0','1','2')<CR>
" nnoremap <silent> j <Cmd>call <SID>Scroll('j','0','1','2')<CR>
" nnoremap <silent> <Up> <Cmd>call <SID>Scroll('k','0','1','2')<CR>
" nnoremap <silent> <Down> <Cmd>call <SID>Scroll('j','0','1','2')<CR>
" vnoremap <silent> k <Cmd>call <SID>Scroll('k','0','1','2')<CR>
" vnoremap <silent> j <Cmd>call <SID>Scroll('j','0','1','2')<CR>
" vnoremap <silent> <Up> <Cmd>call <SID>Scroll('k','0','1','2')<CR>
" vnoremap <silent> <Down> <Cmd>call <SID>Scroll('j','0','1','2')<CR>

" FUNCTIONS:

function! s:Scroll(movement, scrollWin = '1', useCount = '0', delay = '7', slowdown = '1') abort
    let l:pos = getcurpos()[1]
    let l:distance = <SID>MovementDistance(a:movement, a:useCount)
    if l:distance == 0 | return | endif
    let l:counter = 1
    if distance > 0
        " scrolling downwards
        while l:counter <= l:distance
            silent execute("normal! j")
            if a:scrollWin == 1
                if ! (winline() <= &scrolloff + 1 || winline() >= winheight('%') - &scrolloff)
                    silent execute("normal! \<C-E>")
                endif
            endif
            let l:remaining = l:distance - l:counter
            call <SID>SleepDelay(l:remaining, a:delay, a:slowdown)
            let l:counter = <SID>CheckFoldCounter(l:counter)
        endwhile
    else
        " scrolling upwards
        while l:counter <= -l:distance
            silent execute("normal! k")
            if a:scrollWin == 1
                if ! (winline() <= &scrolloff + 1 || winline() >= winheight('%') - &scrolloff)
                    silent execute("normal! \<C-Y>")
                endif
            endif
            let l:remaining = -l:distance - l:counter
            call <SID>SleepDelay(l:remaining, a:delay, a:slowdown)
            let l:counter = <SID>CheckFoldCounter(l:counter)
        endwhile
    endif
endfunction

function! s:CheckFoldCounter(counter)
    let l:counter = a:counter
    let l:foldStart = foldclosed(".")
    if l:foldStart != -1
        let l:foldSize = foldclosedend(l:foldStart) - l:foldStart
        echom l:foldSize
        let l:counter += l:foldSize
    endif
    let l:counter += 1
    return l:counter
endfunction

function! s:MovementDistance(movement, useCount)
    let l:winview = winsaveview()
    let l:pos = getcurpos()[1]
    if a:useCount == 1
        silent execute("normal! " . v:count1 . a:movement)
    else
        silent execute("normal! " . a:movement)
    endif
    let l:newPos = getcurpos()[1]
    let l:distance = l:newPos - l:pos
    call winrestview(l:winview)
    return l:distance
endfunction

function! s:SleepDelay(remaining, delay, slowdown)
    if a:slowdown == 1
        if a:remaining <= 4
            silent execute("sleep " . (a:delay * (5 - a:remaining)) . "m")
        else
            silent execute("sleep " . a:delay . "m")
        endif
    else
        silent execute("sleep " . a:delay . "m")
    endif
    redraw
endfunction
