" VIM2VSCODE:

" GIT-SCRIPTS-VIM:

" let g:gitscripts_no_defaults = 1

" nnoremap <silent> <leader>gc :wa<CR>:!source ~/git-scripts/commit-silent.sh<CR>
" nnoremap <silent> <leader>cp <Cmd>CommitS<CR>

" let g:gitscripts_location = "~/.config/nvim/git-scripts"

" CINNAMON-SCROLL:

let g:cinnamon_no_defaults = 1

" paragraph movements
nnoremap <silent> { <Cmd>Cinnamon { 0 <CR>
nnoremap <silent> } <Cmd>Cinnamon } 0 <CR>
xnoremap <silent> { <Cmd>call VParagraphUp()<CR>
xnoremap <silent> } <Cmd>call VParagraphDown()<CR>

function! VParagraphUp()
    silent exec "norm! k" | silent exec "Cinnamon { 0"
    if line(".") != 1 || len(getline(".")) == 0 | silent exec "norm! j" | endif
endfunction

function! VParagraphDown()
    silent exec "norm! j" | silent exec "Cinnamon } 0"
    if line(".") != line("$") || len(getline(".")) == 0 | silent exec "norm! k" | endif
endfunction

" half-window movements
nnoremap <silent> <C-u> <Cmd>Cinnamon <C-u> <CR>
nnoremap <silent> <C-d> <Cmd>Cinnamon <C-d> <CR>
inoremap <silent> <C-u> <Cmd>Cinnamon <C-u> <CR>
inoremap <silent> <C-d> <Cmd>Cinnamon <C-d> <CR>

" page movements
nnoremap <silent> <C-b> <Cmd>Cinnamon <C-b> <CR>
nnoremap <silent> <C-f> <Cmd>Cinnamon <C-f> <CR>
inoremap <silent> <C-b> <Cmd>Cinnamon <C-b> <CR>
inoremap <silent> <C-f> <Cmd>Cinnamon <C-f> <CR>
nnoremap <silent> <PageUp> <Cmd>Cinnamon <C-b> <CR>
nnoremap <silent> <PageDown> <Cmd>Cinnamon <C-f> <CR>
inoremap <silent> <PageUp> <Cmd>Cinnamon <C-b> <CR>
inoremap <silent> <PageDown> <Cmd>Cinnamon <C-f> <CR>

" let g:cinnamon_extras = 1

" previous/next cursor position
nnoremap <silent> <C-o> <Cmd>Cinnamon <C-o> 0 0 3 <CR>
nnoremap <silent> <C-i> <Cmd>Cinnamon <C-i> 0 0 3 <CR>

" start and end of file movements
nnoremap <silent> gg <Cmd>Cinnamon gg 0 0 3 <CR>
nnoremap <silent> G <Cmd>Cinnamon G 0 0 3 <CR>
xnoremap <silent> gg <Cmd>Cinnamon gg 0 0 3 <CR>
xnoremap <silent> G <Cmd>Cinnamon G 0 0 3 <CR>
