let g:smoothie_experimental_mappings = v:true

function! ParagraphDistanceUp(constant)
    let l:lnum = getcurpos()[1]
    if l:lnum == 0 | return 0 | endif
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
    let l:result = l:distance * a:constant
    return l:result
endfunction

function! ParagraphDistanceDown(constant)
    let l:lnum = getcurpos()[1]
    if l:lnum == line("$") | return 0 | endif
    let l:originalLnum = getcurpos()[1]
    let l:distance = 0
    let l:notEmpty = 0
    while l:lnum <= line("$")
        let l:line=getline(l:lnum)
        if l:line != "" | let l:notEmpty = 1 | endif
        if l:line == "" && l:notEmpty == 1
            let l:distance = l:lnum - l:originalLnum
            break
        endif
        let l:lnum += 1
    endwhile
    if l:distance == 0 | let l:distance = line("$") - l:lnum | endif
    let l:result = l:distance * a:constant
    return l:result
endfunction
