" design

" testing theme:
" TODO
" FIX
" HACK

let g:onedark_style = 'dark'
let g:onedark_transparent_background = v:true
let g:onedark_italic_comment = v:false
colorscheme onedark

" let g:tokyonight_style = 'storm'
" let g:tokyonight_transparent = v:true
" let g:tokyonight_italic_comments = v:false
" colorscheme tokyonight

" let g:material_style = 'palenight'
" lua << EOF
" require('material').setup()
" EOF
" colorscheme material

" let g:dracula_transparent_bg = 1
" colorscheme dracula
" highlight ColorColumn ctermbg=0 guibg=#191A21

" let g:nvcode_termcolors=256
" colorscheme onedark
" if (has("termguicolors"))
"     set termguicolors
"     hi LineNr ctermbg=NONE guibg=NONE
" endif
" highlight Comment ctermfg=Gray guifg=Gray

" Status line color is used when lualine is not used:
" highlight StatusLine ctermbg=0 guibg=Purple

" set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=NONE

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
