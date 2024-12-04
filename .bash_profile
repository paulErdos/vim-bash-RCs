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

alias python2='/usr/bin/python'
alias python='python3'
alias ls='ls -AFGhlno' # n replaces username with numerical user id
#alias ls='ls -aFGhlo'
#alias ls='ls -alhFGioOps' # wide, everything
alias mysql=/usr/local/mysql/bin/mysql
alias mysqladmin=/usr/local/mysql/bin/mysqladmin

# Use the patched version of GNU Screen that supports vertical splitting
alias screen=/Users/developer/installed_stuff/screen.git/src/screen

alias set_aws_env.sh='source set_aws_env.sh'
alias kubeconnect.sh='source kubeconnect.sh'
alias 2-kubeconnect.sh='source 2-kubeconnect.sh'
alias keep_kubeconnected='source keep_kubeconnected'

alias pip='pip3'

# Begin aliases from Peter
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

function kcns { kubectl config set-context --current --namespace="$@"; }
function .. { cd '..'; }
function ... { cd '../..'; }
function .... { cd '../../..'; }
# End aliases from Peter

# Every time we cd, kick off cdes so what's displayed on the desktop tracks
# where we are
#alias cd='cd $1; cdes $1'


#============================================================================#
# Path                                                                       #
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

#============================================================================
# Environment Variables                                                      #
#============================================================================#

export GOPATH=~/Documents/Learning/go

#
### Conda stop plz. Added one # to each line below
## >>> conda initialize >>>
## !! Contents within this block are managed by 'conda init' !!
#__conda_setup="$('/Users/vincentsteffens/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
#if [ $? -eq 0 ]; then
#    eval "$__conda_setup"
#else
#    if [ -f "/Users/vincentsteffens/miniconda3/etc/profile.d/conda.sh" ]; then
#        . "/Users/vincentsteffens/miniconda3/etc/profile.d/conda.sh"
#    else
#        export PATH="/Users/vincentsteffens/miniconda3/bin:$PATH"
#    fi
#fi
#unset __conda_setup
## <<< conda initialize <<<
#


###
# Node
###

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
