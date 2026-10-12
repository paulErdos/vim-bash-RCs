#============================================================================#
# Color
#============================================================================#

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        # We have color support; assume it's compliant with Ecma-48
        # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
        # a case would tend to support setf rather than setaf.)
        color_prompt=yes
    else
        color_prompt=
    fi
fi

echo 'Color prompt: '"$color_prompt"

if [ "$color_prompt" = yes ]; then
    PROMPT='%F{green}%n@%m%f:%F{blue}%~%f$ '
else
    PROMPT='%n@%m:%~$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PROMPT=$'%{\e]0;%n@%m: %~\a%}'$PROMPT
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
else
    # macOS uses `ls -G` for colorized output
    alias ls='ls -G'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'


#============================================================================#
# Personalization
#============================================================================#

# teal blue: color code 51
export PROMPT='%F{51}(>^_^)>%f %1~ %# 🪬'

# Use '>' for non-root and '#' for root
export PROMPT='%F{cyan}(>^_^)>%f %1~ %(!.#.>) '


#============================================================================#
# Brew
#============================================================================#

eval "$(/opt/homebrew/bin/brew shellenv)"


#============================================================================#
# Aliases                                                                    #
#============================================================================#

# Zorklike Shell
alias look=ls

alias go="cd "
alias back=" -"
alias north=".."

alias map="pwd"
alias scroll=man


# Bash
# -----------

alias ls='ls -aFghG' # n replaces username with numerical user id
#alias ls='ls -alhFGioOps' # wide, everything
function .. { cd '..'; }
function ... { cd '../..'; }
function .... { cd '../../..'; }


# Bash Ecosystem
# ----------------

# Use the patched version of GNU Screen that supports vertical splitting
#alias screen=/Users/developer/installed_stuff/screen.git/src/screen


# Python
# -----------

alias pip='pip3'
alias python2='/usr/bin/python'
alias python='python3'



#============================================================================#
# Path - End section, deliberately-open-ended                                #
#============================================================================#

#PATH=$PATH:~/scripts
PATH=$PATH:/Users/developer/Stuff_Ive_Installed/gdb/build/gdb
PATH=$PATH:/Library/Frameworks/Python.framework/Versions/3.6/bin
PATH=$PATH:~/Documents/Utilities/mongodb/bin
PATH=$PATH:/Users/vincentsteffens/anaconda/bin
PATH=$PATH:~/Library/Python/3.7/bin/
export PATH
export PATH=$HOME/bin:$PATH
export PATH=$PATH:~/go
export PATH=$PATH:~/go/bin
export PATH=$PATH:/usr/local/scala/bin
export PATH=$PATH:/Library/Frameworks/Python.framework/Versions/3.7/bin
#export PATH=$PATH:~/scripts
export PATH=$PATH:~/Repositories/small-tools/in-path
export PATH=$PATH:~/.cargo/bin
PATH=/home/neon/Repositories/small-tools:"$PATH"
# Deliberately open-ended for appending



