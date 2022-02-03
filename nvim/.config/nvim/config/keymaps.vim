" save, auto commit and push
" get the script from https://github.com/declancm/git-scripts.git
nnoremap <silent> <leader>cp :w<CR>:!source ~/git-scripts/commit.sh<CR>

" open notes (todo.txt) from anywhere and return. Automatically git pull when
" opening and then git commit and push when closing.
nnoremap <silent> <leader>n :call <SID>Notes_toggle()<CR>

function! s:Notes_toggle()
    let l:currentDir = getcwd(0)
    if l:currentDir ==# $HOME . '/notes'
        if &modified
            silent execute("w")
            execute("!source ~/git-scripts/commit.sh")
            silent execute("e# | lcd -")
        else
            silent execute("w | e# | lcd -")
        endif
    else
        silent execute("lcd ~/notes")
        silent execute("!git pull $(git remote) $(git rev-parse --abbrev-ref HEAD)")
        silent execute("edit ~/notes/notes.txt")
        " echom "notes.txt was opened."
    endif
endfunction

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
" leader d is now cut
nnoremap <leader>d ""d
nnoremap <leader>D ""D
vnoremap <leader>d ""d

" auto format indent for pasted content
" TODO make this work with python and PowerShell files
noremap <silent>p p`[v`]=
noremap <silent>P P`[v`]=
noremap <silent>gp gp`[v`]=
noremap <silent>gP gP`[v`]=
" change position of cursor when pasting
" noremap p gp
" noremap P gP
" noremap gp p
" noremap gP P

" delete start of word
" <C-H> is <C-BS>
" imap <C-H> <C-w>
" imap <M-BS> <esc>vBc

" delete start of word (works with wordmotion)
imap <silent> <C-H> <Cmd>call <SID>Delete_start()<CR>
imap <silent> <M-BS> <Cmd>call <SID>Delete_START()<CR>

function! s:Delete_start()
    let l:cursorpos = getpos('.')
    if l:cursorpos[2] == 2
        call feedkeys("\<esc>cl")
    elseif l:cursorpos[2] != 1
        call feedkeys("\<esc>vbc")
    endif
endfunction

function! s:Delete_START()
    let l:cursorpos = getpos('.')
    if l:cursorpos[2] == 2
        call feedkeys("\<esc>cl")
    elseif l:cursorpos[2] != 1
        call feedkeys("\<esc>vBc")
    endif
endfunction

" delete end of word (works with wordmotion)
imap <silent> <C-Del> <Cmd>call <SID>Delete_end()<CR>
imap <silent> <M-Del> <Cmd>call <SID>Delete_END()<CR>

function! s:Delete_end()
    let l:cursorpos = getpos('.')
    if l:cursorpos[2] == 1
        call feedkeys("\<esc>vec")
    else
        call feedkeys("\<esc>lvec")
    endif
endfunction

function! s:Delete_END()
    let l:cursorpos = getpos('.')
    if l:cursorpos[2] == 1
        call feedkeys("\<esc>vEc")
    else
        call feedkeys("\<esc>lvEc")
    endif
endfunction

