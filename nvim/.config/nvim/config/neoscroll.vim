function! ParagraphDistanceUp(constant)
    let l:lnum = getcurpos()[1]
    if l:lnum == 0 | return 0 | endif
    let l:originalLnum = getcurpos()[1]
    let l:distance = 0
    let l:notEmpty = 0
    while l:lnum >= 0

        if l:lnum <= &scrolloff
            silent execute("normal! {")
            return 0
        endif

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

    " to fix the scrolloff bug
    if l:originalLnum >= line("$") - &scrolloff && l:distance <= -&scrolloff
        silent execute("normal! {")
        return 0
    " elseif l:originalLnum <= &scrolloff
    "     silent execute("normal! {")
    "     return 0
    elseif l:originalLnum >= line("$") - &scrolloff
        " let l:result += &scrolloff
        silent execute("normal! {")
        return 0
    endif

    echom l:distance
    return l:result
endfunction

function! ParagraphDistanceDown(constant)
    let l:lnum = getcurpos()[1]
    if l:lnum == line("$") | return 0 | endif
    let l:originalLnum = getcurpos()[1]
    let l:distance = 0
    let l:notEmpty = 0
    while l:lnum <= line("$")

        if l:lnum >= line("$") - &scrolloff
            silent execute("normal! }")
            return 0
        endif

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

    " to fix the scrolloff bug
    if l:originalLnum <= &scrolloff && l:distance <= &scrolloff
        silent execute("normal! }")
        return 0
    " elseif l:originalLnum >= line("$") - &scrolloff
    "     silent execute("normal! }")
    "     return 0
    elseif l:originalLnum <= &scrolloff
        " let l:result -= &scrolloff
        silent execute("normal! }")
        return 0
    endif

    echom l:result
    return l:result
endfunction

lua << EOF

require('neoscroll').setup({
    -- Set any options as needed
})

local t = {}

t['{'] = {'scroll', { 'vim.fn.ParagraphDistanceUp(1)', 'true', '-vim.fn.ParagraphDistanceUp(12)'}}
t['}'] = {'scroll', { 'vim.fn.ParagraphDistanceDown(1)', 'true', 'vim.fn.ParagraphDistanceDown(12)'}}

require('neoscroll.config').set_mappings(t)

EOF
