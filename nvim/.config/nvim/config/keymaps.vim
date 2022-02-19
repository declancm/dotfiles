" improve home key
noremap <Home> zH^
inoremap <Home> <Esc>zHI

" source config file
nnoremap <silent> <leader>sc :wa<CR>:source $MYVIMRC<CR>:echom "Your config file was sourced."<CR>

" windows
nnoremap <leader>v <C-w>v
nnoremap <leader>s <C-w>s
" tmux-like previous window switch
nnoremap <leader>; :wincmd p<CR>
" resize windows
" up and right are increase, down and left are decrease
nnoremap <silent> <S-Up> :resize +5<CR>
nnoremap <silent> <S-Down> : resize -5<CR>
nnoremap <silent> <S-Right> :vertical resize +5<CR>
nnoremap <silent> <S-Left> :vertical resize -5<CR>

" Y works like D and C
nnoremap Y "*yg_
" staying centered
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap <silent> J mzJ`z :delmarks z<CR>
" adding undo break points
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u
" moving text
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
inoremap <C-j> <esc>:m .+1<CR>==a
inoremap <C-k> <esc>:m .-2<CR>==a
nnoremap <leader>k :m .-2<CR>==
nnoremap <leader>j :m .+1CR>==
vnoremap <S-up> :m '<-2<CR>gv=gv
vnoremap <S-down> :m '>+1<CR>gv=gv
inoremap <C-up> <esc>:m .-2<CR>==a
inoremap <C-down> <esc>:m .+1<CR>==a
nnoremap <C-up> :m .-2<CR>==
nnoremap <C-down> :m .+1<CR>==

" replace a word then press . to change the next occurrence of it.
nnoremap cn *``"_cgn
nnoremap cN *``"_cgN

" yank to global clipboard
nnoremap <silent> y "*y
vnoremap <silent> y "*y
" nnoremap <silent> <leader>Y gg"*yG

" paste from global clipboard for filetypes that don't like auto indent
noremap <silent> <leader>p "*p`[v`]
noremap <silent> <leader>P "*P`[v`]

" higlight after indenting
vnoremap <silent> > >gv
vnoremap <silent> < <gv

" c, d and x are now delete without yanking
nnoremap x "_x
nnoremap d "_d
nnoremap D "_D
vnoremap d "_d
nnoremap c "_c
nnoremap C "_C
vnoremap c "_c
" leader d is now cut
nnoremap <silent> <leader>d "*d
nnoremap <silent> <leader>D "*D
vnoremap <silent> <leader>d "*ygv"_d
" vnoremap <silent> <leader>d "*d

" delete start of word for command line
" <C-H> is <C-BS>
cmap <C-H> <C-w>

