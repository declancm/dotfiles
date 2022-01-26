command! VSCode :call GetBuffers()

function! GetBuffers()

    let l:activeBuffers = execute("buffers(a)")
    " echo l:activeBuffers
    call writefile([getcwd()], expand('$HOME/.config/nvim/vscode/data/directory.txt'))
    call writefile([l:activeBuffers], expand('$HOME/.config/nvim/vscode/data/files.txt'))

    " let l:activeBuffers = execute("buffers(a)")
    " let l:listOfBuffers = str2list(l:activeBuffers)
    " call writefile(l:listOfBuffers, expand('$HOME/.config/nvim/files.txt'))

    " save the activeBuffers to another file then use python

    " remove everything that isn't inside the quotation marks to get the name using sed

    " let l:listOfBuffers = getbufinfo({'bufloaded': 1, 'buflisted': 1, 'hidden': 0})
    " echo l:listOfBuffers

    " find the highest buffer number
    " let l:largestBufnr = bufnr('$')
    " echo "The largest bufnr is: " l:largestBufnr

    " let l:lengthBufnr = len(l:activeBuffers)
    " echo "The length of the largest bufnr is: " l:lengthBufnr
    " echo l:activeBuffers[:lengthBufnr]

    " echo l:activeBuffers[:3][1:]

    " the current directory is:
    " pwd()

endfunction
