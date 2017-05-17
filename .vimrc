"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Contents; Section. Title:
"   0. Contents
"   1. Goals for this vimrc
"   2. Notes on the use of vim
"   3. Highlighting
"   4. Tabs
"   5. Other
"   6. Obsolete
"   7. Unknown
"
"
"  Question:
"  * I wonder if it's possible for vim to autoupdate the line numbers on which
"    sections appear.
"
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Goals
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" The goals for this vimrc are:
" * Compliance with style guides as much as reasonable:
"   - Google's Python Style Guide[1]
"   - Google's C++    Style Guide[2]
"   - NASA's   C      Style Guide[3]
"
" * Can be used and understood by a non-beginner vim novice
"
" * Contains notes on how to use vim, with sources as applicable
"   --> These should be saved and archived.
"
" Sources:
" 1,
" 2.
" 3.
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Notes on the use of vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Topics:
" 1. Help
" 2. Turning options off
" 3. Regular expressions
" 4. Add line numbers to text of file
" 5. Multiline cursors
" 6. Folding
"
" For help on any command, issue the command:
" help 'optionname'
" ex:
" help 'tabstop'
"
" To unset options, vim prepends a "no" to the option, e.g.:
" set nolist
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
" Folding
" * Create a fold:
"   - zf<number of lines>j
"   - e.g., zf30j folds the current line and the next 29
" * Open a fold: zo
" * Close a fold: zc
" * See link in Acknowledgements
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Highlighting
"
" Notes:
" * 80 columns complies with Google's Python style guide. (add acknowledgement)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Notes and Examples
" -----------------------------------------------------------------------------
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
" -----------------------------------------------------------------------------

" However, we can set cterm to be a list!
highlight OverLength cterm=bold,underline

" Show trailing whitespace and spaces before tabs
highlight ExtraWhitespace ctermbg=green

" Show tabs
" Might be nice to underline in blue every 4th whitespace when there are no
" characters aside from whitespace.
highlight Tabs ctermbg=blue

" Combine the matches in the order we want
let ew = matchadd("ExtraWhitespace", ' \+\ze\t\|\s\+\%#\@<!$')
let ol = matchadd("OverLength", '\%81v.*')
let t  = matchadd("Tabs", '\t\+')

" Set colorcolumn to an appropriate position and effective color.
" The goal is to bring attention to lines overlength.
" :help cterm for color options
set colorcolumn=81
highlight colorcolumn ctermbg=8 ctermfg=11

" Turn on search highlighting
set hlsearch 

" Turn on search highlighting.
" ctermfg --> text
" ctermbg --> block
highlight Search ctermfg=red ctermbg=green

" Set high-contrast colors for highlighting parentheses
" hi MatchParen cterm=bold ctermbg=blue ctermfg=green
hi MatchParen cterm=bold ctermbg=black ctermfg=lightblue


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" End Highlighting
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tabs
"
" NOTE: Current tab-width complies to Google's Python Style Guide.
" Also, add a reference!
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Set width of tab
set tabstop=4

" Type spaces instead of tabs
set expandtab

" * tabstop=4: max width of actual tab character
" * softtabstop=0: setting to nonzero uses a combination of space characters
"   and tab characters to simulate tabs of tabstop width
" * expandtab: insert spaces instead of tab characters. also affects retab,
"   but idk what that does
"
" shiftwidth=3: size of an indent measured in space characters
" smarttab: tab key inserts only spaces
" set tabstop=8 softtabstop=0 expandtab shiftwidth=3 smarttab
"
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Other                                                               "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Turn on line numbering
" Alternatively, :set number
set nu

" Turn on syntax highlighting
syntax on

"Show line and column numbers at the bottom
set ruler

"Map hjkl directional keys to htns
"map h <left>
"map t <down>
"map n <up> " Problem: the n key is used for 'next' in seaches.
"map s <right>

"Set color scheme
"colorscheme elflord

" Put swap files in ~/.vim/swap_files
" NOTE: This directory does not exist by default and must be created.
" By default this is set to off by being commented out. Uncomment
" once directory is created. 
" ^= notation for :set prepends to the list, so this will be checked first
"set directory^=$HOME/.vim/swap_files

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
" * http://vim.wikia.com/wiki/Folding
" * http://vim.wikia.com/wiki/Highlight_all_search_pattern_matches
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
