" VIM2VSCODE:

" GIT-SCRIPTS-VIM:

" let g:gitscripts_no_defaults = 1

" nnoremap <silent> <leader>gc :wa<CR>:!source ~/git-scripts/commit-silent.sh<CR>
" nnoremap <silent> <leader>cp <Cmd>CommitS<CR>

" let g:gitscripts_location = "~/.config/nvim/git-scripts"

" CINNAMON-SCROLL:

" let g:cinnamon_extras = 1

let g:cinnamon_no_defaults = 1

" " Paragraph movements
nnoremap <silent> { <Cmd>Cinnamon { 0 <CR>
nnoremap <silent> } <Cmd>Cinnamon } 0 <CR>
xnoremap <silent> { <Cmd>call VisualParagraph('up')<CR>
xnoremap <silent> } <Cmd>call VisualParagraph('down')<CR>

function! VisualParagraph(direction)
    if a:direction == 'up'
        silent exec "normal! k" | silent execute "Cinnamon { 0"
        if line(".") != 1 || len(getline(".")) == 0 | silent exec "normal! j" | endif
    else
        silent exec "normal! j" | silent execute "Cinnamon } 0"
        if line(".") != line("$") || len(getline(".")) == 0 | silent exec "normal! k" | endif
    end
endfunction

" Half-window movements
nnoremap <silent> <C-u> <Cmd>Cinnamon <C-u> <CR>
nnoremap <silent> <C-d> <Cmd>Cinnamon <C-d> <CR>
inoremap <silent> <C-u> <Cmd>Cinnamon <C-u> <CR>
inoremap <silent> <C-d> <Cmd>Cinnamon <C-d> <CR>

" Page movements
nnoremap <silent> <C-b> <Cmd>Cinnamon <C-b> <CR>
nnoremap <silent> <C-f> <Cmd>Cinnamon <C-f> <CR>
inoremap <silent> <C-b> <Cmd>Cinnamon <C-b> <CR>
inoremap <silent> <C-f> <Cmd>Cinnamon <C-f> <CR>
nnoremap <silent> <PageUp> <Cmd>Cinnamon <C-b> <CR>
nnoremap <silent> <PageDown> <Cmd>Cinnamon <C-f> <CR>
inoremap <silent> <PageUp> <Cmd>Cinnamon <C-b> <CR>
inoremap <silent> <PageDown> <Cmd>Cinnamon <C-f> <CR>

" start and end of file movements
nnoremap <silent> gg <Cmd>Cinnamon gg 0 0 2 <CR>
nnoremap <silent> G <Cmd>Cinnamon G 0 0 2 <CR>
xnoremap <silent> gg <Cmd>Cinnamon gg 0 0 2 <CR>
xnoremap <silent> G <Cmd>Cinnamon G 0 0 2 <CR>
