" save, auto commit and push
" get the script from https://github.com/declancm/git-scripts.git
nnoremap <silent> <leader>cp :w<CR>:!source ~/git-scripts/commit-silent.sh<CR>

" improve home key
map <Home> zH^
imap <Home> <Esc>zHI

" source config file
nnoremap <silent> <leader>sc :wa<CR>:source $MYVIMRC<CR>:echom "Your config file was sourced."<CR>

" move between open windows
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader><left> :wincmd h<CR>
nnoremap <leader><down> :wincmd j<CR>
nnoremap <leader><up> :wincmd k<CR>
nnoremap <leader><right> :wincmd l<CR>
nnoremap <leader>v <C-w>v
nnoremap <leader>s <C-w>s
" tmux-like previous window switch
nnoremap <leader>; :wincmd p<CR>
" resize windows
" up and right are increase, down and left are decrease
nnoremap <silent> <A-Up> :resize +5<CR>
nnoremap <silent> <A-Down> : resize -5<CR>
nnoremap <silent> <A-Right> :vertical resize +5<CR>
nnoremap <silent> <A-Left> :vertical resize -5<CR>

" open nerdtree explorer
" nnoremap <silent> <leader>ne :Lex 30<CR>

" undo tree
nnoremap <F5> :UndotreeToggle<CR>:wincmd p<CR>

" Y works like D and C
nnoremap Y yg_
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
nnoremap <silent> <leader>Y gg"*yG

" paste from global clipboard and auto format indent
noremap <silent> p "*p`[v`]=`]$
noremap <silent> P "*P`[v`]=`]$
noremap <silent> gp "*gp
noremap <silent> gP "*gP

" paste from global clipboard for filetypes that don't like auto indent
noremap <silent> <leader>p "*p`[v`]
noremap <silent> <leader>P "*P`[v`]

" try 'equalprg' and set to reindent.py or autopep8 for python using an autocmd
" pip3 install reindent
" augroup python_indent
"     autocmd!
"     " autocmd FileType python setlocal equalprg=$HOME/.local/lib/python3.9/site-packages/reindent.py
"     autocmd FileType python setlocal equalprg=$HOME/.local/bin/reindent
" augroup END

" higlight after indenting
vnoremap <silent> > >gv
vnoremap <silent> < <gv
vnoremap <silent> <S-Right> >gv
vnoremap <silent> <S-Left> <gv

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

