#=============================================================================#
# Aliases                                                                     #
#=============================================================================#

alias python2='python'
alias python='python3'
alias ls='ls -AFGhlno' # n replaces username with numerical user id

#============================================================================#
# Personalization
#============================================================================#

# Original: \h:\W \u\$
export PS1='(>^_^)> '"\W \$ "

#============================================================================#
# History
#============================================================================#

export HISTSIZE=100000
export HISTFILESIZE=100000

# Append, don't overwrite
shopt -s histappend

# Add to history immediately, rather than on shell exit
echo foo
echo $PROMPT_COMMAND
echo bar
export PROMPT_COMMAND="$PROMPT_COMMAND; history -a; history -n"

# Don't save identical to prev
export HISTCONTROL=ignoredups

# Ignore certain commands
#export HISTIGNORE='ls:pwd' # Example
