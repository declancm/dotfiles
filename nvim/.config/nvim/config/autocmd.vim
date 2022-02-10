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
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 200})
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
" fix this being reset
" augroup smaller_tabs
"     autocmd!
"     autocmd FileType html setlocal shiftwidth=2 tabstop=2
"     autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
"     autocmd FileType lua setlocal shiftwidth=2 tabstop=2
"     autocmd FileType markdown setlocal shiftwidth=2 tabstop=2
"     autocmd FileType ps1 setlocal shiftwidth=2 tabstop=2
"     autocmd FileType json setlocal shiftwidth=2 tabstop=2
" augroup END

autocmd FileType html setlocal shiftwidth=2 tabstop=2
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
autocmd FileType lua setlocal shiftwidth=2 tabstop=2
autocmd FileType markdown setlocal shiftwidth=2 tabstop=2
autocmd FileType ps1 setlocal shiftwidth=2 tabstop=2
autocmd FileType json setlocal shiftwidth=2 tabstop=2

" " use clang_format on save
" function! Formatonsave()
"     let l:formatdiff = 1
"     " save cursor pos
"     normal ggVG
"     pyfile /usr/share/clang/clang-format-12/clang-format.py
"     " jump to cursor pos
" endfunction
" autocmd BufWritePre *.h,*.c,*.cpp call Formatonsave()

function! FormatOnSave()
    let l:file = bufname()
    let l:fullPath = fnamemodify(l:file, ":p")
    " silent execute("!clang-format -i -style=file " . l:fullPath)
    let l:cfConfig = "'{ BasedOnStyle: Google, UseTab: Never, IndentWidth: 4, TabWidth: 4, BreakBeforeBraces: Attach, AllowShortIfStatementsOnASingleLine: true, IndentCaseLabels: false, ColumnLimit: 0, AccessModifierOffset: -4 }'"
    silent execute("!clang-format -i -style=" . l:cfConfig . " " . l:fullPath)
    e
endfunction
autocmd BufWritePost *.h,*.c,*.cpp call FormatOnSave()

" chadtree auto opens when opening a directory with nvim
augroup open_chadtree
    autocmd!
    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
        \ execute 'CHADopen' | execute 'cd '.argv()[0] | endif
augroup END

" stop auto inserting comments
autocmd FileType * set formatoptions-=c formatoptions-=r formatoptions-=o
