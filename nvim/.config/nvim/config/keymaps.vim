let mapleader = "\<BS>"
" improve home key
:map <Home> zH^
:imap <Home> <Esc>zHI
" move between open windows
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader><left> :wincmd h<CR>
nnoremap <leader><down> :wincmd j<CR>
nnoremap <leader><up> :wincmd k<CR>
nnoremap <leader><right> :wincmd l<CR>
" nnoremap <leader>v <C-w>v
" nnoremap <leader>s <C-w>s
" open nerdtree explorer
nnoremap <silent> <leader>ne :Lex 30<CR>
" tmux-like previous window switch
nnoremap <leader>; :wincmd p<CR>
" symbols outline keymap
nnoremap <leader>so :SymbolsOutline<CR>
" chadtree
nnoremap <silent> <leader>e :CHADopen<CR>
nnoremap <silent> <leader>te :CHADopen --version-ctl<CR>
" clear quickfix list
nnoremap <silent> <leader>qf :call setqflist([])<CR>
" markdown preview
nnoremap <leader>mdp :MarkdownPreview<CR>
nnoremap <leader>mds :MarkdownPreviewStop<CR>

" nnoremap <Leader>ps :Rg<SPACE>

" resize windows
" up and right are increase, down and left are decrease
nnoremap <silent> <A-Up> :resize +5<CR>
nnoremap <silent> <A-Down> : resize -5<CR>
nnoremap <silent> <A-Right> :vertical resize +5<CR>
nnoremap <silent> <A-Left> :vertical resize -5<CR>

" undo tree
nnoremap <F5> :UndotreeToggle<CR>:wincmd p<CR>

" sets default bindings for vim maximier which is 'F3':
let g:maximizer_set_default_mapping = 1
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
" paste from global clipboard
nnoremap <leader>p "+]p
" yank to global clipboard
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>Y gg"+yG
" c, d and x are now delete without yanking
nnoremap x "_x
nnoremap d "_d
nnoremap D "_D
vnoremap d "_d
nnoremap c "_c
nnoremap C "_C
vnoremap c "_c
" leader c and d is now cut
nnoremap <leader>d ""d
nnoremap <leader>D ""D
vnoremap <leader>d ""d
nnoremap <leader>c ""c
nnoremap <leader>C ""C
vnoremap <leader>c ""c
" trouble toggle keymap
nnoremap <leader>tt :TroubleToggle<CR>

" save, auto commit and push
nnoremap <silent> <leader>cp :w<CR>:!source ~/Git/git-commit-kit/commit.sh<CR>

" auto indent pasted content
noremap p p`[v`]=
noremap P p`[v`]=
noremap gp gp`[v`]=
noremap gP gP`[v`]=

" delete previous word
imap <C-BS> <C-w>
" inoremap <C-BS> <C-\><C-O>db
" noremap! <C-BS> <C-w>

" open notes (todo.txt) from anywhere and return. Automatically git pull when
" opening and then git commit and push when closing.
" nnoremap <silent> <leader>ng mZ :lcd ~/notes<CR> :silent exec "!git pull origin master > /dev/null"<CR> :edit ~/notes/notes.txt<CR>
" nnoremap <silent> <leader>nb :w<CR> :silent exec "!source ~/.config/nvim/auto-commit/commit.sh"<CR> :lcd -<CR> `Z :delmarks Z<CR>
" open notes (todo.txt) from anywhere and return.
" nnoremap <silent> <leader>ng mZ :lcd ~/notes<CR> :edit ~/notes/notes.txt<CR>
" nnoremap <silent> <leader>nb :w<CR> :lcd -<CR> `Z :delmarks Z<CR>

nnoremap <silent> <expr> <leader>nt Notes_toggle()

function! Notes_toggle()
    let currentDir = getcwd(0)
    if currentDir ==# $HOME . '/notes'
        " silent call feedkeys(":w\<CR> `Z :lcd -\<CR> :delmarks Z\<CR>")
        silent call feedkeys(":w\<CR> :silent exec \"!source ~/Git/git-commit-kit/commit.sh\"\<CR> `Z :lcd -\<CR> :delmarks Z\<CR>")
    else
        silent call feedkeys("mZ :lcd ~/notes\<CR> :silent exec \"!git pull origin master > /dev/null\"\<CR> :edit ~/notes/notes.txt\<CR>")
        " call feedkeys("mZ :lcd ~/notes\<CR> :silent exec \"!git pull $(git remote) $(git rev-parse --abbrev-ref HEAD) > /dev/null\"\<CR> :edit ~/notes/notes.txt\<CR>")
    endif
endfunction

" function! Notes_toggle()
"     let g:currentDir = getcwd(0)
"     if g:currentDir ==# $HOME . '/notes' && g:originDir != v:null
"         silent call feedkeys(":w\<CR> `Z :lcd " . originDir . "\<CR> :delmarks Z\<CR>")
"     else
"         let g:originDir = g:currentDir
"         silent call feedkeys("mZ :lcd ~/notes\<CR> :silent exec \"!git pull origin master > /dev/null\"\<CR> :edit ~/notes/notes.txt\<CR>")
"         " call feedkeys("mZ :lcd ~/notes\<CR> :silent exec \"!git pull $(git remote) $(git rev-parse --abbrev-ref HEAD) > /dev/null\"\<CR> :edit ~/notes/notes.txt\<CR>")
"     endif
" endfunction

" nnoremap <F9> :set paste<CR> "<F8>" :set topaste<CR>

" change position of cursor when pasting
" noremap p gp
" noremap P gP
" noremap gp p
" noremap gP P

