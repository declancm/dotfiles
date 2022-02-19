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

augroup writing_buffer
    autocmd!
    autocmd BufWritePre * :call TrimWhitespace()
augroup END

" automatically set the tab size
function! s:TabSize()
    if &ft == 'html' | setlocal shiftwidth=2 tabstop=2 softtabstop=2
    elseif &ft == 'javascript' | setlocal shiftwidth=2 tabstop=2 softtabstop=2
    elseif &ft == 'json' | setlocal shiftwidth=2 tabstop=2 softtabstop=2
    elseif &ft == 'lua' | setlocal shiftwidth=2 tabstop=2 softtabstop=2
    elseif &ft == 'markdown' | setlocal shiftwidth=2 tabstop=2 softtabstop=2
    elseif &ft == 'ps1' | setlocal shiftwidth=2 tabstop=2 softtabstop=2
    else | setlocal shiftwidth=4 tabstop=4 softtabstop=4 | endif
endfunction

" autocmd BufEnter,BufWritePost * :call <SID>TabSize()

" use clang_format on save
function! s:FormatOnSave()
    let l:file = bufname()
    let l:fullPath = fnamemodify(l:file, ":p")
    " silent execute("!clang-format -i -style=file " . l:fullPath)
    " let l:configPath = fnamemodify("~/.config/nvim/.clang-format", ":p")
    " silent execute("!clang-format -i -style=file:" . l:configPath  . " " . l:fullPath)
    let l:cfConfig = "'{ BasedOnStyle: Google, UseTab: Never, IndentWidth: 4, TabWidth: 4, BreakBeforeBraces: Attach, AllowShortBlocksOnASingleLine: true, AllowShortIfStatementsOnASingleLine: true, IndentCaseLabels: false, ColumnLimit: 0, AccessModifierOffset: -4, DerivePointerAlignment: false, PointerAlignment: Left }'"
    silent execute("!clang-format -i -style=" . l:cfConfig . " " . l:fullPath)
    silent execute("e")
endfunction

" autocmd BufWritePost *.h,*.c,*.cpp call FormatOnSave()

augroup post_writing_buffer
    autocmd!
    autocmd BufWritePost *.h,*.hpp,*.c,*.cpp call <SID>FormatOnSave()
    " autocmd FileType * set formatoptions-=cro
    autocmd BufWritePost * :call <SID>TabSize()
augroup END

augroup entering_buffer
    autocmd!
    autocmd BufEnter * :call <SID>TabSize()
augroup END

" chadtree auto opens when opening a directory with nvim
augroup entering_vim
    autocmd!
    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
        \ execute 'CHADopen' | execute 'cd '.argv()[0] | endif
augroup END

autocmd FileType * set formatoptions-=cro | set signcolumn=yes
