" chadtree
nnoremap <silent> <leader>e :CHADopen<CR>
nnoremap <silent> <leader>te :CHADopen --version-ctl<CR>
" clear quickfix list
nnoremap <silent> <leader>qf :call setqflist([])<CR>

" symbols outline keymap
nnoremap <leader>so :SymbolsOutline<CR>

" markdown preview
nnoremap <leader>mdp :MarkdownPreview<CR>
nnoremap <leader>mds :MarkdownPreviewStop<CR>

" sets default bindings for vim maximier which is 'F3':
let g:maximizer_set_default_mapping = 1

" trouble toggle keymap
nnoremap <leader>tt :TroubleToggle<CR>

" lspsaga
nnoremap <silent> <C-j> <Cmd>Lspsaga diagnostic_jump_next<CR>
nnoremap <silent>K <Cmd>Lspsaga hover_doc<CR>
inoremap <silent> <C-k> <Cmd>Lspsaga signature_help<CR>
nnoremap <silent> gh <Cmd>Lspsaga lsp_finder<CR>
" nnoremap <silent> <C-\> :Lspsaga open_floaterm<CR>
" tnoremap <silent> <C-\> :Lspsaga close_floaterm<CR>
