" design

" chadtree theme
" let g:chadtree_settings.theme.text_colour_set = 'solarized_dark_256'
" lua local chadtree_settings = { ["theme.text_colour_set"] = "solarized_light" }

set colorcolumn=80

" onedark setup
" let g:onedark_style = 'dark'
" let g:onedark_transparent_background = v:true
" let g:onedark_italic_comment = v:false
" colorscheme onedark
" highlight ColorColumn ctermbg=0 guibg=#31353f

" dracula setup
" let g:dracula_transparent_bg = 1
" colorscheme dracula
" highlight ColorColumn ctermbg=0 guibg=#191A21

" tokyonight setup
let g:tokyonight_style = 'storm'
let g:tokyonight_transparent = v:true
let g:tokyonight_italic_comments = v:false
colorscheme tokyonight

" material setup
" let g:material_style = 'palenight'
" lua << EOF
" require('material').setup()
" EOF
" colorscheme material

" Status line color is used when lualine is not used:
" highlight StatusLine ctermbg=0 guibg=Purple

" highlight ColorColumn ctermbg=0 guibg=NONE

highlight Normal guibg=none
" set up cursor for different modes
if &term =~ '^xterm'
    " normal mode
    let &t_EI .= "\<Esc>[0 q"
    " insert mode
    let &t_SI .= "\<Esc>[5 q"
endif

" change the color of the character under the cursor
" hi Cursor guifg=black
" hi lCursor guifg=black
" hi CursorIM guifg=black

" highlight the line number
highlight CursorLineNr guifg=white
set cursorline
set cursorlineopt=number

" add bullet points to selected file types
let g:bullets_enabled_file_types = ['markdown', 'text']
let g:bullets_enable_in_empty_buffers = 0 " default = 1
