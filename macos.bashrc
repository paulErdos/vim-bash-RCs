## !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!##
#               ---         Bash Initialization              ---              #
## -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- ##

# This works by
# 1. Login shell
#    * loads /etc/profile, then first readable among:
#      - bash profile
#      - ''   login
#      - ~/.profile
# 2. Interactive nonlogin shell
#    a. Reads /etc/bash.bashrc
#    b. Then reads ~/.bashrc

#============================================================================#
# Color
#============================================================================#

# See also ls colors in alternate section below.

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
    PS1='${debian_chroot:debian_chroot+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
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
fi

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'


#============================================================================#
# Personalization
#============================================================================#

# Original: \h:\W \u\$
export PS1='(>^_^)> '"\W \$ "
#export PS1='(>^_^)> '"${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$"
#export PS1='(>^_^)> '"\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$"


#============================================================================#
# History
#============================================================================#

export HISTSIZE=100000
export HISTFILESIZE=100000

# Append, don't overwrite
shopt -s histappend

# Add to history immediately, rather than on shell exit
#export PROMPT_COMMAND="$PROMPT_COMMAND; history; history -n"

# Don't save identical to prev
export HISTCONTROL=ignoredups

# Ignore certain commands
#export HISTIGNORE='ls:pwd' # Example

#============================================================================#
# Bastion, dms, hadooop                                                      #
#============================================================================#

#ssh-add /Users/vincentsteffens/.ssh/id_rsa 2> /dev/null

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

## Holy moly check out the command: dircolors -p; can also dircolors -p > ~/.dircolors
#alias ls='ls -lAFpgh --group-directories-first --color=auto -alv' # macosls cant group
alias ls='ls -lAFpgh --color=auto -alv'
export LS_COLORS="di=01;34:ln=01;35:ex=01;31:*.txt=01;32:*.sh=01;33:*=01;32:"

# ls notes i guess
#alias ls='ls -aFgh' # n replaces username with numerical user id
#alias ls='ls -alhFGioOps' # wide, everything

# Suffering is optional
function .. { cd '..'; }
function ... { cd '../..'; }
function .... { cd '../../..'; }


# Bash Ecosystem
# ---------------

# Use the patched version of GNU Screen that supports vertical splitting
#alias screen=/Users/developer/installed_stuff/screen.git/src/screen


# Python
# -----------

alias pip='pip3'
alias python2='/usr/bin/python'
alias python='python3'


# mysql
# -----------

alias mysql=/usr/local/mysql/bin/mysql
alias mysqladmin=/usr/local/mysql/bin/mysqladmin


# Kubernetes / k8s
# ------------------

# Begin aliases from Pete
alias k='kubectl'
alias kg='kubectl get'
alias ke='kubectl exec -it'
alias ka='kubectl apply -f'
alias kl='kubectl logs -f'
alias kc='kubectl config view'
alias ks='kubectl -n dmp-system'
alias clusters='aws eks list-clusters'
alias addCluster='aws eks update-kubeconfig --name'
alias devedit='k config use-context dev-edit-context'
alias devadmin='k config use-context dms-k8s-dev-EKS-Cluster'
alias intedit='k config use-context int-edit-context'
alias intadmin='k config use-context dms-k8s-int-EKS-Cluster'
alias efxedit='k config use-context equifax-enclave2'
alias awns='kg namespaces|grep "\-aw"'
alias set_aws_env.sh='source set_aws_env.sh'
alias kubeconnect.sh='source kubeconnect.sh'
alias 2-kubeconnect.sh='source 2-kubeconnect.sh'
alias keep_kubeconnected='source keep_kubeconnected'

function kcns { kubectl config set-context --current --namespace="$@"; }


# ???
# -----------

# Every time we cd, kick off cdes so what's displayed on the desktop tracks
# where we are
#alias cd='cd $1; cdes $1'



#============================================================================
# Environment Variables                                                      #
#============================================================================#

export GOPATH=~/Documents/Learning/go



#============================================================================#
# Node                                                                       #
#============================================================================#

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion



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
export PATH=$PATH:/Users/vincent/.local/bin
# Deliberately open-ended for appending

