" syntax highlighting plugin for json with c-style comments setup
autocmd BufRead,BufNewFile *.mycjson set filetype=jsonc

" quickscope colors selection (needs to be before 'colorscheme')
augroup qs_colors
    autocmd!
    autocmd ColorScheme * highlight QuickScopePrimary guifg='#F1FA8C' gui=underline ctermfg=155 cterm=underline
    autocmd ColorScheme * highlight QuickScopeSecondary guifg='#FF5555' gui=underline ctermfg=81 cterm=underline
augroup END

augroup HighlightYank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 100})
augroup END

autocmd TextYankPost * call system('echo '.shellescape(join(v:event.regcontents, "\<CR>")).' |  clip.exe')

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

augroup writing_file
    autocmd!
    autocmd BufWritePre * :call TrimWhitespace()
augroup END

" make tabs smaller for specific file types
autocmd FileType html setlocal shiftwidth=2 tabstop=2
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
autocmd FileType lua setlocal shiftwidth=2 tabstop=2
autocmd FileType markdown setlocal shiftwidth=2 tabstop=2
autocmd FileType ps1 setlocal shiftwidth=2 tabstop=2
autocmd FileType json setlocal shiftwidth=2 tabstop=2

" chadtree auto opens when opening a directory with nvim
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ execute 'CHADopen' | execute 'cd '.argv()[0] | endif

" stop auto inserting comments
autocmd BufEnter * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
