"""
"""
"
" Contents; Line_number. Title:
"  16. Notes
"  38. Highlighting
"  67. Tabs
"  81. Other
" 110. Obsolete
" 120. Unknown
"
"""
"""

""""
" Vim Notes
"""
"
" Regex
" :%s/foo/bar/g
"
" Add line numbers to text of file
" Note: NOT :set nu, which displays line numbers in vim
" :%s/^/\=line('.')/
"
" Multiline cursors
" ctrl + v
" up/down or line number + enter
" shift + i
" enter text
" escape
"
"""
" End Vim Notes
"""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Highlighting                                                        "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Highlight long lines beyond the 80th character
" highlight OverLength ctermbg=red ctermfg=white guibg=#592929
"
" Vim doesn't support changing the underline color to something other
" than ctermfg!
" highlight OverLength ctermbg=black ctermfg=green cterm=underline
"
" The following won't work; cterm will be underline.
" highlight OverLength cterm=bold cterm=underline
"
" However, we can set cterm to be a list!
highlight OverLength cterm=bold,underline

" Show trailing whitespace and spaces before tabs
highlight ExtraWhitespace ctermbg=green

" Show tabs
highlight Tabs ctermbg=blue

" Combine the matches in the order we want
let ew = matchadd("ExtraWhitespace", ' \+\ze\t\|\s\+\%#\@<!$')
let ol = matchadd("OverLength", '\%81v.*')
let t  = matchadd("Tabs", '\t\+')

" Turn on search highlighting
"set hlsearch

" Turn on search highlighting.
" ctermfg --> text
" ctermbg --> block
highlight Search ctermfg=red ctermbg=green

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tabs
"
" NOTE: Current tab-width complies to Google's Python Style Guide.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Set width of tab
set tabstop=4

" Type spaces instead of tabs
set expandtab

" Replace all tabs with tabs according to the settings in this section
" retab


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Other                                                               "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Turn on line numbering
set nu

" Turn on syntax highlighting
syntax on

"Show line numbers at the bottom
set ruler

"Make sane the highlighting of parens
hi MatchParen cterm=underline  ctermfg=blue

"Map hjkl directional keys to htns
map h <left>
map t <down>
map n <up>
map s <right>

"Set color scheme
"colorscheme elflord


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Obsolete
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"Draw a column down the 81st line to define a region of n-1 columns
"Question: How can the color be specified?
"Answer: :highlight colorcolumn ctermbg=n, 0 < n < 17, n e Z
":set colorcolumn=80


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Unknown
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
":set whichwrap+=>,s
":set whichwrap+=<,h

" Acknowledgements
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" * http://vim.wikia.com/wiki/Highlight_all_search_pattern_matches
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
