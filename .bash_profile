#=============================================================================#
# Aliases                                                                     #
#=============================================================================#

alias python2='python'
alias python='python3'
alias ls='ls -alhF'
alias mysql=/usr/local/mysql/bin/mysql
alias mysqladmin=/usr/local/mysql/bin/mysqladmin

# Use the patched version of GNU Screen that supports vertical splitting
alias screen=/Users/developer/installed_stuff/screen.git/src/screen


#=============================================================================#
# Path                                                                        #
#=============================================================================#

# RULE: MY PATH COMES FIRST. NO PACKAGE MAY PREPEND THEIR GARBAGE TO MY PATH.

PATH=$PATH:/Users/developer/Stuff_Ive_Installed/gdb/build/gdb
PATH=$PATH:/Library/Frameworks/Python.framework/Versions/3.6/bin
PATH=$PATH:~/Documents/Utilities/mongodb/bin
PATH=$PATH:/Users/vincentsteffens/anaconda/bin

export PATH
