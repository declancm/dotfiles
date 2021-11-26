" design

let g:onedark_style = 'dark'
let g:onedark_transparent_background = v:true
let g:onedark_italic_comment = v:false
colorscheme onedark

" let g:tokyonight_style = 'storm'
" let g:tokyonight_transparent = v:true
" let g:tokyonight_italic_comments = v:false
" colorscheme tokyonight

" let g:tokyodark_transparent_background = 1
" let g:tokyodark_enable_italic_comment = 0
" let g:tokyodark_enable_italic = 1
" let g:tokyodark_color_gamma = "0.8"
" colorscheme tokyodark

"colorscheme gruvbox
"colorscheme dracula

highlight Comment ctermfg=DarkYellow

highlight StatusLine ctermbg=0 guibg=Purple
let g:rainbow_active = 1
set colorcolumn=80
" highlight ColorColumn ctermbg=0 guibg=Black
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
