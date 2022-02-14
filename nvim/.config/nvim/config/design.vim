set colorcolumn=80

" onedark setup
" colorscheme onedark
" highlight ColorColumn ctermbg=0 guibg=#31353f

" tokyonight setup
let g:tokyonight_style = 'storm'
let g:tokyonight_transparent = v:true
let g:tokyonight_italic_comments = v:false
colorscheme tokyonight
highlight ColorColumn ctermbg=0 guibg=#1f2335

highlight Normal guibg=none
" set up cursor for different modes
if &term =~ '^xterm'
    " normal mode
    let &t_EI .= "\<Esc>[0 q"
    " insert mode
    let &t_SI .= "\<Esc>[5 q"
endif

" highlight the line number
highlight CursorLineNr guifg=white
set cursorline
set cursorlineopt=number

" add bullet points to selected file types
let g:bullets_enabled_file_types = ['markdown', 'text']
let g:bullets_enable_in_empty_buffers = 0 " default = 1

" quickscope setup
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
let g:qs_max_chars=150
