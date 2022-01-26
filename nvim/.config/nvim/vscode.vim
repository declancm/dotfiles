command! Code :call GetBuffers()

function! GetBuffers()

    " remove everything that isn't inside the quotation marks to get the name using sed
    let l:activeBuffers = execute("buffers(a)")
    echo l:activeBuffers

    " find the highest buffer number
    let l:largestBufnr = bufnr('$')
    echo "The largest bufnr is: " l:largestBufnr

    let l:lengthBufnr = len(l:activeBuffers)
    echo "The length of the largest bufnr is: " l:lengthBufnr
    " echo l:activeBuffers[:lengthBufnr]

    echo l:activeBuffers[:3][1:]

    " the current directory is:
    " pwd()

endfunction
