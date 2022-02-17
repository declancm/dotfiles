" vim2vscode
" nnoremap <silent> <leader>cp :wa<CR>:!source ~/git-scripts/commit-silent.sh<CR>
nnoremap <silent> <leader>cp <Cmd>CommitS<CR>

" git-scripts-vim
let g:gitscripts_no_defaults = 1

" cinnamon-scrolls
nnoremap <silent> { <Cmd>Scroll { 0 <CR>
nnoremap <silent> } <Cmd>Scroll } 0 <CR>
xnoremap <silent> { k<Cmd>Scroll {j 0 <CR>
xnoremap <silent> } j<Cmd>Scroll }k 0 <CR>

let g:cinnamon_no_defaults = 1
let g:cinnamon_extras = 1
