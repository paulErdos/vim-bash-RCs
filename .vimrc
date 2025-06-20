"if &term =~ "xterm\\|rxvt"
"  " use an orange cursor in insert mode
"  let &t_SI = "\<Esc>]12;orange\x7"
"  " use a red cursor otherwise
"  let &t_EI = "\<Esc>]12;red\x7"
"  silent !echo -ne "\033]12;red\007"
"  " reset cursor when vim exits
"  autocmd VimLeave * silent !echo -ne "\033]112\007"
"  " use \003]12;gray\007 for gnome-terminal
"endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Contents; Section. Title:
"   0. Contents
"   1. Goals for this vimrc
"   2. Rainbow Parentheses
"   3. Highlighting
"   4. Tabs
"   5. Other
"   6. Obsolete
"   7. Unknown
"   8. Notes on the use of vim
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
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Rainbow Parens https://github.com/junegunn/rainbow_parentheses.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Plugins will be downloaded under the specified directory.
"call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
"Plug 'junegunn/rainbow_parentheses.vim'

" List ends here. Plugins become visible to Vim after this call.
"Automatically executes filetype plugin indent on and syntax enable. You can
"revert the settings after the call. e.g. filetype indent off, syntax off,
"etc.
"call plug#end()
filetype indent off

" Start it for all filetypes
"augroup rainbow_lisp
"  autocmd!
"  autocmd FileType * RainbowParentheses
"augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 3. Highlighting
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
" Useful:
" * https://alvinalexander.com/linux/vi-vim-editor-color-scheme-syntax
" * https://en.wikipedia.org/wiki/File:Xterm_256color_chart.svg
" -----------------------------------------------------------------------------

" Change selection color
hi Visual ctermbg=039 ctermfg=052

" However, we can set cterm to be a list!
" highlight OverLength cterm=bold,underline
highlight OverLength cterm=bold

" Show trailing whitespace and spaces before tabs
highlight ExtraWhitespace ctermbg=LightBlue

" Show tabs
" In the future, it might be nice to underline in blue every 4th whitespace
" when there are no characters aside from whitespace.
highlight Tabs ctermbg=blue

" Combine the matches in the order we want
let ew = matchadd("ExtraWhitespace", ' \+\ze\t\|\s\+\%#\@<!$')
let ol = matchadd("OverLength", '\%80v.*')
let t  = matchadd("Tabs", '\t\+')

" Set colorcolumn to an appropriate position and effective color.
" The goal is to bring attention to lines overlength.
" :help cterm for color options
set colorcolumn=80
highlight colorcolumn ctermbg=8 ctermfg=11

" Turn on search highlighting
set hlsearch

" Turn on incremental search
set incsearch

" Turn on search highlighting.
" ctermfg --> text
" ctermbg --> block
"highlight Search cterm=bold,underline ctermfg=darkgrey ctermbg=lightcyan
highlight Search cterm=bold ctermfg=white ctermbg=017

" Set high-contrast colors for highlighting parentheses
" hi MatchParen cterm=bold ctermbg=blue ctermfg=green
hi MatchParen cterm=bold ctermbg=black ctermfg=lightcyan

" Matchparen has a finite max line length that messes up kubectl edit deployment
set maxmempattern=5000

" Cool color schemes
" However, they mess up other highlight options
colorscheme default
"colorscheme pablo

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
"
" Case-insensitive search
set ignorecase

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
set directory^=$HOME/.vim/swap_files

" Disable swap files
set nobackup
set noswapfile


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

" Highlight column and row the cursor is on
"set cursorline
"set cursorcolumn

" To see the 256 colors, look here: https://jonasjacek.github.io/colors/
"hi CursorLine ctermbg=0 ctermfg=none cterm=none
hi CursorColumn   ctermbg=234 cterm=none
hi CursorLineNR ctermfg=226
hi LineNr ctermfg=240 ctermbg=235

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colors
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"colorscheme vimbrant


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
" 7. Text completion
"
" 1. Help
" For help on any command, issue the command:
" help 'optionname'
" ex:
" help 'tabstop'
"
" 2. Options
" To unset options, vim prepends a "no" to the option, e.g.:
" set nolist
"
" 3. Regex
" Regex
" :%s/foo/bar/g
"
" 4. Add line numbers to text of file
" Add line numbers to text of file
" Note: NOT :set nu, which displays line numbers in vim
" :%s/^/\=line('.')/
"
" 5. Multiline cursors
" Multiline cursors
" ctrl + v
" up/down or line number + enter
" shift + i
" enter text
" escape
"
" 6. Folding
" * Create a fold:
"   - zf<number of lines>j
"   - e.g., zf30j folds the current line and the next 29
" * Open a fold: zo
" * Close a fold: zc
" * See link in Acknowledgements
"
" 7. Completion
" :h ins-completion
" example:
" 1. In insert mode, type "ins-complet"
" 2. Press ctrl+x
" 3. Press ctrl+i
" Ctrl+n is also interesting.
"
" 8. To delete matching parentheses:
" 1. The "%" character does this:
"    1. Place cursor on one of ()[]{}.
"    2. Press "%".
"    3. Note that the cursor has jumped to the matching delimiter.
" 2. Press "x" to delete the character under the cursor.
" 3. The "`" is involved with jumping to marks and I don't completely
"    understand it.
"    0. read ":help marks"
"    1. Press "`" twice, and the cursor will jump back to the original
"       delimiter the cursor was placed under.
" 4. Press "x" again to delete the delimiter.
"
" 9. To delete thing inside parentheses:
" 1. Position cursor inside parens.
" 2. "da)"
"
" 10. Regular Expressions:
" * Execute multiple regexes on a multiline selection.
"   - NOTE: "%" CAUSES THE REGEX TO WORK ON THE ENTIRE FILE. 
"   - Note the widespread use of "e", as well as its relation to "g"; in this
"     example these cannot be exchanged.
"   - Note that "%" must be added on every regex after the first
"   - The regex itself as it was used:
"     --> ":'<,'>s/string/integer/e | %s/a/1/eg | %s/!/0/e"
"   - The regex made generic:
"     --> ":'<,'>s/foo1/bar1/e | %s/foo2/bar2/eg | %s/foo3/bar3/e"
"
" 11. Iteratively adding text to files, for loops:
"   The following example adds some IP addresses to a file:
"   :for i in range(1,10) | put ='192.168.0.'.i | endfor
"
"   I used this:
"   :for i in range(1,29) | put =i.'.' | endfor
"   to add, e.g.,
"   1.
"   2.
"   3.
"   to a file.
"
"   Note: It appears that the index must be concatenated using a '.'
"
" More here:
"   http://vim.wikia.com/wiki/Making_a_list_of_numbers
"
" 12. Recording
" To start recording: press 'q', followed by a letter. (in normal mode)
" Then everything is recorded until 'q' is pressed again in normal mode.
" To reference that recording, press (in normal mode) "@", followed by
" the letter from before. The recording will then be executed.
"
" Fun fact: playback of recordings can be recorded.
"
