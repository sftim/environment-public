#!/bin/bash

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=80000
HISTFILESIZE=100000
export HISTTIMEFORMAT="%Y-%m-%dT%T "

if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

kubectl version --client > /dev/null 2>&1 && source <(kubectl completion bash)
kubectl version > /dev/null 2>&1 && source <(kubeadm completion bash)

[ -f ~/.bash_aliases ] && source ~/.bash_aliases
