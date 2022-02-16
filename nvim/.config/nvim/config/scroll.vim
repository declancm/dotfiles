" KEYMAPS:
nnoremap <silent> { <Cmd>call <SID>Scroll('{','10','0')<CR>
nnoremap <silent> } <Cmd>call <SID>Scroll('}','10','0')<CR>
vnoremap <silent> { <Cmd>call <SID>Scroll('{','10','0')<CR>
vnoremap <silent> } <Cmd>call <SID>Scroll('}','10','0')<CR>

nnoremap <silent> <C-u> <Cmd>call <SID>Scroll('<C-u>','7','0')<CR>
nnoremap <silent> <C-d> <Cmd>call <SID>Scroll('<C-d>','7','0')<CR>
inoremap <silent> <C-u> <Cmd>call <SID>Scroll('<C-u>','7','0')<CR>
inoremap <silent> <C-d> <Cmd>call <SID>Scroll('<C-d>','7','0')<CR>

nnoremap <silent> <C-b> <Cmd>call <SID>Scroll('<C-b>','7','1')<CR>
nnoremap <silent> <C-f> <Cmd>call <SID>Scroll('<C-f>','7','1')<CR>
nnoremap <silent> <PageUp> <Cmd>call <SID>Scroll('<C-b>','7','1')<CR>
nnoremap <silent> <PageDown> <Cmd>call <SID>Scroll('<C-f>','7','1')<CR>
inoremap <silent> <PageUp> <Cmd>call <SID>Scroll('<C-b>','7','1')<CR>
inoremap <silent> <PageDown> <Cmd>call <SID>Scroll('<C-f>','7','1')<CR>

" nnoremap <silent> gg <Cmd>call <SID>Scroll('gg','2','1')<CR>
" nnoremap <silent> G <Cmd>call <SID>Scroll('G','2','1')<CR>

" FUNCTIONS:
function! s:Scroll(movement, speed, slowdown)
    let l:pos = getcurpos()[1]
    let l:distance = <SID>MovementDistance(a:movement)
    if l:distance == 0 | return | endif
    let l:counter = 1
    if distance > 0
        while l:counter <= l:distance
            silent execute("normal! j")
            if ! (l:pos + l:counter <= &scrolloff + 1 || l:pos + l:counter >= line("$") - winheight('%') + winline())
                silent execute("normal! \<C-E>")
            endif
            let l:remaining = l:distance - l:counter
            call <SID>SleepDelay(l:remaining, a:speed, a:slowdown)
            redraw
            let l:counter += 1
        endwhile
    else
        while l:counter <= -l:distance
            silent execute("normal! k")
            if ! (l:pos - l:counter >= line("$") - &scrolloff)
                silent execute("normal! \<C-Y>")
            endif
            let l:remaining = -l:distance - l:counter
            call <SID>SleepDelay(l:remaining, a:speed, a:slowdown)
            redraw
            let l:counter += 1
        endwhile
    endif
endfunction

function! s:MovementDistance(movement)
    let l:winview = winsaveview()
    let l:pos = getcurpos()[1]
    echom a:movement
    silent execute("normal! " . a:movement)
    let l:newPos = getcurpos()[1]
    let l:distance = l:newPos - l:pos
    call winrestview(l:winview)
    return l:distance
endfunction

function! s:SleepDelay(remaining, speed, slowdown)
    if a:slowdown == 1
        if a:remaining <= 3
            silent execute("sleep " . (a:speed * (4 - a:remaining)) . "m")
        else
            silent execute("sleep " . a:speed . "m")
        endif
    else
        silent execute("sleep " . a:speed . "m")
    endif
endfunction
